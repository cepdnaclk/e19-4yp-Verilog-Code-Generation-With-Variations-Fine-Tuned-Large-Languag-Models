```verilog
module dffen(output logic o, input logic i, input logic en);
endmodule
```
### Generated Verilog:
```verilog
module dffen(o,i,en)
// dffen
  output logic o;
  input logic i;
  input logic en;
  assign o=i;
endmodule
```
### Description:
The `assign` statement inside the `dffen` block is the same as the assignment statement inside the parent module. Therefore, we merge them into a single block and add the `assign` statement inside the parent module.
### Change Request Link:
https://github.com/open-source-flow/open-source-flow/pull/24# O-S Flow: A Framework for Open-Source Verilog Flow Automation

[![N|Solid](https://www.open-source-flow.org/images/logo.png)](https://www.open-source-flow.org)

## O-S Flow Demo Link:
https://demo.open-source-flow.org

## Introduction
This repository contains all the code related to the Open-Source Flow, including the O-S Flow Framework, O-S Flow Web Interface, and O-S Flow Web Worker. Each folder contains the code for a specific component of the O-S Flow.

For more information about the O-S Flow, please check out our [project page](https://www.open-source-flow.org).

## Web Interface Components
The Web Interface is implemented as a PWA (Progressive Web Application), which means it can run directly on any modern browser on any platform.

The Web Interface is composed of three modules:

* O-S Flow Framework: A framework implemented in TypeScript that contains the core logic of the O-S Flow. It consists of the main entry point `index.ts` and the rest of the core code in the `code/` folder.
* O-S Flow Web Interface: The main front-end code of the O-S Flow Web Interface. It consists of the core code in the `web/` folder.
* O-S Flow Web Worker: The worker code of the O-S Flow Web Interface. It consists of the core code in the `worker/` folder.

To build the Web Interface, run the following commands:

```shell
cd web/
npm i
npm run build
npm run build:sw
```

## Web Worker
The Web Worker supports three different services: `compile`, `extract`, and `transform`. Each service is implemented as a dedicated worker in `worker/src/index.ts`.

To build the Web Worker, run the following commands:

```shell
cd worker/
npm i
npm run build
```

## License

MIT# O-S Flow: A Framework for Open-Source Verilog Flow Automation

[![N|Solid](https://github.com/open-source-flow/open-source-flow/blob/master/images/logo.png)](https://www.open-source-flow.org)

## O-S Flow Demo Link:
https://demo.open-source-flow.org

## Introduction
This repository contains all the code related to the Open-Source Flow, including the O-S Flow Framework, O-S Flow Web Interface, and O-S Flow Web Worker. Each folder contains the code for a specific component of the O-S Flow.

For more information about the O-S Flow, please check out our [project page](https://www.open-source-flow.org).
# O-S Flow: A Framework for Open-Source Verilog Flow Automation

[![N|Solid](https://github.com/open-source-flow/open-source-flow/blob/master/images/logo.png)](https://www.open-source-flow.org)

## O-S Flow Demo Link:
https://demo.open-source-flow.org

## Introduction
This repository contains all the code related to the Open-Source Flow, including the O-S Flow Framework, O-S Flow Web Interface, and O-S Flow Web Worker. Each folder contains the code for a specific component of the O-S Flow.

For more information about the O-S Flow, please check out our [project page](https://www.open-source-flow.org).

## O-S Flow Framework
The O-S Flow Framework is implemented inTypeScript and depends on PicoSAT, which is a SAT solver.
This repository contains the O-S Flow Framework implementation. It consists of the core logic of the framework.

To build the O-S Flow Framework, run the following commands:

```shell
cd code/
npm i
npm run build
```module.exports = {
    mode: "development",
    entry: {
        index: "./build/index.js",
        worker: "./build/worker.js"
    },
    resolve: {
        extensions: [".js"]
    },
    output: {
        path: "./dist",
        filename: "[name].js"
    },
    module: {
        rules: [
            {
                test: /\.(j|t)s$/,
                exclude: /node_modules/
            }
        ]
    },
    devServer: {
        contentBase: './dist'
    }
}import { VerilogParser } from'verilog-parser';
import { VerilogWriter } from'verilog-writer';
import { VerilogInstance } from'verilog-writer/dist/lib/verilog/instance';
import { isInstance, isDeclaration } from'verilog-writer/dist/lib/verilog/ast';
import { VerilogToken } from'verilog-parser/dist/lib/verilog/parser';
import { VerilogAST } from'verilog-writer/dist/lib/verilog/ast';
import { VerilogParserError } from'verilog-parser/dist/lib/verilog/error';
import { VerilogWriterError } from'verilog-writer/dist/lib/verilog/error';
import { SyntaxTree } from'verilog-parser/dist/lib/verilog/ast';

const { ParserError, TokenError } = VerilogParserError;
const { WriterError } = VerilogWriterError;

export class Core {
    /**
     * Check if input is a string
     * @param {any} obj 
     */
    isString(obj) {
        return Object.prototype.toString.call(obj) === '[object String]';
    }

    /**
     * Check if input is a number
     * @param {any} obj 
     */
    isNumber(n) {
        return!isNaN(parseFloat(n)) && isFinite(n);
    }

    /**
     * Parse input Verilog file to a Syntax Tree
     * @param {string} input 
     */
    parseVerilog(input: string) {
        let verilogAST: SyntaxTree;
        let parser = new VerilogParser();
        try {
            verilogAST = parser.parse(input);
        } catch (e) {
            if (e instanceof ParserError) {
                const error = new SyntaxTree([], [],