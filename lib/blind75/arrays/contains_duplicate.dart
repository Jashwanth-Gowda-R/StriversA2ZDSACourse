void main() {
  print(containsDuplicate([1, 2, 3, 1]));
  print(containsDuplicate([1, 2, 3, 4]));
  print(containsDuplicate([1, 1, 1, 3, 3, 4, 3, 2, 4, 2]));
}

// Contains Duplicate

/*
Given an integer array nums, return true if any value appears at least twice in the array, 
and return false if every element is distinct.

Example 1:

Input: nums = [1,2,3,1]

Output: true

Explanation:

The element 1 occurs at the indices 0 and 3.

Example 2:

Input: nums = [1,2,3,4]

Output: false

Explanation:

All elements are distinct.

Example 3:

Input: nums = [1,1,1,3,3,4,3,2,4,2]

Output: true

*/

bool containsDuplicate(List<int> nums) {
  var hashMaps = {};

  for (var num in nums) {
    hashMaps[num] = (hashMaps[num] ?? 0) + 1;
  }
  // print(hashMaps);

  for (var value in hashMaps.values) {
    if (value > 1) {
      return true;
    }
  }
  return false;
}
