// Valid Anagram

/*
Given two strings s and t, return true if t is an anagram of s, and false otherwise.

An Anagram is a word or phrase formed by rearranging the letters of a different word or phrase, 
typically using all the original letters exactly once.

Example 1

Input : s = "anagram" , t = "nagaram"

Output : true

Explanation :

We can rearrange the characters of string s to get string t as frequency of all characters 
from both strings is same.

Example 2

Input : s = "dog" , t = "cat"

Output : false

Explanation :

We cannot rearrange the characters of string s to get string t as frequency of all 
characters from both strings is not same.

Complexity Analysis:
Time Complexity: O(n)
First loop: O(n) where n = length of s

Second loop: O(n) where n = length of t

Third loop: O(k) where k = number of unique characters (max 26 for lowercase, 256 for ASCII)

Total: O(n + n + k) = O(n) (linear time)

Space Complexity: O(k)
HashMap storage: O(k) where k = number of unique characters

For lowercase English: k ≤ 26 → O(1) constant space

For Unicode: k ≤ n → O(n) in worst case

Typically: O(1) for English, O(k) generally

*/

void main() {
  print(isAnagram('anagram', 'nagaram'));
  print(isAnagram('dog', 'cat'));
  print(isAnagram('eat', 'tea'));
}

// brute
bool isAnagramBrute(String s, String t) {
  // Quick length check
  if (s.length != t.length) return false;

  // Sort characters and compare
  final sSorted = s.split('')..sort();
  final tSorted = t.split('')..sort();

  return sSorted.join() == tSorted.join();
}

// optimal
bool isAnagram(String s, String t) {
  // If lengths are not equal, they cannot be anagrams
  if (s.length != t.length) return false;

  var hashmap = {};
// Count characters in s
  for (var i = 0; i < s.length; i++) {
    hashmap[s[i]] = (hashmap[s[i]] ?? 0) + 1;
  }
  print('hashmap of s - $hashmap');

// Subtract characters from t
  for (var i = 0; i < t.length; i++) {
    if (hashmap.containsKey(t[i])) {
      hashmap[t[i]] = (hashmap[t[i]] ?? 0) - 1;
    } else {
      return false;
    }
  }
  print('hashmap of t - $hashmap');

  for (var val in hashmap.values) {
    if (val != 0) {
      return false;
    }
  }

  return true;
}

bool isAnagramMoreOptimal(String s, String t) {
  if (s.length != t.length) return false;

  final freq = <String, int>{};

  // Single pass: increment for s, decrement for t
  for (int i = 0; i < s.length; i++) {
    freq[s[i]] = (freq[s[i]] ?? 0) + 1;
    freq[t[i]] = (freq[t[i]] ?? 0) - 1;
  }

  // Check all counts are zero
  return freq.values.every((count) => count == 0);
}
