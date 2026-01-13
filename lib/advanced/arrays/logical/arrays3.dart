import 'dart:math';

void main() {
  // rotate([
  //   [1, 2, 3],
  //   [4, 5, 6],
  //   [7, 8, 9]
  // ]);
  rotate([
    [5, 1, 9, 11],
    [2, 4, 8, 10],
    [13, 3, 6, 7],
    [15, 14, 12, 16]
  ]);

  var sum2 = twoSum([2, 7, 11, 15], 9);
  print(sum2);

  var threeSumvar = threeSum([2, -2, 0, 3, -3, 5]);
  print(threeSumvar);

  var fourSumvar = fourSum([0, 0, 0, 0, 0, 0], 0);
  print(fourSumvar);

  var sortColorsVar = sortColors([2, 0, 1]);
  print(sortColorsVar);

  var maxSubArrayVar = maxSubArray([-1, 2, 3, -1, 2, -6, 5]);
  print(maxSubArrayVar);

  nextPermutation([1, 2, 3]);

  var majorityElementVar = majorityElement([1, 2]);
  print(majorityElementVar);

  var findMissingRepeatingNumbersVar =
      findMissingRepeatingNumbers([3, 5, 4, 1, 1]);
  print(findMissingRepeatingNumbersVar);

  var numberOfInversionsVar = numberOfInversions([2, 3, 7, 1, 3, 5]);
  print(numberOfInversionsVar);

  var reversePairsVar = reversePairs([6, 4, 4, 2, 2]);
  print(reversePairsVar);

  var maxProductVar = maxProduct([4, 5, 3, 7, 1, 2]);
  print(maxProductVar);

  mergeTwoSortedArrays([1, 2, 3, 0, 0, 0], 6, [2, 5, 6], 3);
}

// Rotate matrix by 90 degrees
/*
Given an N * N 2D integer matrix, rotate the matrix by 90 degrees clockwise.

The rotation must be done in place, meaning the input 2D matrix must be modified directly.

Input: matrix = [[1,2,3],
                [4,5,6],
                [7,8,9]]
Output: [[7,4,1],[8,5,2],[9,6,3]]

*/
// Transpose the matrix
// Reverse each row of the matrix
// void rotate(List<List<int>> matrix) {
//   var n = matrix.length;
//   // Transpose the matrix
//   for (var i = 0; i < n - 1; i++) {
//     for (var j = i + 1; j < n; j++) {
//       // Swap elements across the diagonal
//       var temp = matrix[i][j];
//       matrix[i][j] = matrix[j][i];
//       matrix[j][i] = temp;
//     }
//   }
//   print(matrix);

//   for (var i = 0; i < n; i++) {
//     matrix[i] = matrix[i].reversed.toList();
//   }

//   print(matrix);
// }
/*

Step-by-Step Example:

Input:
matrix = [[1, 2, 3],
          [4, 5, 6],
          [7, 8, 9]]

Step 1: Transpose (swap across diagonal)
text
Original:           After Transpose:
[1, 2, 3]          [1, 4, 7]
[4, 5, 6]    →     [2, 5, 8]  
[7, 8, 9]          [3, 6, 9]

Swaps performed:
- (0,1) ↔ (1,0): 2 ↔ 4
- (0,2) ↔ (2,0): 3 ↔ 7
- (1,2) ↔ (2,1): 6 ↔ 8


Step 2: Reverse each row
text
After Transpose:   After Reversing Rows:
[1, 4, 7]          [7, 4, 1]
[2, 5, 8]    →     [8, 5, 2]
[3, 6, 9]          [9, 6, 3]

Final result (90° clockwise rotation) ✓
*/
void rotate(List<List<int>> matrix) {
  var n = matrix.length;

  // STEP 1: TRANSPOSE THE MATRIX (swap elements across main diagonal)
  // Transpose means: convert rows to columns
  // Example: element at (i,j) moves to (j,i)
  for (var i = 0; i < n - 1; i++) {
    for (var j = i + 1; j < n; j++) {
      // Swap element at (i,j) with element at (j,i)
      // This reflects the matrix across its main diagonal
      var temp = matrix[i][j];
      matrix[i][j] = matrix[j][i];
      matrix[j][i] = temp;
    }
  }

  print("After transpose: $matrix");

  // STEP 2: REVERSE EACH ROW
  // Reversing each row after transpose gives 90° clockwise rotation
  for (var i = 0; i < n; i++) {
    // Reverse the i-th row
    matrix[i] = matrix[i].reversed.toList();
  }

  print("After reversing rows (final): $matrix");
}

// Two Sum
/*
Given an array of integers nums and an integer target.
Return the indices(0 - indexed) of two elements in nums such that they add up to target.

Each input will have exactly one solution, and the same element cannot be used twice. 
Return the answer in increasing order.

Examples:
Input: nums = [1, 6, 2, 10, 3], target = 7

Output: [0, 1]

Explanation:

nums[0] + nums[1] = 1 + 6 = 7
*/

List<int> twoSum(List<int> nums, int target) {
  var hashMap = {};

  for (var i = 0; i < nums.length; i++) {
    var valRequired = target - nums[i];
    print(valRequired);
    print(hashMap);
    if (hashMap.containsKey(valRequired)) {
      return [i, hashMap[valRequired]];
    } else {
      hashMap[nums[i]] = i;
    }
  }
  return [-1, -1];
}

// 3 Sum
/*
Given an integer array nums. Return all triplets such that:

i != j, i != k, and j != k

nums[i] + nums[j] + nums[k] == 0.

Notice that the solution set must not contain duplicate triplets. 
One element can be a part of multiple triplets. 
The output and the triplets can be returned in any order.

Examples:
Input: nums = [2, -2, 0, 3, -3, 5]

Output: [[-2, 0, 2], [-3, -2, 5], [-3, 0, 3]]

Explanation:

nums[1] + nums[2] + nums[0] = 0

nums[4] + nums[1] + nums[5] = 0

nums[4] + nums[2] + nums[3] = 0

*/

List<List<int>> threeSum(List<int> nums) {
  var n = nums.length;

  nums.sort();

  List<List<int>> res = [];

  for (var i = 0; i < n; i++) {
    // skipping same ith element for duplication issue
    if (i > 0 && nums[i] == nums[i - 1]) {
      continue;
    }
    var j = i + 1;
    var k = n - 1;

    while (j < k) {
      var answer = nums[i] + nums[j] + nums[k];
      if (answer < 0) {
        j++;
      } else if (answer > 0) {
        k--;
      } else {
        // found triplet
        res.add([nums[i], nums[j], nums[k]]);
        j++;
        k--;
        while (j < k && nums[j] == nums[j - 1]) {
          j++;
        }
        while (j < k && nums[k] == nums[k + 1]) {
          k--;
        }
      }
    }
  }

  return res;
}

// 4 Sum
/*
Given an integer array nums and an integer target. Return all quadruplets [nums[a], nums[b], nums[c], nums[d]] such that:

a, b, c, d are all distinct valid indices of nums.

nums[a] + nums[b] + nums[c] + nums[d] == target.

Notice that the solution set must not contain duplicate quadruplets. One element can be a part of multiple quadruplets. The output and the quadruplets can be returned in any order.

Examples:
Input: nums = [1, -2, 3, 5, 7, 9], target = 7

Output: [[-2, 1, 3, 5]]

Explanation:

nums[1] + nums[0] + nums[2] + nums[3] = 7
*/

List<List<int>> fourSum(List<int> nums, int target) {
  var n = nums.length;

  nums.sort();

  List<List<int>> res = [];

  for (var i = 0; i < n; i++) {
    // skipping same ith element for duplication issue
    if (i > 0 && nums[i] == nums[i - 1]) {
      continue;
    }
    for (var j = i + 1; j < n; j++) {
      // skipping same ith element for duplication issue
      if (j > i + 1 && nums[j] == nums[j - 1]) {
        continue;
      }

      var k = j + 1;
      var l = n - 1;

      while (k < l) {
        var answer = nums[i] + nums[j] + nums[k] + nums[l];
        if (answer < target) {
          k++;
          // Skip duplicates for k when moving forward
          while (k < l && nums[k] == nums[k - 1]) {
            k++;
          }
        } else if (answer > target) {
          l--;
          // Skip duplicates for l when moving backward
          while (k < l && nums[l] == nums[l + 1]) {
            l--;
          }
        } else {
          // found triplet
          res.add([nums[i], nums[j], nums[k], nums[l]]);
          k++;
          l--;
          while (k < l && nums[k] == nums[k - 1]) {
            k++;
          }
          while (k < l && nums[l] == nums[l + 1]) {
            l--;
          }
        }
      }
    }
  }

  return res;
}

// Sort an array of 0's 1's and 2's - Sort Colors
/*
Given an array nums with n objects colored red, white, or blue, sort them in-place so that objects of the same color are adjacent, with the colors in the order red, white, and blue.

We will use the integers 0, 1, and 2 to represent the color red, white, and blue, respectively.

You must solve this problem without using the library's sort function.

Example 1:

Input: nums = [2,0,2,1,1,0]
Output: [0,0,1,1,2,2]

The optimal solution is a variation of the popular Dutch National flag algorithm.

This algorithm contains 3 pointers i.e. low, mid, and high, and 3 main rules.

Index 0 to low -1 contains 0
Index low to mid - 1 contains 1
Index high +1 to sizeOfArray - 1 contains 2.

The middle part i.e. mid to high is the unsorted segment. 
So, this part is a mix of 0's, 1's and 2's. Follow the rules mentioned in approach and image below and sort the array.

Why This Algorithm Works (Invariants):
Throughout the algorithm, these invariants are maintained:

0's section: [0..low-1] contains only 0's

1's section: [low..mid-1] contains only 1's

Unprocessed section: [mid..high] contains mixed 0's, 1's, 2's

2's section: [high+1..end] contains only 2's

Time & Space Complexity:
Time Complexity: O(n) - Single pass through array

Space Complexity: O(1) - In-place sorting, only 3 pointers used

Key Insights:
Dutch National Flag Problem: Classic computer science problem

Three-way partitioning: Efficiently separates 0's, 1's, and 2's

One-pass algorithm: Processes each element at most once

In-place: No extra arrays needed

Optimal: Beats O(n log n) sorting algorithms
*/

List<int> sortColors(List<int> nums) {
  // 3 pointer solution - Dutch National flag algorithm.
  var low = 0;
  var mid = 0;
  var high = nums.length - 1;

  while (mid <= high) {
    if (nums[mid] == 0) {
      // swap
      // low and mid
      var temp = nums[mid];
      nums[mid] = nums[low];
      nums[low] = temp;
      low++;
      mid++;
    } else if (nums[mid] == 1) {
      mid++;
    } else {
      // swap
      // high and mid
      var temp = nums[mid];
      nums[mid] = nums[high];
      nums[high] = temp;
      high--;
    }
  }
  return nums;
}

List<int> sortColorsWithComments(List<int> nums) {
  // 3-pointer solution - Dutch National Flag algorithm
  // low: boundary for 0's (all elements before low are 0)
  // mid: current element being examined
  // high: boundary for 2's (all elements after high are 2)
  var low = 0;
  var mid = 0;
  var high = nums.length - 1;

  // Process the unsorted segment (mid to high)
  while (mid <= high) {
    // Case 1: Current element is 0
    if (nums[mid] == 0) {
      // Swap current element with element at low pointer
      // This moves 0 to the beginning section
      var temp = nums[mid];
      nums[mid] = nums[low];
      nums[low] = temp;

      // Both low and mid move forward
      // low moves because we placed a 0 at low position
      // mid moves because we've processed current element
      low++;
      mid++;
    }
    // Case 2: Current element is 1
    else if (nums[mid] == 1) {
      // 1 is already in correct position (middle section)
      // Just move mid pointer forward
      mid++;
    }
    // Case 3: Current element is 2
    else {
      // Swap current element with element at high pointer
      // This moves 2 to the end section
      var temp = nums[mid];
      nums[mid] = nums[high];
      nums[high] = temp;

      // Only high moves backward
      // mid doesn't move because we need to examine the new element
      // that came from high position (could be 0, 1, or 2)
      high--;
    }
  }
  return nums;
}

// Kadane's Algorithm -  Maximum Subarray
/*
Given an integer array nums, find the subarray with the largest sum and return the sum of the elements present in that subarray.

A subarray is a contiguous non-empty sequence of elements within an array.
*/
int maxSubArray(List<int> nums) {
  int max = -double.maxFinite.toInt();

  int sum = 0;

  int start = 0;

  int subStart = -1;
  int subEnd = -1;

  for (var i = 0; i < nums.length; i++) {
    if (sum == 0) {
      start = i;
    }

    sum += nums[i];

    if (sum > max) {
      max = sum;
      subStart = start;
      subEnd = i;
    }

    if (sum < 0) {
      sum = 0;
    }
  }
  var subArray = [];
  // to print sub array
  for (var i = subStart; i <= subEnd; i++) {
    subArray.add(nums[i]);
  }
  print(subArray);

  return max;
}

// Next Permutation
/*
A permutation of an array of integers is an arrangement of its members into a sequence or linear order.

For example, for arr = [1,2,3], the following are all the permutations of arr:

[1,2,3], [1,3,2], [2,1,3], [2,3,1], [3,1,2], [3,2,1].

The next permutation of an array of integers is the next lexicographically greater permutation of its integers.

More formally, if all the permutations of the array are sorted in lexicographical order, then the next permutation of that array is the permutation that follows it in the sorted order.

If such arrangement is not possible (i.e., the array is the last permutation), then rearrange it to the lowest possible order (i.e., sorted in ascending order).

You must rearrange the numbers in-place and use only constant extra memory.

Examples:
Input: nums = [1,2,3]

Output: [1,3,2]

Explanation:

The next permutation of [1,2,3] is [1,3,2].


Algorithm Steps - 
Find the first decreasing element from the right

  Start from the last element, move leftwards

  Find the first index i where nums[i] < nums[i+1]

  This is the "pivot" element

Find the element just larger than the pivot from the right

  If we found a pivot (i >= 0)

  Find the first element from the right that is greater than nums[i]

  Swap these two elements

Reverse the suffix (elements after the pivot)

  Reverse all elements from i+1 to the end

  This gives us the smallest possible arrangement for the suffix

*/

void nextPermutation(List<int> nums) {
  var n = nums.length;

  // step 1 - Find the first decreasing element from the right
  var i = n - 2;
  while (i >= 0 && nums[i] >= nums[i + 1]) {
    i--;
  }

// If we found a pivot
  if (i >= 0) {
    // Step 2: Find element just larger than nums[i] from the right
    var j = n - 1;
    while (j >= 0 && nums[j] <= nums[i]) {
      j--;
    }
    // Step 3: Swap nums[i] and nums[j]
    swap(nums, i, j);
  }
  // Step 4: Reverse the suffix (from i+1 to end)
  reverse(nums, i + 1, n - 1);
  print(nums);
}

// Helper function to swap two elements
void swap(List<int> nums, int i, int j) {
  var temp = nums[i];
  nums[i] = nums[j];
  nums[j] = temp;
}

// Helper function to reverse a portion of the array
void reverse(List<int> nums, int start, int end) {
  while (start < end) {
    swap(nums, start, end);
    start++;
    end--;
  }
}

// Majority Element-II
/*
Given an integer array nums of size n. Return all elements which appear more than n/3 times in the array. The output can be returned in any order.

Examples:
Input: nums = [1, 2, 1, 1, 3, 2]

Output: [1]

Explanation:

Here, n / 3 = 6 / 3 = 2.

Therefore the elements appearing 3 or more times is : [1]
*/
List<int> majorityElement(List<int> nums) {
  var hashMap = {};
  for (var i = 0; i <= nums.length - 1; i++) {
    print(hashMap);
    if (!hashMap.containsKey(nums[i])) {
      hashMap[nums[i]] = 1;
    } else {
      hashMap[nums[i]] = hashMap[nums[i]] + 1;
    }
  }

  print(hashMap);
  var n = nums.length;
  var minAppearance = (n ~/ 3) + 1;
  print(minAppearance);

  // var maxkey = 0;
  // var maxValue = 0;
  List<int> res = [];

  for (var element in hashMap.entries) {
    if (element.value >= minAppearance) {
      // maxkey = element.key;
      res.add(element.key);
      // maxValue = element.value;
    }
  }

  return res;
}

// Find the repeating and missing number
/*
 * Given an integer array nums of size n containing values from [1, n] and each value appears exactly once in the array, except for A, which appears twice and B which is missing.

Return the values A and B, as an array of size 2, where A appears in the 0-th index and B in the 1st index.

Note: You are not allowed to modify the original array.

Examples:
Input: nums = [3, 5, 4, 1, 1]

Output: [1, 2]

Explanation:

1 appears two times in the array and 2 is missing from nums
 */

List<int> findMissingRepeatingNumbers(List<int> nums) {
  List<int> res = [];

  // will create hashmap
  var hashMap = {};

  for (var i = 0; i < nums.length; i++) {
    if (!hashMap.containsKey(nums[i])) {
      hashMap[nums[i]] = 1;
    } else {
      hashMap[nums[i]]++;
    }
  }
  print(hashMap);

  for (var element in hashMap.entries) {
    if (element.value >= 2) {
      // maxkey = element.key;
      res.add(element.key);
      // maxValue = element.value;
    }
  }
  print(res);

  // find missing number
  int n = nums.length;
  var setList = nums.toSet().toList();

  double sum = (n * (n + 1)) / 2;
  double sum2 = 0;

  for (int i = 0; i < setList.length; i++) {
    sum2 += setList[i];
  }
  print(sum);
  print(sum2);
  var missingNumber = sum - sum2;
  res.add(missingNumber.toInt());

  return res;
}

// Count Inversions
/*
Given an integer array nums. Return the number of inversions in the array.

Two elements a[i] and a[j] form an inversion if a[i] > a[j] and i < j.

It indicates how close an array is to being sorted.

A sorted array has an inversion count of 0.

An array sorted in descending order has maximum inversion.

Examples:
Input: nums = [2, 3, 7, 1, 3, 5]

Output: 5

Explanation:

The responsible indexes are:

nums[0], nums[3], values: 2 > 1 & indexes: 0 < 3

nums[1], nums[3], values: 3 > 1 & indexes: 1 < 3

nums[2], nums[3], values: 7 > 1 & indexes: 2 < 3

nums[2], nums[4], values: 7 > 3 & indexes: 2 < 4

nums[2], nums[5], values: 7 > 5 & indexes: 2 < 5
 */

// solve using merge sort

int mergeSort(List<int> nums, int low, int high) {
  int count = 0;
  // base condition
  if (low >= high) {
    // return nums;
    return count;
  }
  var mid = (high + low) ~/ 2;
  // int count = 0;
  // divide
  count += mergeSort(nums, low, mid);
  count += mergeSort(nums, mid + 1, high);
  // merge
  count += merge(nums, low, mid, high);
  return count;
}

int merge(List<int> nums, int low, int mid, int high) {
  var left = low;
  var right = mid + 1;
  List<int> arr = [];
  int count = 0;

  while (left <= mid && right <= high) {
    if (nums[left] <= nums[right]) {
      arr.add(nums[left]);
      left++;
    } else {
      // Count inversions
      count += (mid - left + 1);
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
  // return nums;
  return count;
}

int numberOfInversions(List<int> nums) {
  return mergeSort(nums, 0, nums.length - 1);
}

// Reverse Pairs
/*
Given an integer array nums. Return the number of reverse pairs in the array.



An index pair (i, j) is called a reverse pair if:



0 <= i < j < nums.length


nums[i] > 2 * nums[j]

Examples:
Input: nums = [6, 4, 1, 2, 7]

Output: 3

Explanation:

The reverse pairs are:

(0, 2) : nums[0] = 6, nums[2] = 1, 6 > 2 * 1

(0, 3) : nums[0] = 6, nums[3] = 2, 6 > 2 * 2

(1, 2) : nums[1] = 4, nums[2] = 1, 4 > 2 * 1
*/

// solve using merge sort

int reversePairs(List<int> nums) {
  return mergeSortReversePairs(nums, 0, nums.length - 1);
}

int mergeSortReversePairs(List<int> nums, int low, int high) {
  int count = 0;
  // base condition
  if (low >= high) {
    // return nums;
    return count;
  }
  var mid = (high + low) ~/ 2;
  // divide
  count += mergeSortReversePairs(nums, low, mid);
  count += mergeSortReversePairs(nums, mid + 1, high);
  // count calculation
  count += countPairs(nums, low, mid, high);
  // merge
  mergeReversePairs(nums, low, mid, high);
  return count;
}

// Count reverse pairs
int countPairs(List<int> nums, int low, int mid, int high) {
  int cnt = 0;
  int right = mid + 1;

  for (int i = low; i <= mid; i++) {
    while (right <= high && nums[i] > 2 * nums[right]) {
      right++;
    }
    cnt += right - (mid + 1);
  }

  return cnt;
}

List<int> mergeReversePairs(List<int> nums, int low, int mid, int high) {
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

// Maximum Product Subarray in an Array
/*
Given an integer array nums. Find the subarray with the largest product, and return the product of the elements present in that subarray.

A subarray is a contiguous non-empty sequence of elements within an array.

Example 1

Input: nums = [4, 5, 3, 7, 1, 2]

Output: 840

Explanation:

The largest product is given by the whole array itself

Example 2

Input: nums = [-5, 0, -2]

Output: 0

Explanation:

The largest product is achieved with the following subarrays [0], [-5, 0], [0, -2], [-5, 0, -2].

*/

int maxProduct(List<int> nums) {
  int productAnswer = nums[0];
  int prefix = 1;
  int sufix = 1;

  for (var i = 0; i < nums.length; i++) {
    if (prefix == 0) {
      prefix = 1;
    }
    if (sufix == 0) {
      sufix = 1;
    }
    prefix *= nums[i];
    sufix *= nums[nums.length - 1 - i];

    productAnswer = max(productAnswer, max(prefix, sufix));
  }

  return productAnswer;
}

// Merge two sorted arrays without extra space
/*
Given two integer arrays nums1 and nums2. Both arrays are sorted in non-decreasing order.

Merge both the arrays into a single array sorted in non-decreasing order.

The final sorted array should be stored inside the array nums1 and it should be done in-place.

nums1 has a length of m + n, where the first m elements denote the elements of nums1 and rest are 0s.

nums2 has a length of n.

Example 1

Input: nums1 = [-5, -2, 4, 5], nums2 = [-3, 1, 8]

Output: [-5, -3, -2, 1, 4, 5, 8]

Explanation:

The merged array is: [-5, -3, -2, 1, 4, 5, 8], where [-5, -2, 4, 5] are from nums1 and [-3, 1, 8] are from nums2
*/
void mergeTwoSortedArrays(List<int> nums1, int m, List<int> nums2, int n) {
  int i = m - 1;
  int j = n - 1;
  int k = m + n - 1;
  // int k = nums1.length - 1;

// till 2nd array is placed in correct order
  while (j >= 0) {
    if (i >= 0 && nums1[i] > nums2[j]) {
      nums1[k] = nums1[i];
      i--;
    } else {
      nums1[k] = nums2[j];
      j--;
    }
    k--;
  }
  print(nums1);
}
