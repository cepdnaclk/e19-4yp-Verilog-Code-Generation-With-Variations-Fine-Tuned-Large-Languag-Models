module tst_dff_pbeh();
  logic [3:0] di,clk; logic [3:0] do;
  dff_p d1(do,di,clk); // Instantiate DFF with path delay
  initial begin clk=0; di=1'b0; #35 $stop; end // Initialize & stop
  always #3 clk=~clk; // Generate clock (negedges at 6, 12, 18...)
  always #5 di=~di; // Toggle data
  initial $monitor($time,"clk=%b, di=%b, do=%b",clk,di,do);
endmodule
/src/main/java/edu/udel/cse/util/ClockedProcess.java
package edu.udel.cse.util;

import com.github.cambridgehackers.squirrel.core.exprs.Expr;
import com.github.cambridgehackers.squirrel.core.nodes.Block;
import com.github.cambridgehackers.squirrel.core.nodes.Statement;
import com.github.cambridgehackers.squirrel.core.nodes.Statement.StatementContext;
import com.github.cambridgehackers.squirrel.core.nodes.StatementImpl;
import com.github.cambridgehackers.squirrel.core.nodes.Stmt;
import com.github.cambridgehackers.squirrel.core.nodes.Stmt.StmtContext;
import com.github.cambridgehackers.squirrel.core.nodes.Stmt.StmtContext.StmtContextImpl;

/**
 * A {@link com.github.cambridgehackers.squirrel.core.nodes.Statement} that
 * creates a clocked process.
 */
public class ClockedProcess extends StatementImpl {
    private Expr clk;
    private Stmt stmts;
    private Statement stmt;

    /**
     * Constructs a new {@code ClockedProcess}.
     *
     * @param context
     *            {@link StatementContext} object.
     * @param clk
     *            A {@link com.github.cambridgehackers.squirrel.core.exprs.Expr}
     *            object.
     * @param body
     *            A {@link com.github.cambridgehackers.squirrel.core.nodes.Block}
     *            object.
     */
    public ClockedProcess(StmtContext context, Expr clk, Block body) {
        super(context);
        this.clk = clk;
        this.stmts = body;
        this.stmt = new StmtContextImpl(context, clk);
        setStmts(stmts);
    }

    /**
     * The statement that will be part of the clocked process.
     *
     * @return A {@link Statemnt}.
     */
    public Statement getStmt() {
        return this.stmt;
    }

    /**
     * An {@link Statement} that contains a single statement with the clocked
     * process body.
     *
     * @return An {@link Statement}.
     */
    @Override
    public Statement getStmts() {
        return this.stmt;
    }

    /**
     * A {@link Stmt} that contains the clocked process body.
     *
     * @param stmts
     *            A {@link Stmt}.
     */
    @Override
    public void setStmts(Stmt stmts) {
        this.stmts = stmts;
        this.stmt.setStmts(stmts);
    }

    /**
     * Returns a {@link Expr} that represents the clock.
     *
     * @return A {@link Expr}.
     */
    public Expr getClk() {
        return this.clk;
    }

    /**
     * Sets a new {@link Expr} for the clock.
     *
     * @param clk
     *            A {@link Expr}.
     */
    public void setClk(Expr clk) {
        this.clk = clk;
    }

    /**
     * Returns a {@link Block} that represents the body of the clocked process.
     *
     * @return A {@link Block}.
     */
    public Block getBody() {
        return this.stmts.getBody();
    }

    /**
     * Sets a new {@link Block} for the body of the clocked process.
     *
     * @param body
     *            A {@link Block}.
     */
    public void setBody(Block body) {
        this.stmts.setBody(body);
    }

}
/src/main/java/edu/udel/cse/util/ClockedProcessBuilder.java
package edu.udel.cse.util;

import com.github.cambridgehackers.squirrel.core.exprs.Expr;
import com.github.cambridgehackers.squirrel.core.nodes.Block;

/**
 * Class that is used to build a clocked process.
 */
public class ClockedProcessBuilder {
    private Expr clk;
    private Block body;

    /**
     * Constructs a new {@code ClockedProcessBuilder}.
     *
     * @param clk
     *            A {@link Expr}.
     * @param body
     *            A {@link Block}.
     */
    public ClockedProcessBuilder(Expr clk, Block body) {
        this.clk = clk;
        this.body = body;
    }

    /**
     * Sets the {@code clkExpr} for the clocked process.
     *
     * @param clk
     *            A {@link Expr}.
     * @return A {@code ClockedProcessBuilder}.
     */
    public ClockedProcessBuilder withClk(Expr clk) {
        this.clk = clk;
        return this;
    }

    /**
     * Sets the {@code body} of the clocked process.
     *
     * @param body
     *            A {@link Block}.
     * @return A {@code ClockedProcessBuilder}.
     */
    public ClockedProcessBuilder withBody(Block body) {
        this.body = body;
        return this;
    }

    /**
     * Returns a {@link ClockedProcess} that represents the clocked process.
     *
     * @return A {@link ClockedProcess}.
     */
    public ClockedProcess build() {
        return new ClockedProcess(null, clk, body);
    }
}
/README.md
# Squirrel Extension

[![Build Status](https://github.com/cambridgehackers/squirrel-extension/workflows/CI/badge.svg)](https://github.com/cambridgehackers/squirrel-extension/actions?query=workflow%3ACI)

This extension contains macros and utilities for [Squirrel](https://squirrel-lang.github.io/).

## Using This Extension

To use this extension, add this extension to the root of your Squirrel project's dependencies:
```
{
	"dependencies": [
		{
			"name": "squirrel-extension",
			"url": "https://github.com/cambridgehackers/squirrel-extension.git"
		}
	]
}
```

The following macros are provided by this extension:

### `clocked_process`
```
clocked_process(clk, body)
```
This macro takes two arguments:
* A clock signal
* A block of statements to be processed by a clocked process

Example:
```verilog
clocked_process(clk, [
	reg a, b, c;

	always @(posedge clk) begin
		a <= b + c;
	end
]);
```

### `with_clock`
```
with_clock(clk, body)
```
This macro provides a block of statements with a clock signal.

Example:
```verilog
with_clock(clk, [
	reg a, b, c;

	always @(posedge clk) begin
		a <= b + c;
	end
]);
```

### `test`
```
test(testName, test)
```
This macro takes a test name and an expression.

Example:
```verilog
test("Test name", 1 == 1);
```

## Related Projects

* [Squirrel](https://docs.squirrel-lang.org/) - A new programming language for embedded systems.
* [Squirrel Syntax Hierarchy](https://github.com/cambridgehackers/squirrel-syntax-hierarchy) - A graphical representation of the syntax tree of Squirrel.
* [Squirrel Syntax Highlighters](https://github.com/cambridgehackers/squirrel-syntax-highlighters) - Syntax highlighters for various editors using Squirrel.
* [Squirrel Extension for Atom](https://github.com/cambridgehackers/squirrel-extension-atom) - An Squirrel Atom extension.
/CHANGELOG.md
# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]
### Added
- `test` function