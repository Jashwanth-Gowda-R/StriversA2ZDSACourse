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
void main() {
  var palindromeRecursion = isPalindromeRecursion("hannah", 0, 5);
  print('check palindrome of string using recursion = $palindromeRecursion');
  print('-------');
  var isPali = isPalindrome(121);
  print(isPali);
  print('-------');
}

// recursion method
bool isPalindromeRecursion(String s, int i, int j) {
  if (i > j / 2) {
    return true;
  }
  // check s[i]==s[j]
  // if not true return false else true
  if (s[i] != s[j]) {
    return false;
  } else {
    return isPalindromeRecursion(s, i + 1, j - 1);
  }
}

// for integers input
bool isPalindrome(int x) {
  // Handle edge cases
  if (x < 0) return false; // Negative numbers can't be palindromes
  if (x < 10) return true; // Single digit numbers are palindromes
  // Store the original number for later comparison
  var givenNum = x;

  // // Take absolute value to handle negative numbers
  // // Example: -121 becomes 121
  // x = x.abs();

  // Initialize variable to store the reversed number
  var reverseNumber = 0;

  // Reverse the number digit by digit
  while (x > 0) {
    // Step 1: Get the last digit of current number
    // Example: x = 121, lastNumber = 121 % 10 = 1
    var lastNumber = x % 10;

    // Step 2: Remove the last digit from x
    // Example: x = 121 ~/ 10 = 12 (integer division)
    x = x ~/ 10;

    // Step 3: Build the reversed number
    // Example: reverseNumber = (0 * 10) + 1 = 1
    // Next iteration: reverseNumber = (1 * 10) + 2 = 12
    // Next iteration: reverseNumber = (12 * 10) + 1 = 121
    reverseNumber = (reverseNumber * 10) + lastNumber;
  }

  // Debug: print the reversed number
  print(reverseNumber);

  // Check if original number equals reversed number
  // Using ternary operator for compact syntax
  return givenNum == reverseNumber ? true : false;
  // Can be simplified to: return givenNum == reverseNumber;
}
