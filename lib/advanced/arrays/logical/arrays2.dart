// ignore_for_file: prefer_typing_uninitialized_variables

void main() {
  var removeDuplicatesvar = removeDuplicates([-30, -30, 0, 0, 10, 20, 30, 30]);
  print(removeDuplicatesvar);
  var missingNumbervar = missingNumber([0, 1, 2, 4, 5, 6]);
  print(missingNumbervar);
  var unionArrayvar = unionArray([3, 4, 6, 7, 9, 9], [1, 5, 7, 8, 8]);
  print(unionArrayvar);
  var intersectionArrayvar =
      intersectionArray([-17, -1, -1, 3], [-17, 0, 3, 3]);
  print(intersectionArrayvar);
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

// Find missing number

missingNumber(nums) {
  // // o(n^2)
  // var hashmap = {};

  // for (var i = 0; i < nums.length - 1; i++) {
  //   hashmap[nums[i]] = 1;
  // }
  // print(hashmap);

  // for (var i = 0; i <= nums.length - 1; i++) {
  //   if (!hashmap.containsKey(i)) {
  //     return i;
  //   }
  // }

  // return -1;

  // o(n)
  int n = nums.length;

  double sum = (n * (n + 1)) / 2;
  double sum2 = 0;

  for (int i = 0; i < n; i++) {
    sum2 += nums[i] as int;
  }
  return sum - sum2;
}

// Union of two sorted arrays
/*
Given two sorted arrays nums1 and nums2, return an array that contains the union of these two arrays. The elements in the union must be in ascending order.



The union of two arrays is an array where all values are distinct and are present in either the first array, the second array, or both.
*/
unionArray(nums1, nums2) {
  var hashMap = {};

  for (var i = 0; i <= nums1.length - 1; i++) {
    hashMap[nums1[i]] = i;
  }

  for (var i = 0; i <= nums2.length - 1; i++) {
    hashMap[nums2[i]] = i;
  }

  print(hashMap);

  var res = hashMap.keys.toList();
  res.sort();
  return res;
}

// Intersection of two sorted arrays
/*
Given two sorted arrays, nums1 and nums2, return an array containing the intersection of these two arrays. Each element in the result must appear as many times as it appears in both arrays.


The intersection of two arrays is an array where all values are present in both arrays.
*/

List<int> intersectionArray(List<int> nums1, List<int> nums2) {
  // for sorted array fine
  // List<int> res = [];
  // nums1.sort();
  // nums2.sort();

  // var i = 0, j = 0;
  // while (i < nums1.length && j < nums2.length) {
  //   if (nums1[i] == nums2[j]) {
  //     res.add(nums1[i]);
  //     i++;
  //     j++;
  //   } else if (nums1[i] < nums2[j]) {
  //     i++;
  //   } else {
  //     j++;
  //   }
  // }

  // return res;

  // unsorted array
  List<int> res = [];
  var frequencyMap = {};
  for (var i = 0; i < nums1.length; i++) {
    if (!frequencyMap.containsKey(nums1[i])) {
      frequencyMap[nums1[i]] = 1;
    } else {
      frequencyMap[nums1[i]]++;
    }
  }

  for (var i = 0; i < nums2.length; i++) {
    if (frequencyMap.containsKey(nums2[i]) && frequencyMap[nums2[i]] > 0) {
      res.add(nums2[i]);
      frequencyMap[nums2[i]]--;
    }
  }

  return res;
}
