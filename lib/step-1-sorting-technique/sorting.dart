void main() {
  var selectionSortvar = selectionSort([100, 7, 4, 280, 1, 5, 3]);
  print(selectionSortvar);
}

// Selection Sort
/*
Given an array of integers nums, sort the array in non-decreasing order using the selection sort algorithm and return the sorted array.



A sorted array in non-decreasing order is an array where each element is greater than or equal to all previous elements in the array.


Examples:
Input: nums = [7, 4, 1, 5, 3]

Output: [1, 3, 4, 5, 7]

Explanation: 1 <= 3 <= 4 <= 5 <= 7.

Thus the array is sorted in non-decreasing order.

Input: nums = [5, 4, 4, 1, 1]

Output: [1, 1, 4, 4, 5]

Explanation: 1 <= 1 <= 4 <= 4 <= 5.

Thus the array is sorted in non-decreasing order.
*/

// in this sorting technique 1st find the minimumIndex in entire array and then to swap

List<int> selectionSort(List<int> nums) {
  for (var i = 0; i <= nums.length - 2; i++) {
    var minimumIndex = i;
    for (var j = i; j <= nums.length - 1; j++) {
      if (nums[j] < nums[minimumIndex]) {
        minimumIndex = j;
      }
    }
    // swap
    var temp = nums[i];
    nums[i] = nums[minimumIndex];
    nums[minimumIndex] = temp;
  }

  return nums;
}
