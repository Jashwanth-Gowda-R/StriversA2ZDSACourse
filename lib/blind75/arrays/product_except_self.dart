void main() {
  print(productExceptSelf([1, 2, 3, 4])); // Output: [24, 12, 8, 6]
  print(productExceptSelf([-1, 1, 0, -3, 3])); // Output: [0, 0, 9, 0, 0]
}
// Product of Array Except Self

/*
Given an integer array nums, return an array answer such that answer[i] is equal to the product of all the elements of nums except nums[i].

The product of any prefix or suffix of nums is guaranteed to fit in a 32-bit integer.

You must write an algorithm that runs in O(n) time and without using the division operation.

 

Example 1:

Input: nums = [1,2,3,4]
Output: [24,12,8,6]
Example 2:

Input: nums = [-1,1,0,-3,3]
Output: [0,0,9,0,0]

Complexity
Time complexity: Time O(N)
Space complexity:Space O(1)

*/

List<int> productExceptSelf(List<int> nums) {
  int n = nums.length;

  // Create a result list initialized with 1s (not 0s!)
  List<int> result = List<int>.filled(n, 1);

  print('initial res - $result');

  int prefix = 1;
  int postfix = 1;

  // First pass: Calculate prefix products
  // For each element, store the product of all elements to its left
  for (int i = 0; i < n; i++) {
    result[i] = prefix; // Store prefix product at current position
    prefix *= nums[i]; // Update prefix for next iteration
  }

  print('prefix res - $result');

  // Second pass: Calculate postfix products and combine with prefix
  // For each element, multiply by product of all elements to its right
  for (int i = n - 1; i >= 0; i--) {
    result[i] *= postfix; // Multiply stored prefix by postfix
    postfix *= nums[i]; // Update postfix for next iteration
  }

  return result;
}
