// ignore_for_file: file_names

//  Sum of Two Integers - https://neetcode.io/solutions/sum-of-two-integers

/*
Given two integers a and b, return the sum of the two integers 
without using the operators + and -.


Example 1:

Input: a = 1, b = 2
Output: 3
Example 2:

Input: a = 2, b = 3
Output: 5

*/

/*
Bit Manipulation (Optimal)
Intuition
We need to add two integers without using + or -.
Binary addition can be built from two operations:

Sum without carry
a XOR b gives the bit-by-bit sum ignoring carry
(because 1 XOR 1 = 0, which matches sum without carry)
Carry information
a AND b tells us where both bits are 1, which creates a carry
shifting left by 1 (<< 1) moves that carry to the next higher bit
So we can repeatedly:

compute the carry
update the partial sum using XOR
add the carry again (by setting b = carry)
We keep doing this until there is no carry left (b == 0).

Because many languages use fixed-width integers (like 32-bit signed integers), 
we use a mask to keep only the lower 32 bits at each step. Finally, if the result 
represents a negative number in 32-bit two's complement form, we convert it back to a 
signed integer.

Algorithm
Define constants for 32-bit handling:
mask to keep only 32 bits
max_int as the largest 32-bit signed integer
While b is not zero:
Compute carry:
carry = (a AND b) << 1
Compute sum without carry:
a = (a XOR b), then apply the 32-bit mask
Move carry into b (also masked to 32 bits)
After the loop, a holds the 32-bit result.
If a is within signed range, return it directly.
Otherwise, convert from unsigned 32-bit to a negative signed value and return it.

Key Insights
XOR gives sum without carry - Like adding in base-2 without considering carries

AND gives carry positions - Shows where both bits are 1

Left shift moves carry - Carries affect the next higher bit

Masking handles overflow - Simulates fixed-width integer behavior

Two's complement conversion - Properly represents negative results


Time & Space Complexity
Time: O(number of bits) ≈ O(32) for 32-bit integers, O(1) practically

Space: O(1) - only uses a few variables

The Algorithm Formula:
a + b = (a ⊕ b) + ((a & b) << 1)

Why This Works: Mathematical Foundation
Binary Addition Truth Table:
a	b	Sum (a⊕b)	Carry (a&b)
0	0	0	0
0	1	1	0
1	0	1	0
1	1	0	1

*/

void main() {
  // Test cases
  print('5 + 3 = ${getSum(5, 3)}'); // 8
  print('10 + 7 = ${getSum(10, 7)}'); // 17
  print('-5 + 3 = ${getSum(-5, 3)}'); // -2
  print('0 + 0 = ${getSum(0, 0)}'); // 0
  print('100 + 200 = ${getSum(100, 200)}'); // 300
}

// Time and Space Complexity - O(1)
int getSum(int a, int b) {
  // runs until no more carry
  while (b != 0) {
    final xor = a ^ b; // Sum without carry
    final carry = (a & b) << 1; // Carry shifted left

    a = xor; // Update a with partial sum
    b = carry; // Update b with carry for next iteration
  }
  return a;
}
