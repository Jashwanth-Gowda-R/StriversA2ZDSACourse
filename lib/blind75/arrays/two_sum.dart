void main() {
  // Two Sum
  var nums = [2, 7, 11, 15];
  var target = 9;
  print(twoSumForSortedArray(nums, target));

  // optimal solution
  var nums1 = [3, 2, 4];
  var target1 = 6;
  print(twoSumOptimalSolution(nums1, target1));
}

// Two Sum
/*
Given an array of integers nums and an integer target, 
return indices of the two numbers such that they add up to target.

You may assume that each input would have exactly one solution, and 
you may not use the same element twice.

You can return the answer in any order.
 
Example 1:

Input: nums = [2,7,11,15], target = 9
Output: [0,1]
Explanation: Because nums[0] + nums[1] == 9, we return [0, 1].
Example 2:

Input: nums = [3,2,4], target = 6
Output: [1,2]
Example 3:

Input: nums = [3,3], target = 6
Output: [0,1]

*/

// Brute Force
List<int> twoSumBruteForce(List<int> nums, int target) {
  for (int i = 0; i < nums.length; i++) {
    for (int j = i + 1; j < nums.length; j++) {
      if (nums[i] + nums[j] == target) {
        return [i, j];
      }
    }
  }
  return [-1, -1];
}

// sorted arrays using 2 pointers
List<int> twoSumForSortedArray(List<int> nums, int target) {
  int i = 0;
  int j = nums.length - 1;

  while (i <= j) {
    var res = nums[i] + nums[j];
    if (res == target) {
      return [i, j];
    } else if (res < target) {
      i++;
    } else {
      j--;
    }
  }
  return [-1, -1];
}

// any array using Hashmaps
List<int> twoSumOptimalSolution(List<int> nums, int target) {
  var hashMaps = {};

  for (var i = 0; i < nums.length; i++) {
    var difference = target - nums[i];
    if (hashMaps.containsKey(difference)) {
      return [i, hashMaps[difference]];
    } else {
      hashMaps[nums[i]] = i;
    }
  }
  return [-1, -1];
}
