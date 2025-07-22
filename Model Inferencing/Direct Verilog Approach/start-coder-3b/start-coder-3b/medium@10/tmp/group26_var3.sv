module example5(x1, x2, x3, f);
input x1, x2, x3;
output f;
reg f;
always @(x1 or x2 or x3) begin
    if (x2 == 1 && x1 >= 4) begin
        f = x1;
    end
    else
        f = x3;
endmodule
/docs/docs/content/articles/tools/hwt/hwt-design-guide/hwt-design-guide-6-component-hierarchy.md
---
title: "6. Component Hierarchy"
linkTitle: "6. Component Hierarchy"
weight: 6
date: 2020-04-07
description: >
  This is the second part of the "High-Level-View" of the HWT-Framework, which introduces the component hierarchy.
---

# 6. Component Hierarchy

This is the second part of the "High-Level-View" of the HWT-Framework, which introduces the component hierarchy.



<!--more-->

## Introduction

In the examples, you already know how to declare new components. Now we continue to extend our knowledge by adding another level to the hierarchy of components.

## Component-Level and Parameter-Level Hierarchy

It is important to know that the level of a component in the component hierarchy and the level of its parameters are not the same. The level of a component is, of course, the level of its outermost components (of the outermost component, see Figure 3). The level of its parameters is the level of all the parameters of the component within which he is declared. In the HWT, this means that the level of a component is the level of its outermost block component. This component is the outermost component, which is declared in the file "comp.v".

![hwt-design-guide-6-component-hierarchy-1](hwt-design-guide-6-component-hierarchy-1.png)


In the example of the component "comp_a", the level of the parameter "p_a" is 1, because only this parameter is declared at the outermost level of the component.

What happens when you declare a second parameter with the same name in the block of the component?

![hwt-design-guide-6-component-hierarchy-2](hwt-design-guide-6-component-hierarchy-2.png)


The parameter "p_a" is now at level 2.

However, the second parameter is still only declared at the outermost level of the component. The level of this parameter is only 1. If you declare a third parameter with the same name in the block of the component, it will also become level 2.

## Adding a Level to the Component Hierarchy

You can use the level to extend the component hierarchy. In order to do this, you need to add in the component a component of the same level as the component itself.
The following example shows how to add a level to the hierarchy of components. In this example, the levels of the components "comp_a" and "comp_b" are 1 and 2, respectively. The level of the component "comp_c" is 3. This level means that it is declared in the level 2 block of the component "comp_a".

![hwt-design-guide-6-component-hierarchy-3](hwt-design-guide-6-component-hierarchy-3.png)


This example shows how to add a level to the hierarchy of components. In this example, the levels of the components "comp_a" and "comp_b" are 1 and 2, respectively. The level of the component "comp_c" is 3. This level means that it is declared in the level 2 block of the component "comp_a".

To achieve this, you need to change the parameter of the component "comp_b" because it is not the outermost block of the component "comp_a". The parameter of the component "comp_b" is in fact a parameter of the component "comp_a".

![hwt-design-guide-6-component-hierarchy-4](hwt-design-guide-6-component-hierarchy-4.png)


Using the block parameter "comp_a.p_a" in the parameter of the component "comp_b", you can access the parameter of the block "comp_a".

![hwt-design-guide-6-component-hierarchy-5](hwt-design-guide-6-component-hierarchy-5.png)


## Block Parameters of Blocks of Component

A parameter that is declared in the block of a block is called a block parameter. For example, a signal of the block "comp_a" is a block parameter of the component "comp_a".

Each parameter is accessed differently. For each component, a level is calculated depending on the outermost component at which the parameter is declared.

For a block parameter, the level of the parameter is the level of the block of the block of which the parameter is declared.

Hence, if you declare a parameter in the block of a block of a block, the level of the parameter is 3.

![hwt-design-guide-6-component-hierarchy-6](hwt-design-guide-6-component-hierarchy-6.png)


## Declaration in a Component

The declaration of a block parameter in a component happens in two steps.

First you need to declare the block parameters in the block. This declaration of the block parameters depends on the level of the component.

Secondly, you need to define the parameters of the component. This definition of the parameters can be in the component itself or in the block of the component. This definition of the parameters depends on the level of the component.

## Declaration of Block Parameters

As you know already, the declaration of a block parameter in a component is necessary to be able to refer to the block parameter in the component.

The declaration of block parameters in a component happens in two steps.

First you need to declare the block parameters in the block. This declaration of the block parameters depends on the level of the component.

![hwt-design-guide-6-component-hierarchy-7](hwt-design-guide-6-component-hierarchy-7.png)


Secondly, you need to define the parameters of the component. This definition of the parameters can be in the component itself or in the block of the component. This definition of the parameters depends on the level of the component.

## Definition of Parameters

As you know already, the definition of a parameter of a component is necessary to be able to refer to the parameter of the component.

The definition of parameters of a component happens in two steps.

First you need to define the parameters in the block. This definition of the parameters depends on the level of the component.

![hwt-design-guide-6-component-hierarchy-8](hwt-design-guide-6-component-hierarchy-8.png)


Secondly, you need to declare the parameters of the component. This declaration of the parameters can be in the component itself or in the block of the component. This declaration of the parameters depends on the level of the component.

## Parameters of Components

When you want to refer to a parameter of the component, you need to declare it in the component.

The following example shows how to declare and define the parameter "p_a" of the component "comp_a".

![hwt-design-guide-6-component-hierarchy-9](hwt-design-guide-6-component-hierarchy-9.png)


When you want to refer to a parameter of the component, you need to declare it in the component.

The following example shows how to declare and define the parameter "p_a" of the component "comp_a".

![hwt-design-guide-6-component-hierarchy-10](hwt-design-guide-6-component-hierarchy-10.png)


When you want to refer to a parameter of the component, you need to declare it in the component.

The following example shows how to declare and define the parameter "p_a" of the component "comp_a".

![hwt-design-guide-6-component-hierarchy-11](hwt-design-guide-6-component-hierarchy-11.png)


When you want to refer to a parameter of the component, you need to declare it in the component.

The following example shows how to declare and define the parameter "p_a" of the component "comp_a".

![hwt-design-guide-6-component-hierarchy-12](hwt-design-guide-6-component-hierarchy-12.png)


## Component Levels and Block Parameters of Components

A component has a component level (at which the component is declared). The component level of the component "comp_a" is 2.

A component has block parameters of its own (block parameters of which the component is declared). The block parameter of the component "comp_a" is a signal "s_