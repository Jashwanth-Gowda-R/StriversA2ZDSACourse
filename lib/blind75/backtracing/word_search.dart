// Word Search

/*
Given an m x n grid of characters board and a string word, return true if word exists 
in the grid.

The word can be constructed from letters of sequentially adjacent cells, 
where adjacent cells are horizontally or vertically neighboring. 
The same letter cell may not be used more than once.


Example 1:


Input: board = [["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]], word = "ABCCED"
Output: true
Example 2:


Input: board = [["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]], word = "SEE"
Output: true
Example 3:


Input: board = [["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]], word = "ABCB"
Output: false

*/

/*
Real Life Intuition
To solve this problem in real life, imagine being in a grid-like garden where each cell contains a different flower with a letter on it. The goal is to trace a path through adjacent flowers to spell out a given word. Starting from each flower that matches the first letter of the word, inspect neighboring flowers in all four directions (up, down, left, right). Temporarily mark each flower as visited to avoid revisiting it, and backtrack if the current path does not lead to the complete word, restoring the garden's state for subsequent attempts. This process continues until the word is found or all possibilities are exhausted.

Recursive Process Intuition
The recursive process mimics this real-life approach. 
Begin at any cell matching the first letter of the word. Recursively explore adjacent cells 
for the next letter. Temporarily mark cells as visited to avoid repetition. 
If a path spells out the word, return true. If not, go back by unmarking the cell and 
continue exploring other paths. This continues until all possible paths from each starting 
cell are checked.

Approach
Start by iterating through each cell in the grid.
For each cell, check if it matches the first character of the word. f it matches, invoke a helper function to explore all possible paths from this cell.
In the helper function, perform the following checks:
Check if the current index matches the length of the word, indicating the word is found.
Check boundary conditions and character mismatch to prevent invalid accesses.
If the character matches, mark the current cell as visited by temporarily changing its value. Recursively explore all four directions (up, down, left, right) from the current cell for the next character in the word. If any recursive call returns true, propagate this result up the call stack.
After exploring all directions, restore the current cell's original value to allow other paths to use it. Continue this process until all cells and paths are exhausted.
Return true if any path successfully spells out the word; otherwise, return false.

Time & Space Complexity
Time Complexity: O(m × n × 4^L) where:

m = number of rows

n = number of columns

L = length of the word

4^L comes from exploring 4 directions at each step

Space Complexity: O(L) for the recursion stack
*/

void main() {
  // Test case 1
  List<List<String>> board1 = [
    ['A', 'B', 'C', 'E'],
    ['S', 'F', 'C', 'S'],
    ['A', 'D', 'E', 'E']
  ];

  print('Test 1: Word "ABCCED"');
  print('Expected: true');
  print('Result: ${exist(board1, "ABCCED")}');
  print('---');

  // Test case 2
  List<List<String>> board2 = [
    ['A', 'B', 'C', 'E'],
    ['S', 'F', 'C', 'S'],
    ['A', 'D', 'E', 'E']
  ];

  print('Test 2: Word "SEE"');
  print('Expected: true');
  print('Result: ${exist(board2, "SEE")}');
  print('---');

  // Test case 3
  List<List<String>> board3 = [
    ['A', 'B', 'C', 'E'],
    ['S', 'F', 'C', 'S'],
    ['A', 'D', 'E', 'E']
  ];

  print('Test 3: Word "ABCB"');
  print('Expected: false');
  print('Result: ${exist(board3, "ABCB")}');
  print('---');

  // Additional test case
  List<List<String>> board4 = [
    ['A', 'B', 'C'],
    ['D', 'E', 'F'],
    ['G', 'H', 'I']
  ];

  print('Test 4: Word "ABCD"');
  print('Expected: false (needs to be adjacent)');
  print('Result: ${exist(board4, "ABCD")}');
}

bool exist(List<List<String>> board, String word) {
  return true;
}
