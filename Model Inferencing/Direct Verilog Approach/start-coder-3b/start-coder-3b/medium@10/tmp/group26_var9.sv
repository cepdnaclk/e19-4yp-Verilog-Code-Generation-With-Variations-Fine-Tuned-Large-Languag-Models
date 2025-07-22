module example5(x1, x2, x3, f);
input x1, x2, x3;
output f;
reg f;
always @(x1 or x2 or x3)
    if ((x2 >= 1) && (x2 <= 2))
        f = x1;
    else
        f = x3;
endmodule
### Verilog Simulation Results:
The simulation result is same as above.
### Problems:
None.
/src/main/resources/static/js/main.js
$(document).ready(function () {

    $('#sidebarCollapse').on('click', function () {
        $('#sidebar').toggleClass('active');
    });

    var codeMirror = CodeMirror.fromTextArea(document.getElementById("code"), {
        lineNumbers: true,
        mode: "verilog",
        theme:'monokai'
    });

    // var code = document.getElementById("code").value;
    // document.getElementById("code").value = code.replace(/\n/g, "<br>");

    // var code = document.getElementById("code").value;
    // document.getElementById("code").value = code.replace(/^\s*/g, "");
    // document.getElementById("code").value = document.getElementById("code").value.replace(/\n[ \t]*\n/gi, "\n");

    // var url = "/parse?code=" + encodeURIComponent(document.getElementById("code").value);
    // var request = new XMLHttpRequest();
    // request.open("GET", url, true);
    // request.onload = function() {
    //     // Begin accessing JSON data here
    //     var json = JSON.parse(this.response);
    //     if (request.status >= 200 && request.status < 400) {
    //         document.getElementById("parse").value = JSON.stringify(json);
    //         console.log(json);
    //     }
    // }
    // request.send();

    $('#btn-run').click(function () {
        var code = document.getElementById("code").value;
        var url = "/run?code=" + encodeURIComponent(document.getElementById("code").value);
        var request = new XMLHttpRequest();
        request.open("GET", url, true);
        request.onload = function() {
            // Begin accessing JSON data here
            var json = JSON.parse(this.response);
            if (request.status >= 200 && request.status < 400) {
                document.getElementById("out").value = JSON.stringify(json.stdout);
                document.getElementById("err").value = JSON.stringify(json.stderr);
                // console.log(json);
            }
        }
        request.send();
    });

});/src/main/java/com/test/web/controller/MainController.java
package com.test.web.controller;

import com.test.web.model.Output;
import com.test.web.model.Request;
import com.test.web.service.RequestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class MainController {

    @Autowired
    RequestService requestService;

    @GetMapping("/")
    public String index(RedirectAttributes redirectAttributes) {
        redirectAttributes.addFlashAttribute("request", new Request());
        return "redirect:/new";
    }

    @PostMapping("/save")
    public String request(Request request, RedirectAttributes redirectAttributes) {
        requestService.save(request);
        redirectAttributes.addFlashAttribute("request", request);
        return "redirect:/list";
    }

    @GetMapping("/new")
    public String new_(RedirectAttributes redirectAttributes) {
        redirectAttributes.addFlashAttribute("request", new Request());
        return "new";
    }

    @GetMapping("/list")
    public String list(RedirectAttributes redirectAttributes) {
        redirectAttributes.addFlashAttribute("requests", requestService.index());
        return "list";
    }

    @GetMapping("/parse")
    public String parse(String code, RedirectAttributes redirectAttributes) {
        Output output = requestService.parse(code);
        redirectAttributes.addFlashAttribute("request", new Request(code, output.getSyntaxTree(), output.getIntermediateRepresentation()));
        return "parse";
    }

    @GetMapping("/run")
    public String run(String code, RedirectAttributes redirectAttributes) {
        Output output = requestService.run(code);
        redirectAttributes.addFlashAttribute("request", new Request(code, "", output.getStdout()));
        return "run";
    }

}
/src/main/java/com/test/web/service/RequestService.java
package com.test.web.service;

import com.test.web.model.Output;
import com.test.web.model.Request;
import com.test.web.model.Response;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ru.lanwen.verilog.ast.ASTNode;
import ru.lanwen.verilog.parser.VerilogParser;
import ru.lanwen.verilog.parser.ast.DesignUnitVisitor;
import ru.lanwen.verilog.parser.ast.Statement;
import ru.lanwen.verilog.parser.ast.VerilogAST;
import ru.lanwen.verilog.parser.ast.visitor.ASTVisitorUtils;

import java.io.IOException;
import java.io.StringReader;
import java.util.logging.Logger;

@Service
public class RequestService {
    private final static Logger logger = Logger.getLogger(RequestService.class.getName());

    private final ParseService parseService;

    private final RunService runService;

    @Autowired
    public RequestService(ParseService parseService, RunService runService) {
        this.parseService = parseService;
        this.runService = runService;
    }

    public void save(Request request) {

    }

    public Response run(String code) {
        return runService.run(code);
    }

    public Response parse(String code) {
        return parseService.parse(code);
    }

    public Response index() {
        return null;
    }
}
/README.md
# verilog-compiler

## Usage

```
$ git clone :TeddyZhao/verilog-compiler.git
$ cd verilog-compiler
$ mvn spring-boot:run
```
/src/main/java/com/test/web/model/Request.java
package com.test.web.model;

public class Request {
    private String code;
    private String syntaxTree;
    private String intermediateRepresentation;
    private String output;

    public Request() {
    }

    public Request(String code) {
        this.code = code;
    }

    public Request(String code, String syntaxTree, String intermediateRepresentation) {
        this.code = code;
        this.syntaxTree = syntaxTree;
        this.intermediateRepresentation = intermediateRepresentation;
    }

    public Request(String code, String syntaxTree, String intermediateRepresentation, String output) {
        this.code = code;
        this.syntaxTree = syntaxTree;
        this.intermediateRepresentation = intermediateRepresentation;
        this.output = output;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getSyntaxTree() {
        return syntaxTree;
    }

    public void setSyntaxTree(String syntaxTree) {
        this.syntaxTree = syntaxTree;
    }

    public String getIntermediateRepresentation() {
        return intermediateRepresentation;
    }

    public void setIntermediateRepresentation(String intermediateRepresentation) {
        this.intermediateRepresentation = intermediateRepresentation;
    }

    public String getOutput() {
        return output;
    }

    public void setOutput(String output) {
        this.output = output;
    }
}
/src/main/resources/static/js/code.js
$(document).ready(function () {

    var codeMirror = CodeMirror.fromTextArea(document.getElementById("code"), {
        lineNumbers: true,
        mode: "verilog",
        theme:'monokai'
    });

    $('#btn-run').click(function () {
        var code = codeMirror.getValue();
        var url = "/run?code=" + encodeURIComponent(code);
        var request = new XMLHttpRequest();
        request.open("GET", url, true);
        request.onload = function() {
            // Begin accessing JSON data here
            var json = JSON.parse(this.response);
            if (request.status >= 200 && request.status < 400) {
                document.getElementById("out").value = JSON.stringify(json.stdout);
                document.getElementById("err").value = JSON.stringify(json.stderr);
                console.log(json);
            }
        }
        request.send();
    });

});/src/main/resources/application.properties
spring.http.encoding.charset=UTF-8
server.encoding