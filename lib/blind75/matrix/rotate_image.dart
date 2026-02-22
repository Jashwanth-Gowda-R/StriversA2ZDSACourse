// Rotate matrix by 90 degrees
/*
Given an N * N 2D integer matrix, rotate the matrix by 90 degrees clockwise.

The rotation must be done in place, meaning the input 2D matrix must be modified directly.

Input: matrix = [[1,2,3],
                [4,5,6],
                [7,8,9]]
Output: [[7,4,1],[8,5,2],[9,6,3]]

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

Complexity Analysis 
Time Complexity: O(N2) +O(N2), to linearly iterate and find transpose of the matrix and 
another O(N2) to find the reverse of each row.

Space Complexity: O(1), as no extra space is being used.

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

void main() {
  rotate([
    [5, 1, 9, 11],
    [2, 4, 8, 10],
    [13, 3, 6, 7],
    [15, 14, 12, 16]
  ]);
}
