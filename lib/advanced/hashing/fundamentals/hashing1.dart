void main() {
  var mostFrequentElementvar = mostFrequentElement([10000, 10000, 9999, 9999]);
  print(mostFrequentElementvar);

  var secondHighestOccurringElementvar =
      secondMostFrequentElement([4, 4, 5, 5, 6, 6, 7]);
  print(secondHighestOccurringElementvar);

  var sumOfHighestAndLowestFrequencyvar =
      sumHighestAndLowestFrequency([1, 2, 2, 3, 3, 3]);
  print(sumOfHighestAndLowestFrequencyvar);
}

//Highest Occurring Element in an Array
/*
Given an array nums of n integers, find the most frequent element in it i.e., the element that occurs the maximum number of times. If there are multiple elements that appear a maximum number of times, find the smallest of them.

Please note that this section might seem a bit difficult without prior knowledge on what hashing is, we will soon try to add basics concepts for your ease! If you know the concepts already please go ahead to give a shot to the problem. Cheers!
Example 1

Input: nums = [1, 2, 2, 3, 3, 3]

Output: 3

Explanation: The number 3 appears the most (3 times). It is the most frequent element.

Test: [10000, 10000, 9999, 9999]
*/
int mostFrequentElement(nums) {
  var hashMap = {};
  for (var i = 0; i < nums.length; i++) {
    if (hashMap.containsKey(nums[i])) {
      hashMap[nums[i]]++;
    } else {
      hashMap[nums[i]] = 1;
    }
  }
  print(hashMap);
  var maxFrequencyKey = 0;
  var maxFrequency = 0;
  for (var element in hashMap.entries) {
    if (element.value > maxFrequency ||
        (element.value == maxFrequency && element.key < maxFrequencyKey)) {
      maxFrequency = element.value;
      maxFrequencyKey = element.key;
    }
  }
  return maxFrequencyKey;
}

// Second Highest Occurring Element

/*
Given an array of n integers, find the second most frequent element in it.



If there are multiple elements that appear second most frequent times, find the smallest of them.



If second most frequent element does not exist return -1.


Example 1

Input: arr = [1, 2, 2, 3, 3, 3]

Output: 2

Explanation:

The number 2 appears the second most (2 times) and number 3 appears the most(3 times). 

Example 2

Input: arr = [4, 4, 5, 5, 6, 7]

Output: 6

Explanation:

Both 6 and 7 appear second most times, but 6 is smaller.

*/

int secondMostFrequentElement(List<int> nums) {
  if (nums.isEmpty) return -1;

  var freq = <int, int>{};
  for (var num in nums) {
    freq[num] = (freq[num] ?? 0) + 1;
  }

  print("Frequencies: $freq");

  if (freq.length < 2) return -1;

  // Sort by frequency (descending), then by value (ascending for ties)
  var sortedEntries = freq.entries.toList()
    ..sort((a, b) {
      if (a.value != b.value) {
        return b.value.compareTo(a.value); // Higher frequency first
      }
      return a.key.compareTo(b.key); // Smaller value first for ties
    });

  print("Sorted: $sortedEntries");
  // Find the first element with frequency less than the max frequency
  int maxFreq = sortedEntries[0].value;

  for (int i = 1; i < sortedEntries.length; i++) {
    if (sortedEntries[i].value < maxFreq) {
      return sortedEntries[i].key;
    }
  }

  // The second most frequent element is at index 1
  // When all have same frequency, return second smallest
  // But based on the problem statement: "If second most frequent element does not exist return -1",
  // we should return -1 when all frequencies are equal.
  return -1;
}

// Sum of Highest and Lowest Frequency
/*
Given an array of n integers, 
find the sum of the frequencies of the highest occurring number and lowest occurring number.

Example 1

Input: arr = [1, 2, 2, 3, 3, 3]

Output: 4

Explanation: The highest frequency is 3 (element 3), and the lowest frequency is 1 (element 1). 
Their sum is 3 + 1 = 4.

Example 2

Input: arr = [4, 4, 5, 5, 6]

Output: 3

Explanation: The highest frequency is 2 (elements 4 and 5), and the lowest frequency is 1 (element 6). 
Their sum is 2 + 1 = 3.
*/

int sumHighestAndLowestFrequency(nums) {
  Map hashMap = {};
  int max = 0;
  int min = double.maxFinite.toInt();

  for (var num in nums) {
    hashMap[num] = (hashMap[num] ?? 0) + 1;
  }
  print(hashMap);

  for (var val in hashMap.values) {
    if (val > max) {
      max = val;
    }
    if (val < min) {
      min = val;
    }
  }

  return max + min;
}
