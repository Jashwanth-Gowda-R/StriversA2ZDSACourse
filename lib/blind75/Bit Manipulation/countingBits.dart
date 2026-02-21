// ignore_for_file: file_names

// Counting Bits

/*
Given an integer n, return an array ans of length n + 1 such that 
for each i (0 <= i <= n), ans[i] is the number of 1's in the binary representation of i.


Example 1:

Input: n = 2
Output: [0,1,1]
Explanation:
0 --> 0
1 --> 1
2 --> 10
Example 2:

Input: n = 5
Output: [0,1,1,2,1,2]
Explanation:
0 --> 0
1 --> 1
2 --> 10
3 --> 11
4 --> 100
5 --> 101


*/

// Bit Manipulation (DP)

/*
Intuition
We want to compute the number of set bits (1s) for all numbers from 0 to n efficiently.

A key observation from binary representation is:

Numbers repeat their bit patterns every time we reach a power of two
When a number is a power of two, it has exactly one 1 bit
Any number i can be written as:
i = highestPowerOfTwo ≤ i + remainder
So, the number of set bits in i is:

1 (for the highest power of two) + number of set bits in the remainder
This allows us to build the solution incrementally using Dynamic Programming,
 reusing results we have already computed.

Algorithm
Create a DP array dp of size n + 1
dp[i] will store the number of set bits in i
Initialize:
dp[0] = 0
offset = 1 (tracks the most recent power of two)
For each number i from 1 to n:
If i reaches the next power of two (i == 2 * offset):
Update offset = i
Compute:
dp[i] = 1 + dp[i - offset]
Return the DP array.


Time & Space Complexity
Time complexity: 

O(n)
Space complexity:

O(1) extra space.

O(n) space for the output array.

Visual Explanation
Here's a visual representation of the pattern for numbers 0-8:

Number  | Binary  | # of 1s | Pattern
--------|---------|---------|---------
0       | 0000    | 0       | base case
1       | 0001    | 1       | 1 + dp[0]
2       | 0010    | 1       | 1 + dp[0] (power of 2)
3       | 0011    | 2       | 1 + dp[1]
4       | 0100    | 1       | 1 + dp[0] (power of 2)
5       | 0101    | 2       | 1 + dp[1]
6       | 0110    | 2       | 1 + dp[2]
7       | 0111    | 3       | 1 + dp[3]
8       | 1000    | 1       | 1 + dp[0] (power of 2)


Pattern Recognition
Notice the pattern:

Powers of two (1, 2, 4, 8, 16...) always have exactly 1 set bit

Between powers of two, the count follows the pattern of previous numbers:

Numbers 4-7 follow the same pattern as numbers 0-3, but with an extra 1 at the front

Numbers 8-15 follow the pattern of 0-7, with an extra 1 at the front

dp[i] = 1 + dp[i - highestPowerOfTwo]

*/

void main() {
  print('n = 2: ${countBits(2)}'); // [0, 1, 1]
  print('n = 5: ${countBits(5)}'); // [0, 1, 1, 2, 1, 2]
  print('n = 0: ${countBits(0)}'); // [0]
  print('n = 1: ${countBits(1)}'); // [0, 1]
  print('n = 8: ${countBits(8)}'); // [0, 1, 1, 2, 1, 2, 2, 3, 1]
}

// Counting Bits - Dart Solution with Dynamic Programming - dp[i] = 1 + dp[i - highestPowerOfTwo]
List<int> countBits(int n) {
  int offset = 1;
  List<int> dp = List<int>.filled(n + 1, 0);

  for (int i = 1; i <= n; i++) {
    if (offset * 2 == i) {
      offset = i;
    }
    dp[i] = 1 + dp[i - offset];
  }

  return dp;
}
