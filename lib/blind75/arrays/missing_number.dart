// Missing Number

/*
Given an array nums containing n distinct numbers in the range [0, n], return the only number in the range that is missing from the array.


Example 1:

Input: nums = [3,0,1]

Output: 2

Explanation:

n = 3 since there are 3 numbers, so all numbers are in the range [0,3]. 
2 is the missing number in the range since it does not appear in nums.

Example 2:

Input: nums = [0,1]

Output: 2

Explanation:

n = 2 since there are 2 numbers, so all numbers are in the range [0,2]. 
2 is the missing number in the range since it does not appear in nums.

Example 3:

Input: nums = [9,6,4,2,3,5,7,0,1]

Output: 8

Explanation:

n = 9 since there are 9 numbers, so all numbers are in the range [0,9]. 
8 is the missing number in the range since it does not appear in nums.

*/
void main() {
  // Test cases
  List<int> nums1 = [3, 0, 1]; // Missing: 2
  List<int> nums2 = [0, 1]; // Missing: 2
  List<int> nums3 = [9, 6, 4, 2, 3, 5, 7, 0, 1]; // Missing: 8
  print("\nOptimal (Mathematical):");
  print("Missing in [3,0,1]: ${missingNumberOptimal(nums1)}"); // 2
  print("Missing in [0,1]: ${missingNumberOptimal(nums2)}"); // 2
  print("Missing in [9,6,4,2,3,5,7,0,1]: ${missingNumberOptimal(nums3)}"); // 8

  print("\nHashSet Method:");
  print("Missing in [3,0,1,3]: ${missingNumberHashSet(nums1)}"); // 2
}

// HashSet Solution (O(n), O(n) space)
// Approach: Use HashSet/Map to store seen numbers
// Time Complexity: O(n) - Two separate loops
// Space Complexity: O(n) - Extra space for hashset
int missingNumberHashSet(List<int> nums) {
  Set<int> hashSet = {};
  // Store all numbers from array in HashSet
  for (int i = 0; i < nums.length; i++) {
    hashSet.add(nums[i]);
  }
  // print(hashSet);

  // Check each number from 0 to n (inclusive)
  // n = nums.length
  // For array of size n, complete set is [0, 1, 2, ..., n]
  for (int i = 0; i <= nums.length; i++) {
    if (!hashSet.contains(i)) {
      return i;
    }
  }

  return -1; // Should never reach here for valid input
}

//Mathematical Solution (Optimal - O(n), O(1) space)

// Approach: Use Gauss formula for sum of first n natural numbers
// Missing number = Expected sum - Actual sum
// Time Complexity: O(n) - Single pass through array
// Space Complexity: O(1) - Constant extra space
int missingNumberOptimal(List<int> nums) {
  int expectedSum = 0;
  var n = nums.length;
  // Formula for sum of first n natural numbers: n(n+1)/2
  // This is the expected sum if no number was missing
  expectedSum = (n * (n + 1)) ~/ 2;
  // print(expectedSum);

  int actualSum = 0;
  // Calculate actual sum of numbers in array
  for (var i = 0; i < n; i++) {
    actualSum += nums[i];
  }

  // The difference is the missing number
  return expectedSum - actualSum;
}
