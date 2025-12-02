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
