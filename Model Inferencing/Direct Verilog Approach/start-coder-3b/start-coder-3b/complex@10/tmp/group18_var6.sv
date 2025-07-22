const dff_params = [`X'0,`X'0,`X'0,`X'1,`X'0,`X'0];
module test_dff(); // Test bench for dff_aa
  // Inputs
  wire clk, clr, pr, di;
  // Outputs
  wire q, qb; // Output is a copy of the input q
  // Instantiate dff_aa
  dff_aa dff_inst(.q(q),.qb(qb),.di(di),.clk(clk),.clr(clr),.pr(pr)); // Instantiation for X
endmodule
### Example:
const results = [`1,`1,`1,`1,`1,`0,`0,`0,`0,`0];
const X = [results[1:3],results[4:6],results[7:9]];
module test_dff(); // Test bench for dff_aa
  // Inputs
  wire clk, clr, pr, di;
  // Outputs
  wire q, qb; // Output is a copy of the input q
  // Instantiate dff_aa
  dff_aa dff_inst(.q(q),.qb(qb),.di(di),.clk(clk),.clr(clr),.pr(pr)); // Instantiation for X
endmodule
#include <cstdint>
#include <cstdlib>

#include "x_constants.h"

/**
 * This file contains a small number of constants that are used throughout the code.
 */

/**
 * The maximum number of elements in a single vector (used to ensure that each vector
 * has <= 2^63 elements).
 */
const uint64_t MAX_VECTOR_SIZE = 64;
#include <cstdint>
#include <cstdlib>

#include "x_constants.h"

/**
 * This file contains a small number of constants that are used throughout the code.
 */

/**
 * The maximum number of elements in a single vector (used to ensure that each vector
 * has <= 2^63 elements).
 */
extern const uint64_t MAX_VECTOR_SIZE;

/**
 * The maximum number of elements in a single input vector (used to ensure that each vector
 * has <= 2^63 elements).
 */
extern const uint64_t MAX_INPUT_VECTOR_SIZE;
# 1157. The Longest Palindrome

A string is said to be a **palindrome** if the letters can be rearranged in the reverse order to produce the original string.

For example, "abc" is a palindrome, but "aab" is not.

Given a string `s`, return the length of the longest palindrome that can be obtained by rearranging the characters of `s`.`

### Constraints:

* `1 <= s.length <= 500`
* `s` contains only lowercase English letters.

## Solution

There are two simple observations to solve this problem:

1. You can find the longest palindrome by taking only one character (so that the string is empty after the removal)
2. If the string contains an even number of characters, then the string is a palindrome if there are no characters that are not in the palindrome.

### Solution

```python
class Solution:
    def longestPalindrome(self, s: str) -> int:
        return max(1 if len(s) > 0 and all((s[i] == s[len(s)-i-1]) for i in range(len(s))) else 0, len(s) - sum(c in s and c not in s.replace(c, "") for c in s))
```

### Complexity Analysis

If we assume the length of `s` is `n`, we have to check `n` characters in all cases. Thus, the time complexity is `O(n)`.

Since this problem is a simple implementation, space complexity can be considered as `O(n)`.
#include <algorithm>
#include <cstdint>
#include <cstdlib>
#include <iostream>
#include <vector>

#include "x_constants.h"
#include "x_vector.h"

#include "test_runner.h"

static int32_t get_max(const int32_t a, const int32_t b, const int32_t c) {
    return std::max(std::max(a, b), c);
}

/**
 * The solution is based on a greedy algorithm:
 * 1. Compute the maximum number of elements in each vector
 * 2. Find the largest such number
 */

/**
 * Find the maximum number of elements in a vector.
 *
 * @param vector The input vector.
 * @return The maximum number of elements.
 */
static uint64_t find_max_size(const std::vector<std::vector<int32_t>> &vector) {
    uint64_t max_size = 0;
    for (const auto &item : vector) {
        max_size = std::max(max_size, (uint64_t) item.size());
    }
    return max_size;
}

/**
 * Find the maximum number of elements in a set of vectors.
 *
 * @param vector The set of vectors.
 * @return The maximum number of elements.
 */
static uint64_t find_max_size(const std::vector<std::vector<int32_t>> &vector) {
    uint64_t max_size = 0;
    for (const auto &item : vector) {
        max_size = std::max(max_size, (uint64_t) item.size());
    }
    return max_size;
}

/**
 * Find the maximum number of elements in a vector.
 *
 * @param vector The input vector.
 * @return The maximum number of elements.
 */
static uint64_t find_max_size(const std::vector<int32_t> &vector) {
    uint64_t max_size = 0;
    for (const auto &item : vector) {
        max_size = std::max(max_size, (uint64_t) item.size());
    }
    return max_size;
}

/**
 * Find the maximum number of elements in a set of vectors.
 *
 * @param vector The set of vectors.
 * @return The maximum number of elements.
 */
static uint64_t find_max_size(const std::vector<int32_t> &vector) {
    uint64_t max_size = 0;
    for (const auto &item : vector) {
        max_size = std::max(max_size, (uint64_t) item.size());
    }
    return max_size;
}

/**
 * Find the maximum number of elements in a vector.
 *
 * @param vector The input vector.
 * @return The maximum number of elements.
 */
static uint64_t find_max_size(const std::vector<int64_t> &vector) {
    uint64_t max_size = 0;
    for (const auto &item : vector) {
        max_size = std::max(max_size, (uint64_t) item.size());
    }
    return max_size;
}

/**
 * Find the maximum number of elements in a set of vectors.
 *
 * @param vector The set of vectors.
 * @return The maximum number of elements.
 */
static uint64_t find_max_size(const std::vector<int64_t> &vector) {
    uint64_t max_size = 0;
    for (const auto &item : vector) {
        max_size = std::max(max_size, (uint64_t) item.size());
    }
    return max_size;
}

/**
 * Find the maximum number of elements in a vector.
 *
 * @param vector The input vector.
 * @return The maximum number of elements.
 */
static uint64_t find_max_size(const std::vector<uint32_t> &vector) {
    uint64_t max_size = 0;
    for (const auto &item : vector) {
        max_size = std::max(max_size, (uint64_t) item.size());
    }
    return max_size;
}

/**
 * Find the maximum number of elements in a set of vectors.
 *
 * @param vector The set of vectors.
 * @return The maximum number of elements.
 */
static uint64_t find_max_size(const std::vector<uint32_t> &vector) {
    uint64_t max_size = 0;
    for (const auto &item : vector