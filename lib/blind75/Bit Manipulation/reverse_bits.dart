// Reverse Bits

/*
Reverse bits of a given 32 bits signed integer.

Example 1:

Input: n = 43261596

Output: 964176192

Explanation:

Integer	Binary
43261596	00000010100101000001111010011100
964176192	00111001011110000010100101000000
Example 2:

Input: n = 2147483644

Output: 1073741822

Explanation:

Integer	Binary
2147483644	01111111111111111111111111111100
1073741822	00111111111111111111111111111110

Step-by-Step Visual Explanation
Let's trace through a simple example with an 8-bit number (conceptually similar to 32-bit):

Example: Reverse bits of n = 13 (binary: 00001101 in 8-bit)

text
Original: 0 0 0 0 1 1 0 1
Positions: 7 6 5 4 3 2 1 0 (LSB at position 0)

Goal:     1 0 1 1 0 0 0 0
Positions: 7 6 5 4 3 2 1 0
Iteration through loop:

i	Bit from (n >> i) & 1	     Position to place (31-i)	Operation	Result after
0	(13 >> 0) & 1 = 13 & 1 = 1	31-0 = 31 (in 8-bit: 7)	1 << 7 = 128	128
1	(13 >> 1) & 1 = 6 & 1 = 0	31-1 = 30 (in 8-bit: 6)	0 << 6 = 0	128
2	(13 >> 2) & 1 = 3 & 1 = 1	31-2 = 29 (in 8-bit: 5)	1 << 5 = 32	160
3	(13 >> 3) & 1 = 1 & 1 = 1	31-3 = 28 (in 8-bit: 4)	1 << 4 = 16	176
4	(13 >> 4) & 1 = 0 & 1 = 0	31-4 = 27 (in 8-bit: 3)	0 << 3 = 0	176
5	(13 >> 5) & 1 = 0 & 1 = 0	31-5 = 26 (in 8-bit: 2)	0 << 2 = 0	176
6	(13 >> 6) & 1 = 0 & 1 = 0	31-6 = 25 (in 8-bit: 1)	0 << 1 = 0	176
7	(13 >> 7) & 1 = 0 & 1 = 0	31-7 = 24 (in 8-bit: 0)	0 << 0 = 0	176
Final: 176 in decimal = 10110000 in binary ✓



Key Insights
Bit extraction: (n >> i) & 1 is the standard way to get the i-th bit

Bit placement: bit << (31 - i) puts the bit in its mirrored position

Accumulation: Using += works because positions never overlap (each bit goes to a unique position)

32-bit assumption: The algorithm assumes 32-bit integers (standard for this problem)

*/

void main() {
  // Test case 1
  int n1 = 43261596;
  print('Input: $n1');
  print('Binary: ${n1.toRadixString(2).padLeft(32, '0')}');
  int result1 = reverseBits(n1);
  print('Output: $result1');
  print('Binary: ${result1.toRadixString(2).padLeft(32, '0')}');
  print('---');

  // Test case 2
  int n2 = 2147483644;
  print('Input: $n2');
  print('Binary: ${n2.toRadixString(2).padLeft(32, '0')}');
  int result2 = reverseBits(n2);
  print('Output: $result2');
  print('Binary: ${result2.toRadixString(2).padLeft(32, '0')}');
}

int reverseBits(int n) {
  int result = 0;

  // Process all 32 bits (since it's a 32-bit integer)
  for (int i = 0; i < 32; i++) {
    // Step 1: Extract the i-th bit from the original number
    // (n >> i) shifts the i-th bit to the least significant position
    // & 1 masks only that bit (gets 0 or 1)
    int bit = (n >> i) & 1;

    // Step 2: Place this bit in its reversed position
    // (31 - i) is the mirrored position
    // (bit << (31 - i)) moves the bit to its new position
    // Add to result (using += is same as OR operation since positions don't overlap)
    result += (bit << (31 - i));
  }

  return result;
}

int reverseBits2(int n) {
  // Convert to binary string, reverse, and parse back
  String binary = n.toRadixString(2).padLeft(32, '0');
  String reversed = binary.split('').reversed.join('');
  return int.parse(reversed, radix: 2);
}
