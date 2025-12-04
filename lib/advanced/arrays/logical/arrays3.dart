void main() {
  // rotate([
  //   [1, 2, 3],
  //   [4, 5, 6],
  //   [7, 8, 9]
  // ]);
  // rotate([
  //   [5, 1, 9, 11],
  //   [2, 4, 8, 10],
  //   [13, 3, 6, 7],
  //   [15, 14, 12, 16]
  // ]);

  // var sum2 = twoSum([2, 7, 11, 15], 9);
  // print(sum2);

  var threeSumvar = threeSum([2, -2, 0, 3, -3, 5]);
  print(threeSumvar);

  var fourSumvar = fourSum([0, 0, 0, 0, 0, 0], 0);
  print(fourSumvar);

  var sortColorsVar = sortColors([2, 0, 1]);
  print(sortColorsVar);

  var maxSubArrayVar = maxSubArray([-1, 2, 3, -1, 2, -6, 5]);
  print(maxSubArrayVar);
}

// Rotate matrix by 90 degrees
/*
Given an N * N 2D integer matrix, rotate the matrix by 90 degrees clockwise.

The rotation must be done in place, meaning the input 2D matrix must be modified directly.

Input: matrix = [[1,2,3],[4,5,6],[7,8,9]]
Output: [[7,4,1],[8,5,2],[9,6,3]]

*/
// Transpose the matrix
// Reverse each row of the matrix
void rotate(List<List<int>> matrix) {
  var n = matrix.length;
  // Transpose the matrix
  for (var i = 0; i < n - 1; i++) {
    for (var j = i + 1; j < n; j++) {
      // Swap elements across the diagonal
      var temp = matrix[i][j];
      matrix[i][j] = matrix[j][i];
      matrix[j][i] = temp;
    }
  }
  print(matrix);

  for (var i = 0; i < n; i++) {
    matrix[i] = matrix[i].reversed.toList();
  }

  print(matrix);
}

// Two Sum
/*
Given an array of integers nums and an integer target. Return the indices(0 - indexed) of two elements in nums such that they add up to target.

Each input will have exactly one solution, and the same element cannot be used twice. Return the answer in increasing order.

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

Notice that the solution set must not contain duplicate triplets. One element can be a part of multiple triplets. The output and the triplets can be returned in any order.

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

The middle part i.e. mid to high is the unsorted segment. So, this part is a mix of 0's, 1's and 2's. Follow the rules mentioned in approach and image below and sort the array.
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
