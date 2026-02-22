// Set Matrix Zeroes

/*
Given an m x n integer matrix matrix, if an element is 0, set its entire row and column to 0's.

You must do it in place.

Example 1:


Input: matrix = [[1,1,1],[1,0,1],[1,1,1]]
Output: [[1,0,1],[0,0,0],[1,0,1]]
Example 2:


Input: matrix = [[0,1,2,0],[3,4,5,2],[1,3,1,5]]
Output: [[0,0,0,0],[0,4,5,0],[0,3,1,0]]


Intuition
To optimize space complexity, we can use the first row and the first column of the matrix 
itself to store the markers, instead of using extra arrays. 
This reduces the extra space from O(m + n) to O(1). However, we need to be cautious about 
using the first row and column for marking, as they may also be part of the matrix.

Approach
Use the first row and the first column to mark which rows and columns need to be set to zero.
If the first row or the first column needs to be zeroed, use additional variables to remember 
this.
Traverse the matrix and mark the first row and first column accordingly.
Finally, use the first row and column markers to set the respective rows and columns to zero.


Space Complexity Optimization
This algorithm achieves O(1) extra space by:

Using the first row as a marker for columns that need to be zeroed

Using the first column as a marker for rows that need to be zeroed

Only using two boolean flags for the first row and column themselves

Time Complexity
O(m × n) - We traverse the matrix multiple times, but each pass is O(m×n)

Total operations: ~3 passes through the matrix
 */
void main() {
  // Test case 1
  List<List<int>> matrix1 = [
    [1, 1, 1],
    [1, 0, 1],
    [1, 1, 1]
  ];

  print('Original matrix 1:');
  printMatrix(matrix1);

  setZeroes(matrix1);

  print('\nAfter setZeroes:');
  printMatrix(matrix1);
  // Expected: [[1,0,1], [0,0,0], [1,0,1]]

  print('\n${'-' * 30}');

  // Test case 2
  List<List<int>> matrix2 = [
    [0, 1, 2, 0],
    [3, 4, 5, 2],
    [1, 3, 1, 5]
  ];

  print('Original matrix 2:');
  printMatrix(matrix2);

  setZeroes(matrix2);

  print('\nAfter setZeroes:');
  printMatrix(matrix2);
  // Expected: [[0,0,0,0], [0,4,5,0], [0,3,1,0]]
}

// Helper function to print matrix
void printMatrix(List<List<int>> matrix) {
  for (var row in matrix) {
    print(row.map((e) => e.toString().padLeft(3)).join(''));
  }
}

void setZeroes(List<List<int>> matrix) {
  int m = matrix.length; // Number of rows
  int n = matrix[0].length; // Number of columns

  // Flags to check if first row and first column need to be zeroed
  bool firstRowZero = false;
  bool firstColZero = false;

  // Step 1: Check if the first column contains any zero
  for (int i = 0; i < m; i++) {
    if (matrix[i][0] == 0) {
      firstColZero = true;
      break; // Found a zero, no need to check further
    }
  }

  // Step 2: Check if the first row contains any zero
  for (int j = 0; j < n; j++) {
    if (matrix[0][j] == 0) {
      firstRowZero = true;
      break; // Found a zero, no need to check further
    }
  }

  // Step 3: Use first row and first column as markers
  // Traverse the rest of the matrix (excluding first row and column)
  for (int i = 1; i < m; i++) {
    for (int j = 1; j < n; j++) {
      if (matrix[i][j] == 0) {
        // Mark the corresponding first column element for this row
        matrix[i][0] = 0;
        // Mark the corresponding first row element for this column
        matrix[0][j] = 0;
      }
    }
  }

  // Step 4: Set zeros based on markers in first row and column
  for (int i = 1; i < m; i++) {
    for (int j = 1; j < n; j++) {
      // If either the row marker or column marker is zero, set current cell to zero
      if (matrix[i][0] == 0 || matrix[0][j] == 0) {
        matrix[i][j] = 0;
      }
    }
  }

  // Step 5: Handle the first row if it needs to be zeroed
  if (firstRowZero) {
    for (int j = 0; j < n; j++) {
      matrix[0][j] = 0;
    }
  }

  // Step 6: Handle the first column if it needs to be zeroed
  if (firstColZero) {
    for (int i = 0; i < m; i++) {
      matrix[i][0] = 0;
    }
  }
}
