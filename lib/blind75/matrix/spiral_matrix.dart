//Spiral Matrix

void main() {
  var spiralOrdervar = spiralOrder([
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9]
  ]);
  print(spiralOrdervar);
}

// Print the matrix in spiral manner
/*
Given an M * N matrix, print the elements in a clockwise spiral manner.

Return an array with the elements in the order of their appearance when printed in a spiral manner.
Input: matrix = [[1, 2, 3],
                 [4 ,5 ,6],
                [7, 8, 9]]

Output: [1, 2, 3, 6, 9, 8, 7, 4, 5]

Explanation:

The elements in the spiral order are 1, 2, 3 -> 6, 9 -> 8, 7 -> 4, 5


Complexity Analysis 
Time Complexity: O(MxN) since all the elements are being traversed once and 
there are total N x M elements ( M elements in each row and total N rows) 
so the time complexity will be O(N x M).

Space Complexity: O(1) as extra space to store answer is not considered.
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
