import 'dart:io';

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
  print('-------');
  divisorsOfNumber(36);
  print('-------');
  var isprime5 = isPrime(5);
  print('is 5 prime : $isprime5');
  var isprime36 = isPrime(36);
  print('is 36 prime : $isprime36');
  print('-------');
  gcd(9, 8);
  gcd(10, 52);
  gcd(50, 5);
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

// Divisors of a Number
/*
You are given an integer n. You need to find all the divisors of n. Return all the divisors of n as an array or list in a sorted order.



A number which completely divides another number is called it's divisor.

Input: n = 6

Output = [1, 2, 3, 6]

Explanation: The divisors of 6 are 1, 2, 3, 6.

Input: n = 8

Output: [1, 2, 4, 8]

Explanation: The divisors of 8 are 1, 2, 4, 8.
*/

void divisorsOfNumber(int n) {
  for (var i = 1; i <= n; i++) {
    if (n % i == 0) {
      stdout.write('$i ');
    }
  }
  print(' ');
}

// Check for Prime Number

/*
You are given an integer n. You need to check if the number is prime or not. Return true if it is a prime number, otherwise return false.



A prime number is a number which has no divisors except 1 and itself.


Examples:
Input: n = 5

Output: true

Explanation: The only divisors of 5 are 1 and 5 , So the number 5 is prime.

Input: n = 8

Output: false

Explanation: The divisors of 8 are 1, 2, 4, 8, thus it is not a prime number.

*/

// prime no will have only 2 factors not more than that

/* Function to find whether the
    number is prime or not */

// sqrt method
isPrime(n) {
  // Edge case
  if (n < 2) return false;

  // Loop from 2 to √n
  for (var i = 2; i * i <= n; ++i) {
    // Check if i is a divisor
    if (n % i == 0) {
      return false;
    }
  }

  // Return true as the number is prime
  return true;
}

// // sqrt method
// bool isPrimeNumber(int n) {
//   if (n <= 1) return false;
//   if (n == 2) return true;
//   if (n % 2 == 0) return false;

//   var factorCount = 0;
//   for (var i = 1; i * i <= n; i++) {
//     if (n % i == 0) {
//       factorCount++;
//       if (i != n / i) {
//         factorCount++;
//       }
//     }
//     // Early exit - if we already have more than 2 factors, it's not prime
//     if (factorCount > 2) return false;
//   }
//   return factorCount == 2;
// }

// GCD of Two Numbers
/*
You are given two integers n1 and n2. You need find the Greatest Common Divisor (GCD) of the two given numbers. Return the GCD of the two numbers.

The Greatest Common Divisor (GCD) of two integers is the largest positive integer that divides both of the integers.


Examples:
Input: n1 = 4, n2 = 6

Output: 2

Explanation: Divisors of n1 = 1, 2, 4, Divisors of n2 = 1, 2, 3, 6

Greatest Common divisor = 2.

Input: n1 = 9, n2 = 8

Output: 1

Explanation: Divisors of n1 = 1, 3, 9 Divisors of n2 = 1, 2, 4, 8.

Greatest Common divisor = 1.

The most optimal way to solve this problem is to use the Euclidean Algorithm which works on the principle that the GCD of two numbers remains the same even if the smaller number is subtracted from the larger number.

Euclidean Algorithm:
To find the GCD of n1 and n2 where n1 > n2:
Repeatedly subtract the smaller number from the larger number until one of them becomes 0.
Once one of them becomes 0, the other number is the GCD of the original numbers.

*/

void gcd(int n1, int n2) {
  while (n1 != 0 && n2 != 0) {
    if (n1 > n2) {
      n1 = n1 % n2;
    } else {
      n2 = n2 % n1;
    }
  }
  if (n1 == 0) {
    print(n2);
  } else {
    print(n1);
  }
}
