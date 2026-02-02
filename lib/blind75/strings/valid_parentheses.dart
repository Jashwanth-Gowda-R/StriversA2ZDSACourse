// Valid Parentheses

/*
Given a string s containing just the characters '(', ')', '{', '}', '[' and ']', 
determine if the input string is valid.

An input string is valid if:

Open brackets must be closed by the same type of brackets.
Open brackets must be closed in the correct order.
Every close bracket has a corresponding open bracket of the same type.
 

Example 1:

Input: s = "()"

Output: true

Example 2:

Input: s = "()[]{}"

Output: true

Example 3:

Input: s = "(]"

Output: false

Example 4:

Input: s = "([])"

Output: true

Example 5:

Input: s = "([)]"

Output: false

Complexity Analysis:
Time Complexity: O(N) (where N is the length of the string)
Traversing the string once takes O(N) time.

Space Complexity: O(N)
In the worst case (when the string contains only opening brackets), 
the stack will store all the characters, taking O(N) space.


*/

/// Validates if the given string has properly matched and ordered brackets.
///
/// Returns true if:
/// 1. Open brackets are closed by the same type of brackets.
/// 2. Open brackets are closed in the correct order.
/// 3. Every close bracket has a corresponding open bracket of the same type.
///
/// Time Complexity: O(n) where n is the length of the string
/// Space Complexity: O(n) for the stack in worst case
bool isValid(String s) {
  // Map of opening to closing brackets
  final Map<String, String> bracketPairs = {
    '(': ')',
    '{': '}',
    '[': ']',
  };

  // Edge case 1: If length is odd, it cannot be valid
  // (Every bracket needs a pair, so total must be even)
  if (s.length % 2 != 0) {
    return false;
  }

  // Edge case 2: If first character is a closing bracket, invalid
  // Valid strings must start with an opening bracket
  if (s[0] == ')' || s[0] == '}' || s[0] == ']') {
    return false;
  }

  // Edge case 3: If last character is an opening bracket, invalid
  // Valid strings must end with a closing bracket
  if (s[s.length - 1] == '(' ||
      s[s.length - 1] == '{' ||
      s[s.length - 1] == '[') {
    return false;
  }

  // Stack to track opening brackets
  final List<String> stack = [];

  // Traverse through each character in the string
  for (int i = 0; i < s.length; i++) {
    final currentChar = s[i];

    // If it's an opening bracket, push to stack
    if (bracketPairs.containsKey(currentChar)) {
      stack.add(currentChar);
    }
    // If it's a closing bracket
    else {
      // If stack is empty, there's no matching opening bracket
      if (stack.isEmpty) {
        return false;
      }

      // Pop the last opening bracket from stack
      final lastOpening = stack.removeLast();

      // Check if current closing bracket matches the last opening bracket
      if (bracketPairs[lastOpening] != currentChar) {
        return false;
      }
    }
  }

  // After processing all characters, stack should be empty
  // If not empty, some opening brackets weren't closed
  return stack.isEmpty;
}

void main() {
  print(isValid('([])'));
}
