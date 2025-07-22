{% highlight verilog %}
always @(s or A or C)
    case (s)
        0: F = 4'b0000;
        1: F = inside(A, C, 0, A);
        2: F = inside(0, C, 0, A);
        3: F = inside(0, C, 0, A);
        4: F = A ^ B;
        5: F = A | B;
        6: F = A & B;
        7: F = 4'b1111;
    endcase
endmodule
{% endhighlight %}
/_posts/2015-11-16-how-to-analyze-a-control-flow-graph.md
---
layout: post
title: "How to Analyze a Control Flow Graph"
date: 2015-11-16 15:00:00
---

## Introduction

Control flow graph (CFG) is a directed graph with nodes representing basic blocks of code and edges representing the flow of control. Each node represents a basic block and the edges represent the flow of control between the basic blocks. CFG is a useful representation of the flow of control of a program. Given a CFG, it is possible to reconstruct the source code of the program. The source code is the combination of the source code of all the files needed to compile the program. However, it would be difficult to reconstruct the source code from a CFG.

The source code is the combination of the source code of all the files needed to compile the program. However, it would be difficult to reconstruct the source code from a CFG.

## Basic Blocks

A **basic block** is a sequence of instructions within a program. There are several possible definitions of basic blocks, but a common definition is the sequence of statements that are reachable from a particular node of the CFG. If there are no jumps in the program, then each basic block is reachable from its own node.

The example below shows a simple program and its CFG.

![{{ page.title | escape }}]({{ site.baseurl }}/assets/images/how-to-analyze-a-control-flow-graph/basic-blocks.png){:height="300px"}

## Basic Block Edges

The **edges** of a basic block indicate the control flow of the program and can be represented as arrows between the basic blocks. There are different types of edges as shown below.

- **Unconditional Edge**

  A unconditional edge is an edge that always flows from one basic block to another. Unconditional edges point from the entry node of a basic block to the exit node of another basic block. In the example above, the entry node of basic block `B` is connected to the exit node of basic block `F`.

- **Conditional Edge**

  A conditional edge is an edge that can flow from either of two basic blocks, depending on a condition. Conditional edges point from the exit node of one basic block to the entry node of another basic block. In the example above, the entry node of basic block `F` is connected to the exit node of basic block `C` and the exit node of basic block `C` is connected to the entry node of basic block `D`.

- **Loop Edge**

  A loop edge is a special type of conditional edge that can represent a loop. In most machine-learning applications, there may be several loops that are independent of each other. In such cases, each loop can be represented as a loop edge.

- **Join Edge**

  A join edge is an edge that connects two or more basic blocks. In the example above, the entry node of basic block `C` is connected to the exit nodes of basic blocks `D` and `E`.

- **Return Edge**

  A return edge is an edge that connects a basic block to the exit node of the program. In the program shown above, the exit node is connected to the entry node of basic block `J`.

- **Throw Edge**

  A throw edge is an edge that connects a basic block to the exit node of the program. In the program shown above, the exit node is connected to the entry node of basic block `G`.

## Back Edges

A **back edge** is an edge that points backwards in the CFG. Back edges are also called **back-edges**. Back edges can occur on unconditional and conditional edges.

The example below shows a CFG and its back edges.

![{{ page.title | escape }}]({{ site.baseurl }}/assets/images/how-to-analyze-a-control-flow-graph/back-edge.png){:height="300px"}

## Forward Edges

A **forward edge** is an edge that points forwards in the CFG. In general, there are more forward edges than back edges in a CFG.

## Cross Edges

A **cross edge** is an edge that crosses the edge between two basic blocks in the CFG. A cross edge is also called a **cross-edge**.

The example below shows a CFG with multiple cross edges.

![{{ page.title | escape }}]({{ site.baseurl }}/assets/images/how-to-analyze-a-control-flow-graph/cross-edges.png){:height="400px"}

## Directed Acyclic Graph

A **directed acyclic graph** or **DAG** is a directed graph that does not contain any cycles. A cycle is a directed path that starts and ends at the same node.

A CFG can be decomposed into a chain of DAGs. The first node of the first DAG is the entry node of the CFG. The last node of the last DAG is the exit node of the CFG. A CFG is said to be **acyclic** if it is a DAG and a CFG is said to be **acyclic** if it is a chain of DAGs.

The example below shows a CFG with multiple nodes and multiple cross-edges.

![{{ page.title | escape }}]({{ site.baseurl }}/assets/images/how-to-analyze-a-control-flow-graph/dag.png){:height="200px"}

The example below shows a CFG with more than two nodes and multiple cross-edges.

![{{ page.title | escape }}]({{ site.baseurl }}/assets/images/how-to-analyze-a-control-flow-graph/dag-2.png){:height="200px"}

## Non-Acyclic Graph

A **non-acyclic graph** or **non-DAG** is a non-directed graph that does not contain any cycles.

## SCCs

A **strongly connected component** or **SCC** is subgraph within a directed graph.

The example below shows a CFG with SCCs.

![{{ page.title | escape }}]({{ site.baseurl }}/assets/images