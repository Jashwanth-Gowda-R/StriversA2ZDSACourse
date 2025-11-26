void main() {
  var removeDuplicatesvar = removeDuplicates([-30, -30, 0, 0, 10, 20, 30, 30]);
  print(removeDuplicatesvar);
}
// Move Zeros to End - [0, 1, 4, 0, 5, 2]
/*
Given an integer array nums, move all the 0's to the end of the array. The relative order of the other elements must remain the same.



This must be done in place, without making a copy of the array.

*/

void moveZeroes(List<int> nums) {
  // step1 - find 1st 0 element and store that index in j
  // step2 - start i from j+1 till end when u find 0 swap and do j++

// 1
  var j = -1;
  for (var i = 0; i < nums.length - 1; i++) {
    if (nums[i] == 0) {
      j = i;
      break;
    }
  }
  // if j==-1 then array is non 0 elements
  if (j == -1) {
    return;
  }

// 2
  for (var i = j + 1; i <= nums.length - 1; i++) {
    if (nums[i] != 0) {
      var temp = nums[i];
      nums[i] = nums[j];
      nums[j] = temp;
      j++;
    }
  }
}

// Remove duplicates from sorted array
/*
Given an integer array nums sorted in non-decreasing order, remove all duplicates in-place so that each unique element appears only once.

Return the number of unique elements in the array.

If the number of unique elements be k, then,

Change the array nums such that the first k elements of nums contain the unique values in the order that they were present originally.
The remaining elements, as well as the size of the array does not matter in terms of correctness.

*/

removeDuplicates(List<int> nums) {
  var hashMap = {};

  for (var i = 0; i <= nums.length - 1; i++) {
    if (!hashMap.containsKey(nums[i])) {
      // hashMap.addAll({nums[i]: 1});
      hashMap[nums[i]] = 1;
    } else {
      // hashMap.update(nums[i], (value) => value + 1);
      hashMap[nums[i]]++;
    }
  }
  print(hashMap);
  int k = 0;

  // hashMap.forEach((key, value) {
  //   if (value > 1) {
  //     int val = value - 1;
  //     k = k + val;
  //   }
  // });

  var uniqueLists = hashMap.keys.toList();
  k = uniqueLists.length;
  return k;
}
