void main() {
  print(maxSubArray([-2, 1, -3, 4, -1, 2, 1, -5, 4]));
  print(maxSubArray([5, 4, -1, 7, 8]));
}

// Kadane's Algorithm -  Maximum Subarray with the largest sum

/*
Given an integer array nums, find the subarray with the largest sum, and return its sum.

Example 1:

Input: nums = [-2,1,-3,4,-1,2,1,-5,4]
Output: 6
Explanation: The subarray [4,-1,2,1] has the largest sum 6.
Example 2:

Input: nums = [1]
Output: 1
Explanation: The subarray [1] has the largest sum 1.
Example 3:

Input: nums = [5,4,-1,7,8]
Output: 23
Explanation: The subarray [5,4,-1,7,8] has the largest sum 23.

*/

// Kadane's Algorithm -  Maximum Subarray
/*
Given an integer array nums, find the subarray with the largest sum and 
return the sum of the elements present in that subarray.

A subarray is a contiguous non-empty sequence of elements within an array.

Time & Space Complexity:
Time Complexity: O(n) - Single pass through array

Space Complexity: O(1) - Only uses a few variables

Key Insights of Kadane's Algorithm:
Local vs Global Maximum: Track both current sum and overall maximum

Reset Strategy: When current sum becomes negative, start fresh (negative sums won't help future sums)

Contiguous Requirement: Subarray must be contiguous, so we can't skip elements


*/

int maxSubArray(List<int> nums) {
  // Initialize maximum sum with smallest possible integer
  int maxSum = -double.maxFinite.toInt(); // Or use: 1 << 31 for 32-bit min

  // Current running sum
  int currentSum = 0;

  // Track start index of current subarray
  int start = 0;

  // Track indices of maximum subarray found so far
  int subStart = -1;
  int subEnd = -1;

  // Iterate through the array
  for (var i = 0; i < nums.length; i++) {
    // If currentSum is 0, we're starting a new potential subarray
    if (currentSum == 0) {
      start = i; // Mark start of new subarray
    }

    // Add current element to running sum
    currentSum += nums[i];

    // Update maximum sum and indices if we found a better subarray
    if (currentSum > maxSum) {
      maxSum = currentSum;
      subStart = start; // Start index of max subarray
      subEnd = i; // End index of max subarray
    }

    // Kadane's key insight: if current sum becomes negative, reset it to 0
    // A negative sum will only decrease future sums
    if (currentSum < 0) {
      currentSum = 0;
    }
  }

  // Print the maximum subarray (optional)
  var subArray = [];
  for (var i = subStart; i <= subEnd; i++) {
    subArray.add(nums[i]);
  }
  print("Maximum subarray: $subArray");
  print("Indices: $subStart to $subEnd");

  return maxSum;
}
