import 'dart:math';

void main() {
  print(maxProduct([2, 3, -2, 4]));
  print(maxProduct([-2, 0, -1]));
}

// Maximum Product Subarray
// Problem statement
/*
Given an integer array nums, find a subarray that has the largest product, 
and return the product.

The test cases are generated so that the answer will fit in a 32-bit integer.

Note that the product of an array with a single element is the value of that element.

Example 1:

Input: nums = [2,3,-2,4]
Output: 6
Explanation: [2,3] has the largest product 6.
Example 2:

Input: nums = [-2,0,-1]
Output: 0
Explanation: The result cannot be 2, because [-2,-1] is not a subarray.
*/

// solution
// Kadane's Algorithm for Products
// Here's another common approach that might be clearer:

/*
Understanding maxProd and minProd in Kadane's Algorithm for Maximum Product
Core Concept
We need to track BOTH maximum and minimum products ending at each position because:

Negative numbers can flip signs: 
Multiplying by a negative makes large positive → large negative, and large negative → large positive

We need to be prepared for when we encounter another negative in the future

What Each Variable Represents
maxProd
Definition: Maximum product of a subarray ending at current position i

Why track it? To know the best positive product we can extend forward

minProd
Definition: Minimum product (most negative) of a subarray ending at current position i

Why track it? A very negative number × a negative number = a very positive number!

Visual Example
Let's trace through nums = [2, 3, -2, 4]:

Step 0: nums[0] = 2
maxProd = 2  (best product ending at index 0: [2])
minProd = 2  (worst product ending at index 0: [2])
result = 2

Step 1: nums[1] = 3 (positive)
maxProd = max(3, 2*3) = max(3, 6) = 6
minProd = min(3, 2*3) = min(3, 6) = 3
result = max(2, 6) = 6

Step 2: nums[2] = -2 (NEGATIVE - SWAP!)
Before calculations: swap maxProd and minProd
maxProd = 3 (was minProd)
minProd = 6 (was maxProd)

Now calculate:
maxProd = max(-2, 3 * -2) = max(-2, -6) = -2
minProd = min(-2, 6 * -2) = min(-2, -12) = -12
result = max(6, -2) = 6

Step 3: nums[3] = 4 (positive)
maxProd = max(4, -2*4) = max(4, -8) = 4
minProd = min(4, -12*4) = min(4, -48) = -48
result = max(6, 4) = 6

Final answer: 6 ✓

*/

int maxProduct(List<int> nums) {
  if (nums.isEmpty) return 0;

  int maxProduct = nums[0];
  int minProduct = nums[0];

  int result = nums[0];

  for (var i = 1; i < nums.length; i++) {
    // swap when nums[i] is negative
    if (nums[i] < 0) {
      var temp = maxProduct;
      maxProduct = minProduct;
      minProduct = temp;
    }

    // update max n min
    maxProduct *= nums[i];
    minProduct *= nums[i];

    maxProduct = max(maxProduct, nums[i]);
    minProduct = min(minProduct, nums[i]);

    result = max(result, maxProduct);
  }

  return result;
}
