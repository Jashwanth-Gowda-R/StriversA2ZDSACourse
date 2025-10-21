import 'dart:math';

void main() {
  printAllDigitsOfNumber(10);
  print('-------');
  var res = reverse(120);
  print(res);
  print('-------');
  var isPali = isPalindrome(121);
  print(isPali);
  print('-------');
  var armstrongNumber = isArmstrongNumber(153);
  print(armstrongNumber);
}

// Count all Digits of a Number
/*
Examples:
Input: n = 4

Output: 1

Explanation: There is only 1 digit in 4.

Input: n = 14

Output: 2

Explanation: There are 2 digits in 14.
*/

void printAllDigitsOfNumber(int n) {
  var total = 0;
  while (n > 0) {
    total += 1;
    n = n ~/ 10;
  }
  print(total);
}

//  Reverse Integer

/*
Given a signed 32-bit integer x, return x with its digits reversed. If reversing x causes the value to go outside the signed 32-bit integer range [-231, 231 - 1], then return 0.

Assume the environment does not allow you to store 64-bit integers (signed or unsigned).

 

Example 1:

Input: x = 123
Output: 321
Example 2:

Input: x = -123
Output: -321
Example 3:

Input: x = 120
Output: 21


*/

/// in Dart uses 64-bit integers by default
/// Dart integers are 64-bit, so 9646324351 is valid in Dart
// But the problem requires 32-bit integer constraints ([-2³¹, 2³¹ - 1])

int reverse(int x) {
  var reverseNumber = 0;
  bool isNegative = x < 0;
  x = x.abs();
  while (x > 0) {
    var lastDigit = x % 10;
    x = x ~/ 10;
    var temp = (reverseNumber * 10) + lastDigit;
    // Explicit 32-bit overflow check
    if (reverseNumber > 214748364) {
      return 0;
    }
    if (reverseNumber == 214748364 && lastDigit > 7) {
      return 0;
    }

    reverseNumber = temp;
  }
  return isNegative ? -reverseNumber : reverseNumber;
}

// Palindrome Number
/*
Given an integer x, return true if x is a palindrome, and false otherwise.
Example 1:

Input: x = 121
Output: true
Explanation: 121 reads as 121 from left to right and from right to left.
Example 2:

Input: x = -121
Output: false
Explanation: From left to right, it reads -121. From right to left, it becomes 121-. Therefore it is not a palindrome.
Example 3:

Input: x = 10
Output: false
Explanation: Reads 01 from right to left. Therefore it is not a palindrome.

*/

// palindrome is just reverse of given number is same then is  Palindrome.

bool isPalindrome(int x) {
  var givenNum = x;
  x = x.abs();
  var reverseNumber = 0;
  while (x > 0) {
    var lastNumber = x % 10;
    x = x ~/ 10;
    reverseNumber = (reverseNumber * 10) + lastNumber;
  }
  print(reverseNumber);
  return givenNum == reverseNumber ? true : false;
}

// Check if the Number is Armstrong
/*
You are given an integer n. You need to check whether it is an armstrong number or not. Return true if it is an armstrong number, otherwise return false.



An armstrong number is a number which is equal to the sum of the digits of the number, raised to the power of the number of digits.

Examples:
Input: n = 153

Output: true

Explanation: Number of digits : 3.

1^3 + 5^3 + 3^3 = 1 + 125 + 27 = 153.

Therefore, it is an Armstrong number.

Input: n = 12

Output: false

Explanation: Number of digits : 2.

1^2 + 2^2 = 1 + 4 = 5.

Therefore, it is not an Armstrong number.

*/

bool isArmstrongNumber(int n) {
  var givenNum = n;
  // 1st will take no of digits
  var totalDigits = 0;
  while (n > 0) {
    totalDigits += 1;
    n = n ~/ 10;
  }
  print(totalDigits);

// 2nd: Calculate sum of digits raised to power of totalDigits
  n = givenNum;
  var sum = 0;
  while (n > 0) {
    var lastDigit = n % 10;
    n = n ~/ 10;
    // Calculate power using a loop (since Dart doesn't have ^ for exponentiation)
    int power = 1;
    for (int i = 0; i < totalDigits; i++) {
      power *= lastDigit;
    }
    sum += power;
  }
  print(sum);

  return sum == givenNum;
}
