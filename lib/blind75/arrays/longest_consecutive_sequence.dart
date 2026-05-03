import 'dart:math' as math;

void main() {
  print(longestConsecutive([100, 4, 200, 1, 3, 2])); // 4
  print(longestConsecutive([0, 3, 7, 2, 5, 8, 4, 6, 0, 1])); // 9
  print(longestConsecutive([])); // 0
  print(longestConsecutive([1])); // 1
}

int longestConsecutive(List<int> nums) {
  if (nums.isEmpty) return 0;

  int longest = 1;
  Set<int> setNums = nums.toSet();

  for (int num in setNums) {
    // skip if not a sequence start
    if (setNums.contains(num - 1)) continue;

    // walk forward from this start
    int currentNum = num;
    int streak = 1;
    while (setNums.contains(currentNum + 1)) {
      streak++;
      currentNum++;
    }
    longest = math.max(longest, streak);
  }

  return longest;
}

// Time: O(n) — each element visited at most twice
// Space: O(n) — Set stores all unique elements
