// Group Anagrams

/*
Given an array of strings strs, group the anagrams together. 
You can return the answer in any order.


Example 1:

Input: strs = ["eat","tea","tan","ate","nat","bat"]

Output: [["bat"],["nat","tan"],["ate","eat","tea"]]

Explanation:

There is no string in strs that can be rearranged to form "bat".
The strings "nat" and "tan" are anagrams as they can be rearranged to form each other.
The strings "ate", "eat", and "tea" are anagrams as they can be rearranged to form each other.
Example 2:

Input: strs = [""]

Output: [[""]]

Example 3:

Input: strs = ["a"]

Output: [["a"]]
*/

void main() {}

/*
1. Sorting
Intuition
Anagrams become identical when their characters are sorted.
For example, "eat", "tea", and "ate" all become "aet" after sorting.
By using the sorted version of each string as a key, we can group all anagrams together.
Strings that share the same sorted form must be anagrams, 
so placing them in the same group is both natural and efficient.

Algorithm
Create a hash map where each key is the sorted version of a string, and the value is a 
list of strings belonging to that anagram group.
Iterate through each string in the input list:
Sort the characters of the string to form a key.
Append the original string to the list corresponding to this key.
After processing all strings, return all values from the hash map, which represent 
the grouped anagrams.

Time & Space Complexity
Time complexity: 
O(m∗nlogn)
Space complexity: 
O(m∗n)
Where 
m is the number of strings and 
n is the length of the longest string.

*/
List<List<String>> groupAnagramsBrute(List<String> strs) {
  // HashMap to store groups
  final anagramGroups = <String, List<String>>{};

  for (final str in strs) {
    // Sort the string to get its signature
    final chars = str.split('')..sort();
    final signature = chars.join();

    // Add to appropriate group
    if (anagramGroups.containsKey(signature)) {
      anagramGroups[signature]!.add(str);
    } else {
      anagramGroups[signature] = [str];
    }
    anagramGroups.putIfAbsent(signature, () => []).add(signature);
  }

  // Convert map values to list
  return anagramGroups.values.toList();
}

// optimal - Hash Table
/*
Intuition
Instead of sorting each string, we can represent every string by the frequency of its 
characters.
Since the problem uses lowercase English letters, a fixed-size array of length 26 can 
capture how many times each character appears.
Two strings are anagrams if and only if their frequency arrays are identical.
By using this frequency array (converted to a tuple so it can be a dictionary key), 
we can group all strings that share the same character counts.

Algorithm
Create a hash map where each key is a 26-length tuple representing character frequencies, 
and each value is a list of strings belonging to that anagram group.
For each string in the input:
Initialize a count array of size 26 with all zeros.
For each character c in the string, increment the count at the corresponding index.
Convert the count array to a tuple and use it as the key.
Append the string to the list associated with this key.
After processing all strings, return all the lists stored in the hash map.


Time & Space Complexity
Time complexity: 

O(m∗n)
Space complexity:

O(m) extra space.

O(m∗n) space for the output list.
Where 

m is the number of strings and 

n is the length of the longest string.
*/

List<List<String>> groupAnagrams(List<String> strs) {
  // Map to store groups of anagrams
  // Key: Frequency signature string
  // Value: List of anagram words
  final Map<String, List<String>> anagramMap = {};

  for (final String word in strs) {
    // Step 1: Create frequency counter for 26 lowercase letters
    // Initialize array with 26 zeros (a-z)
    final List<int> charCounts = List<int>.filled(26, 0);

    // Step 2: Count frequency of each character in word
    for (final int charCode in word.runes) {
      // Convert character to index (0-25)
      // 'a'.codeUnitAt(0) = 97, so 'a' → 0, 'b' → 1, etc.
      final int index = charCode - 'a'.codeUnitAt(0);
      charCounts[index] += 1;
    }

    // Step 3: Create unique signature from frequency counts
    // Convert [1,0,0,2,...] to "1,0,0,2,..." string
    final String signature = charCounts.join(',');

    // Step 4: Group word with its anagrams
    // If signature doesn't exist, create new list, then add word
    // If signature exists, get existing list and append word
    if (!anagramMap.containsKey(signature)) {
      anagramMap[signature] = [word];
    } else {
      anagramMap[signature]!.add(word);
    }
  }

  // Step 5: Return all anagram groups
  // Convert map values to list of lists
  return anagramMap.values.toList();
}
