// ignore_for_file: file_names

//  Number of 1 Bits

/*
Given a positive integer n, write a function that returns the number of set bits in 
its binary representation (also known as the Hamming weight).

 

Example 1:

Input: n = 11

Output: 3

Explanation:

The input binary string 1011 has a total of three set bits.

Example 2:

Input: n = 128

Output: 1

Explanation:

The input binary string 10000000 has a total of one set bit.

Example 3:

Input: n = 2147483645

Output: 30

Explanation:

The input binary string 1111111111111111111111111111101 has a total of thirty set bits.

*/

void main() {
  print('hammingWeight(11) = ${hammingWeight(11)}'); // 3
  print('hammingWeight(128) = ${hammingWeight(128)}'); // 1
  print('hammingWeight(2147483645) = ${hammingWeight(2147483645)}'); // 30
  print('hammingWeight(0) = ${hammingWeight(0)}'); // 0
  print('hammingWeight(1) = ${hammingWeight(1)}'); // 1
  print('hammingWeight(7) = ${hammingWeight(7)}'); // 3 (111)
}

// Solution 1: Using %2 and Right Shift
int hammingWeight(int n) {
  int count = 0;
  int num = n; // Work with a copy to avoid modifying the original

  while (num > 0) {
    // Check if the least significant bit is 1
    if (num % 2 == 1) {
      count++;
    }
    // Right shift to examine the next bit
    num = num >> 1; // Same as num ~/ 2
  }

  return count;
}

/*
Why num & 1 Works:
1 in binary is 000...0001

num & 1 will be 1 only if the last bit of num is 1

Otherwise it's 0

*/

// Solution 2: Using Bitwise AND (More Efficient)
int hammingWeight2(int n) {
  int count = 0;
  int num = n;

  while (num > 0) {
    // Check if least significant bit is 1 using bitwise AND
    count += num & 1; // Adds 1 if last bit is 1, adds 0 if last bit is 0
    num = num >> 1; // Right shift by 1
  }

  return count;
}

// Solution 3: Built-in Method (Dart Specific)
int hammingWeight3(int n) {
  // Convert to binary string and count '1's
  return n.toRadixString(2).split('').where((c) => c == '1').length;

  // Or more concisely:
  // return n.toRadixString(2).replaceAll('0', '').length;
}
