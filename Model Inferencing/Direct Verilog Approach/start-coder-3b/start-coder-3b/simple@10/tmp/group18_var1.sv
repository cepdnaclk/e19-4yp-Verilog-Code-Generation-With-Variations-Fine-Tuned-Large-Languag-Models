module inst_flop(a,d,s,q);
  input a, b, c;
  output d, q;

  typedef enum logic [1:0] { DEFAULT, NON_DEFAULT } my_enum;

  packed struct my_struct {
    my_enum A, B;
  } default_input_str, non_default_input_str;

  default_input_str default_input_str_inst =.A(DEFAULT),.B(NON_DEFAULT);
  non_default_input_str non_default_input_str_inst =.A(NON_DEFAULT),.B(DEFAULT);

  assign d = b | c;
  assign q = a & d;
endmodule

## Module instantiation as a block
// Copyright lowRISC contributors.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0

use crate::ast::*;
use crate::error::Error;
use crate::position::Pos;
use crate::token::{Token, TokenKind};

/// The scanner produces tokens matching the grammar.
pub struct Scanner<'a> {
    // The source code to be tokenized.
    src: &'a str,

    // The location of the current token within `src`.
    pos: Pos,

    // The next token to be returned.
    tok: Token<'a>,

    // The next token to be generated.
    next: Token<'a>,
}

/// Helper struct for lexical analysis.
struct Analyze<'a> {
    pos: Pos,
    tok: Token<'a>,
}

impl<'a> Analyze<'a> {
    /// Creates a new `Analyze` object.
    fn new(pos: Pos, tok: Token<'a>) -> Self {
        Analyze { pos, tok }
    }

    /// Consumes this `Analyze` object and generates the next token.
    fn next(&mut self, src: &'a str) -> Option<Token<'a>> {
        self.tok = self.tok.next(src)?;
        Some(self.tok.clone())
    }
}

impl<'a> Scanner<'a> {
    /// Creates a