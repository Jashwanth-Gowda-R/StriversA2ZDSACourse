void main() {
  var countFreq = countingFrequenciesOfArrayElements([1, 2, 2, 1, 3]);
  print('countFreq - $countFreq');
  var highest = highestOccurringElement([2, 4, 3, 2, 5, 4, 4]);
  print('highest - $highest');
}

// Counting Frequencies of Array Elements
/*
Given an array nums of size n which may contain duplicate elements, return a list of pairs where each pair contains a unique element from the array and its frequency in the array.



You may return the result in any order, but each element must appear exactly once in the output.


Examples:
Input: nums = [1, 2, 2, 1, 3]

Output: [[1, 2], [2, 2], [3, 1]]

Explanation:

- 1 appears 2 times

- 2 appears 2 times

- 3 appears 1 time

Order of output can vary.

Input: nums = [5, 5, 5, 5]

Output: [[5, 4]]

Explanation:

- 5 appears 4 times.
*/

countingFrequenciesOfArrayElements(List nums) {
  Map map = {};

  for (var i = 0; i < nums.length; i++) {
    int index = nums[i];
    if (map.containsKey(index)) {
      map[index]++;
    } else {
      map[index] = 1;
    }
  }
  var arr = [];
  print(map);
  for (var e in map.entries) {
    // Create a new list with the key and value, not the MapEntry object
    arr.add([e.key, e.value]);
  }
  return arr;
}

// Highest Occurring Element in an Array
/*
Given an array nums of n integers, find the most frequent element in it i.e., the element that occurs the maximum number of times. If there are multiple elements that appear a maximum number of times, find the smallest of them.



Please note that this section might seem a bit difficult without prior knowledge on what hashing is, we will soon try to add basics concepts for your ease! If you know the concepts already please go ahead to give a shot to the problem. Cheers!


Examples:
Input: nums = [1, 2, 2, 3, 3, 3]

Output: 3

Explanation: The number 3 appears the most (3 times). It is the most frequent element.

Input: nums = [4, 4, 5, 5, 6]

Output: 4

Explanation: Both 4 and 5 appear twice, but 4 is smaller. So, 4 is the most frequent element.


*/

int highestOccurringElement(List nums) {
  Map map = {};

  for (var i = 0; i < nums.length; i++) {
    int index = nums[i];
    if (map.containsKey(index)) {
      map[index]++;
    } else {
      map[index] = 1;
    }
  }
  print(map);
  var highest = 0;

  for (var e in map.entries) {
    if (e.value > highest) {
      highest = e.key;
    }
  }
  return highest;
}
