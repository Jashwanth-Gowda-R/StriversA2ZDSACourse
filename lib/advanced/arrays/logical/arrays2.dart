// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:io';

void main() {
  var removeDuplicatesvar = removeDuplicates([-30, -30, 0, 0, 10, 20, 30, 30]);
  print(removeDuplicatesvar);
  var missingNumbervar = missingNumber([0, 1, 2, 4, 5, 6]);
  print(missingNumbervar);
  var unionArrayvar = unionArray([3, 4, 6, 7, 9, 9], [1, 5, 7, 8, 8]);
  print(unionArrayvar);
  var intersectionArrayvar =
      intersectionArray([-17, -1, -1, 3], [-17, 0, 3, 3]);
  print(intersectionArrayvar);
  var majorityElementvar = majorityElement([6, 5, 5]);
  print(majorityElementvar);
  var leadersvar = leaders([-3, 4, 5, 1, -4, -5]);
  print(leadersvar);
  var rearrangeArrayvar = rearrangeArray([3, 1, -2, -5, 2, -4]);
  print(rearrangeArrayvar);

  var spiralOrdervar = spiralOrder([
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9]
  ]);
  print(spiralOrdervar);

  var pascalTriangleIvar = pascalTriangleI(6, 2);
  print(pascalTriangleIvar);

  pascalTriangleII(6);
}
// Move Zeros to End - [0, 1, 4, 0, 5, 2]
/*
Given an integer array nums, move all the 0's to the end of the array. The relative order of the other elements must remain the same.



This must be done in place, without making a copy of the array.

*/

void moveZeroes(List<int> nums) {
  // step1 - find 1st 0 element and store that index in j
  // step2 - start i from j+1 till end when u find 0 swap and do j++

// 1
  var j = -1;
  for (var i = 0; i < nums.length - 1; i++) {
    if (nums[i] == 0) {
      j = i;
      break;
    }
  }
  // if j==-1 then array is non 0 elements
  if (j == -1) {
    return;
  }

// 2
  for (var i = j + 1; i <= nums.length - 1; i++) {
    if (nums[i] != 0) {
      var temp = nums[i];
      nums[i] = nums[j];
      nums[j] = temp;
      j++;
    }
  }
}

// Remove duplicates from sorted array
/*
Given an integer array nums sorted in non-decreasing order, remove all duplicates in-place so that each unique element appears only once.

Return the number of unique elements in the array.

If the number of unique elements be k, then,

Change the array nums such that the first k elements of nums contain the unique values in the order that they were present originally.
The remaining elements, as well as the size of the array does not matter in terms of correctness.

*/

removeDuplicates(List<int> nums) {
  var hashMap = {};

  for (var i = 0; i <= nums.length - 1; i++) {
    if (!hashMap.containsKey(nums[i])) {
      // hashMap.addAll({nums[i]: 1});
      hashMap[nums[i]] = 1;
    } else {
      // hashMap.update(nums[i], (value) => value + 1);
      hashMap[nums[i]]++;
    }
  }
  print(hashMap);
  int k = 0;

  // hashMap.forEach((key, value) {
  //   if (value > 1) {
  //     int val = value - 1;
  //     k = k + val;
  //   }
  // });

  var uniqueLists = hashMap.keys.toList();
  k = uniqueLists.length;
  return k;
}

// Find missing number

missingNumber(nums) {
  // // o(n^2)
  // var hashmap = {};

  // for (var i = 0; i < nums.length - 1; i++) {
  //   hashmap[nums[i]] = 1;
  // }
  // print(hashmap);

  // for (var i = 0; i <= nums.length - 1; i++) {
  //   if (!hashmap.containsKey(i)) {
  //     return i;
  //   }
  // }

  // return -1;

  // o(n)
  int n = nums.length;

  double sum = (n * (n + 1)) / 2;
  double sum2 = 0;

  for (int i = 0; i < n; i++) {
    sum2 += nums[i] as int;
  }
  return sum - sum2;
}

// Union of two sorted arrays
/*
Given two sorted arrays nums1 and nums2, return an array that contains the union of these two arrays. The elements in the union must be in ascending order.



The union of two arrays is an array where all values are distinct and are present in either the first array, the second array, or both.
*/
unionArray(nums1, nums2) {
  var hashMap = {};

  for (var i = 0; i <= nums1.length - 1; i++) {
    hashMap[nums1[i]] = i;
  }

  for (var i = 0; i <= nums2.length - 1; i++) {
    hashMap[nums2[i]] = i;
  }

  print(hashMap);

  var res = hashMap.keys.toList();
  res.sort();
  return res;
}

// Intersection of two sorted arrays
/*
Given two sorted arrays, nums1 and nums2, return an array containing the intersection of these two arrays. Each element in the result must appear as many times as it appears in both arrays.


The intersection of two arrays is an array where all values are present in both arrays.
*/

List<int> intersectionArray(List<int> nums1, List<int> nums2) {
  // for sorted array fine
  // List<int> res = [];
  // nums1.sort();
  // nums2.sort();

  // var i = 0, j = 0;
  // while (i < nums1.length && j < nums2.length) {
  //   if (nums1[i] == nums2[j]) {
  //     res.add(nums1[i]);
  //     i++;
  //     j++;
  //   } else if (nums1[i] < nums2[j]) {
  //     i++;
  //   } else {
  //     j++;
  //   }
  // }

  // return res;

  // unsorted array
  List<int> res = [];
  var frequencyMap = {};
  for (var i = 0; i < nums1.length; i++) {
    if (!frequencyMap.containsKey(nums1[i])) {
      frequencyMap[nums1[i]] = 1;
    } else {
      frequencyMap[nums1[i]]++;
    }
  }

  for (var i = 0; i < nums2.length; i++) {
    if (frequencyMap.containsKey(nums2[i]) && frequencyMap[nums2[i]] > 0) {
      res.add(nums2[i]);
      frequencyMap[nums2[i]]--;
    }
  }

  return res;
}

// Majority Element-I
/*
Given an integer array nums of size n, return the majority element of the array.

The majority element of an array is an element that appears more than n/2 times in the array. The array is guaranteed to have a majority element.- [2,2,1,1,1,2,2],[6,5,5]
*/

int majorityElement(List<int> nums) {
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

  var maxkey = 0;
  var maxValue = 0;

  for (var element in hashMap.entries) {
    if (element.value > maxValue) {
      maxkey = element.key;
      maxValue = element.value;
    }
  }

  return maxkey;
}

// Leaders in an Array
/*
Given an integer array nums, return a list of all the leaders in the array.

A leader in an array is an element whose value is strictly greater than all elements to its right in the given array. The rightmost element is always a leader. The elements in the leader array must appear in the order they appear in the nums array.

Input: nums = [1, 2, 5, 3, 1, 2]

Output: [5, 3, 2]

Input: nums = [-3, 4, 5, 1, -4, -5]

Output: [5, 1, -4, -5]
*/

List<int> leaders(List<int> nums) {
  List<int> res = [];
  var leader = -double.maxFinite.toInt();
  for (var i = nums.length - 1; i >= 0; i--) {
    if (i == nums.length - 1) {
      res.add(nums[i]);
      leader = nums[i];
      continue;
    }
    if (nums[i] > leader) {
      res.add(nums[i]);
      leader = nums[i];
    }
  }
  // descending sort
  res.sort((a, b) => b.compareTo(a));
  return res;
}

// Rearrange array elements by sign
/*
Given an integer array nums of even length consisting of an equal number of positive and negative integers.Return the answer array in such a way that the given conditions are met:

Every consecutive pair of integers have opposite signs.

For all integers with the same sign, the order in which they were present in nums is preserved.
The rearranged array begins with a positive integer.

*/

List<int> rearrangeArray(List<int> nums) {
  //get positive and negative arrays
  var pos = [];
  var neg = [];
  for (var i = 0; i < nums.length; i++) {
    if (nums[i] >= 0) {
      pos.add(nums[i]);
    } else {
      neg.add(nums[i]);
    }
  }
  print(pos);
  print(neg);

  for (var i = 0; i < nums.length / 2; i++) {
    nums[2 * i] = pos[i];
    nums[(2 * i) + 1] = neg[i];
  }

  return nums;
}

// Print the matrix in spiral manner
/*
Given an M * N matrix, print the elements in a clockwise spiral manner.

Return an array with the elements in the order of their appearance when printed in a spiral manner.
Input: matrix = [[1, 2, 3], [4 ,5 ,6], [7, 8, 9]]

Output: [1, 2, 3, 6, 9, 8, 7, 4, 5]

Explanation:

The elements in the spiral order are 1, 2, 3 -> 6, 9 -> 8, 7 -> 4, 5
*/

List<int> spiralOrder(List<List<int>> matrix) {
  var rows = matrix.length;
  var column = matrix[0].length;

  var left = 0;
  var top = 0;
  var right = column - 1;
  var bottom = rows - 1;

  List<int> ans = [];

  while (left <= right && top <= bottom) {
    // Traverse from left to right -> top constant
    for (var i = left; i <= right; i++) {
      ans.add(matrix[top][i]);
    }
    top++;

    // Traverse from top to bottom - >right constant
    for (var i = top; i <= bottom; i++) {
      ans.add(matrix[i][right]);
    }
    right--;
    // Traverse from right to left->bottom constant
    if (top <= bottom) {
      for (var i = right; i >= left; i--) {
        ans.add(matrix[bottom][i]);
      }
      bottom--;
    }

    // Traverse from bottom to top -> left constant
    if (left <= right) {
      for (var i = bottom; i >= top; i--) {
        ans.add(matrix[i][left]);
      }
      left++;
    }
  }
  return ans;
}

// Pascal's Triangle I
/*
Given two integers r and c, return the value at the rth row and cth column (1-indexed) in a Pascal's Triangle.

In Pascal's triangle:

The first row contains a single element 1.

Each row has one more element than the previous row.

Every row starts and ends with 1.

For all interior elements (i.e., not at the ends), the value at position (r, c) is computed as the sum of the two elements directly above it from the previous row:

Pascal[r][c]=Pascal[r−1][c−1]+Pascal[r−1][c]
where indexing is 1-based

Examples:
Input: r = 4, c = 2

Output: 3

Explanation:

The Pascal's Triangle is as follows:

1

1 1

1 2 1

1 3 3 1

....

Thus, value at row 4 and column 2 = 3


*/

pascalTriangleI(r, c) {
  return nCr(r - 1, c - 1);
}

// Function to calculate nCr
nCr(int n, int r) {
  int res = 1;
  // Calculate nCr using iterative method avoiding overflow
  for (int i = 0; i < r; i++) {
    res = res * (n - i);
    res = res ~/ (i + 1);
  }
  return res;
}

// Pascal's Triangle II
/*
Given an integer r, return all the values in the rth row (1-indexed) in Pascal's Triangle in correct order.



In Pascal's triangle:



The first row has one element with a value of 1.


Each row has one more element in it than its previous row.


The value of each element is equal to the sum of the elements directly above it when arranged in a triangle format.

Examples:
Input: r = 4

Output: [1, 3, 3, 1]

Explanation:

The Pascal's Triangle is as follows:

1

1 1

1 2 1

1 3 3 1

....

Thus the 4th row is [1, 3, 3, 1]

Input: r = 5

Output: [1, 4, 6, 4, 1]

Explanation:

The Pascal's Triangle is as follows:

1

1 1

1 2 1

1 3 3 1

1 4 6 4 1

....

Thus the 5th row is [1, 4, 6, 4, 1]

Input: r = 6

Output:
[1, 5, 10, 5, 1]
[1, 4, 6, 4, 1]
[1, 5, 10, 10, 5, 1]
[5, 10, 15, 15,10, 5]

Submit
Constraints:
1 <= r <= 30
All values will fit inside a 32-bit integer.

*/
pascalTriangleII(int r) {
  int ans = 1;
  // print(ans);
  stdout.write('$ans ');
  for (var i = 1; i < r; i++) {
    ans = ans * (r - i);
    ans = ans ~/ i;
    stdout.write('$ans ');
  }
  print(' ');
}

// Pascal's Triangle III
/*
Given an integer n, return the first n (1-Indexed) rows of Pascal's triangle.

In Pascal's triangle:

The first row has one element with a value of 1.
Each row has one more element in it than its previous row.
The value of each element is equal to the sum of the elements directly above it when arranged in a triangle format.

Examples:
Input: n = 4

Output: [[1], [1, 1], [1, 2, 1], [1, 3, 3, 1]]

Explanation: The Pascal's Triangle is as follows:

1

1 1

1 2 1

1 3 3 1

1st Row has its value set to 1.

All other cells take their value as the sum of the values directly above them
*/

List<List<int>> generate(int numRows) {
  List<List<int>> res = [];

  for (var i = 1; i <= numRows; i++) {
    var rows = generateRow(i);
    res.add(rows);
  }

  return res = [];
}

// Function to generate a single row of Pascal's Triangle
List<int> generateRow(int row) {
  int ans = 1;

  List<int> ansRow = [];
  ansRow.add(ans);
  for (var i = 1; i < row; i++) {
    ans = ans * (row - i);
    ans = ans ~/ i;
    ansRow.add(ans);
  }
  return ansRow;
}
