import 'dart:math';

void main() {
  // print(findMinBrute([3, 4, 5, 1, 2]));
  // print(findMinBrute([4, 5, 6, 7, 0, 1, 2, 3]));

  print(findMin([3, 4, 5, 1, 2]));
  print(findMin([4, 5, 6, 7, 0, 1, 2, 3]));
  print(findMin([3, 1, 2]));
}

// Find minimum in Rotated Sorted Array

/*
Given an integer array nums of size N, sorted in ascending order with distinct values, and then rotated an unknown number of times (between 1 and N), find the minimum element in the array.


Example 1

Input : nums = [4, 5, 6, 7, 0, 1, 2, 3]

Output: 0

Explanation: Here, the element 0 is the minimum element in the array.

Example 2

Input : nums = [3, 4, 5, 1, 2]

Output: 1

Explanation:Here, the element 1 is the minimum element in the array.

Complexity Analysis: 
Time Complexity:O(log(N)), where N is size of the array. Because binary search is being used.

Space Complexity:O(1) As no additional space is used.

*/
// o(n)
int findMinBrute(List<int> nums) {
  int minNumber = double.maxFinite.toInt();

  for (var num in nums) {
    minNumber = min(num, minNumber);
  }
  return minNumber;
}

// optimal solution using binary search
int findMin(List<int> nums) {
  int low = 0;
  int high = nums.length - 1;

  int minimumNumber = double.maxFinite.toInt();
  while (low <= high) {
    // this means array is sorted
    if (nums[low] <= nums[high]) {
      minimumNumber = min(minimumNumber, nums[low]);
      break;
    }
    int mid = (low + high) ~/ 2;

    if (nums[low] <= nums[mid]) {
      minimumNumber = min(minimumNumber, nums[low]);
      low = mid + 1;
    } else {
      minimumNumber = min(minimumNumber, nums[mid]);
      high = mid - 1;
    }
  }
  return minimumNumber;
}
