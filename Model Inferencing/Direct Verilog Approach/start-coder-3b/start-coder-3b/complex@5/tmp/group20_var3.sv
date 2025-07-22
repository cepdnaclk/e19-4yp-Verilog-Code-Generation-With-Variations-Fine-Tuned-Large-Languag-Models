~~~

### Description

The `inside` modifier can be used to check if a variable is inside a given set of constants. This can be useful for checking if a variable is constant from a package or another component.

- For `inside`, the array must be a constant definition and be defined at the component level.
-  The array can be of any dimensions.
- If the array is of a single dimension, it can be accessed by using an array index. However if the array is of higher dimensions, it can be accessed using a list of indices.

There are some limitations on the way constant definitions can be accessed.

### Example

~~~
module mixed_sim;
reg dcontrol, x, y;
reg