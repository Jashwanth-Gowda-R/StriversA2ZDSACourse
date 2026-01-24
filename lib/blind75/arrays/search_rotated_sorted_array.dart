void main() {
  print(search([4, 5, 6, 7, 0, 1, 2], 0));
  print(search([4, 5, 6, 7, 0, 1, 2], 3));
}

// Search in rotated sorted array-I

/*
Given an integer array nums, sorted in ascending order (with distinct values) and 
a target value k. The array is rotated at some pivot point that is unknown. 
Find the index at which k is present and if k is not present return -1.


Example 1

Input : nums = [4, 5, 6, 7, 0, 1, 2], k = 0

Output: 4

Explanation: Here, the target is 0.
 We can see that 0 is present in the given rotated sorted array, nums. 
 Thus, we get output as 4, which is the index at which 0 is present in the array.

Example 2

Input: nums = [4, 5, 6, 7, 0, 1, 2], k = 3

Output: -1

Explanation: Here, the target is 3. Since 3 is not present in the given rotated sorted array. 
Thus, we get the output as -1.
*/

/*
Intuition:
The optimal approach would be by dividing the array in halves and implement binary search. 
The most important thing to note here is that, at any middle point, one side of the array 
will still be sorted. Use this logic & by figuring out which half is sorted, 
decide which half to keep searching in, making the search efficient even in a rotated array.


Approach:
Start with two pointers: low at the beginning and high at the end of the array & 
calculate the midpoint (mid). If nums[mid] is the target, return mid.
Determine which half of the array is sorted. If the left half is sorted and the target is 
within this range, search in the left half. Otherwise, search in the right half, if it is 
sorted and the target is within this range, search in the right half. 
Otherwise, search in the left half.
Continue this process until the pointers low and high cross. If the target is not found, 
return -1.
*/

/*
Complexity Analysis: 
Time Complexity: O(logN), as the search space is reduced logarithmically, 
where N is the size of the given array.

Space Complexity: O(1), not using any extra data structure.
*/

int search(List<int> nums, int target) {
  int low = 0;
  int high = nums.length - 1;

  while (low <= high) {
    int mid = (low + high) ~/ 2;

    if (nums[mid] == target) {
      return mid;
    }
    // now check the left sorted array
    if (nums[low] <= nums[mid]) {
      if (nums[low] <= target && target <= nums[mid]) {
        // means it is present in left sorted array
        high = mid - 1;
      } else {
        // target present in right sorted array
        low = mid + 1;
      }
    } else {
      // check the right sorted array
      if (nums[mid] <= target && target <= nums[high]) {
        // target present in right sorted array
        low = mid + 1;
      } else {
        // means it is present in left sorted array
        high = mid - 1;
      }
    }
  }

  return -1;
}
