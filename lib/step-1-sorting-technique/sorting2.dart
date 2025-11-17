void main() {
  var nums = [5, 4, 4, 1, 1];
  var merge = mergeSort(nums, 0, nums.length - 1);
  print(merge);
  print('-------');
  var numsq = [5, 4, 4, 1, 1];
  var qs = quickSort(numsq);
  print(qs);
  print('-------');
}

// Merge Sorting
/*
Given an array of integers, nums,sort the array in non-decreasing order using the merge sort algorithm. Return the sorted array.


A sorted array in non-decreasing order is one in which each element is either greater than or equal to all the elements to its left in the array.


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
// this algo works like divide and merge with recurrsion

List<int> mergeSort(List<int> nums, int low, int high) {
  // base condition
  if (low >= high) {
    return nums;
  }
  var mid = (high + low) ~/ 2;
  // divide
  mergeSort(nums, low, mid);
  mergeSort(nums, mid + 1, high);
  // merge
  return merge(nums, low, mid, high);
}

List<int> merge(List<int> nums, int low, int mid, int high) {
  var left = low;
  var right = mid + 1;
  List<int> arr = [];

  while (left <= mid && right <= high) {
    if (nums[left] <= nums[right]) {
      arr.add(nums[left]);
      left++;
    } else {
      arr.add(nums[right]);
      right++;
    }
  }

  while (left <= mid) {
    arr.add(nums[left]);
    left++;
  }

  while (right <= high) {
    arr.add(nums[right]);
    right++;
  }

  for (var i = 0; i < arr.length; i++) {
    nums[low + i] = arr[i];
  }
  // print(nums);

  // print(arr);
  return nums;
}

// Quick Sorting

/*
Intuition:
Quick Sort is a divide-and-conquer algorithm like Merge Sort. However, unlike Merge Sort, Quick Sort does not use an extra array for sorting (though it uses an auxiliary stack space). This makes Quick Sort slightly better than Merge Sort from a space perspective.

This algorithm follows two simple steps repeatedly:

Pick a pivot and place it in its correct position in the sorted array.
Move smaller elements (i.e., smaller than the pivot) to the left of the pivot and larger ones to the right.
To summarize: The main goal is to place the pivot at its final position in each recursion call, where it should be in the final sorted array.

Time Complexity for the best and average case: O(N*logN)

Space Complexity: O(1) + O(N) auxiliary stack space, where N = size of the array.
*/
// get partition index and make 2 arrays and do recurssion

List<int> quickSort(List<int> nums) {
  quickSortHelper(nums, 0, nums.length - 1);
  return nums;
}

void quickSortHelper(List<int> nums, int low, int high) {
  if (low < high) {
    int partitionIndex = partition(nums, low, high);
    quickSortHelper(nums, low, partitionIndex - 1);
    quickSortHelper(nums, partitionIndex + 1, high);
  }
}

int partition(List<int> nums, int low, int high) {
  var pivot = nums[low];
  var i = low + 1; // Start from low + 1
  var j = high;

  while (i <= j) {
    // Move i until we find element greater than pivot
    while (i <= high && nums[i] <= pivot) {
      i++;
    }
    // Move j until we find element less than or equal to pivot
    while (j >= low + 1 && nums[j] > pivot) {
      j--;
    }
    // Swap if i is still less than j
    if (i < j) {
      var temp = nums[i];
      nums[i] = nums[j];
      nums[j] = temp;
    }
  }

  // Place pivot in correct position
  var temp = nums[low];
  nums[low] = nums[j];
  nums[j] = temp;

  return j;
}
