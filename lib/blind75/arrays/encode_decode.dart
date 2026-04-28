/*Encode and Decode Strings

Design an algorithm to encode a list of strings to a string. The encoded string is then sent over the network and is decoded back to the original list of strings.

Machine 1 (sender) has the function:

string encode(vector<string> strs) {
    // ... your code
    return encoded_string;
}
Machine 2 (receiver) has the function:

vector<string> decode(string s) {
    //... your code
    return strs;
}
So Machine 1 does:

string encoded_string = encode(strs);
and Machine 2 does:

vector<string> strs2 = decode(encoded_string);
strs2 in Machine 2 should be the same as strs in Machine 1.

Implement the encode and decode methods.

Example 1:

Input: dummy_input = ["Hello","World"]

Output: ["Hello","World"]

Explanation:
Machine 1:
Codec encoder = new Codec();
String msg = encoder.encode(strs);
Machine 1 ---msg---> Machine 2

Machine 2:
Codec decoder = new Codec();
String[] strs = decoder.decode(msg);
Example 2:

Input: dummy_input = [""]

Output: [""]



 */

void main() {
  Codec code = Codec();
  print(code.encode(["hello", "world"])); // 5#hello5#world

  print(code.decode('5#hello5#world'));
}

class Codec {
  String encode(List<String> strs) {
    String res = '';
    // your code
    for (var i = 0; i < strs.length; i++) {
      var len = strs[i].length;
      res = '$res$len#${strs[i]}';
    }
    return res;
  }

  List<String> decode(String s) {
    List<String> res = [];
    int i = 0;
    while (i < s.length) {
      int j = s.indexOf('#', i);
      int len = int.parse(s.substring(i, j));
      String word = s.substring(j + 1, j + 1 + len);
      res.add(word);

      i = j + 1 + len;
    }
    return res;
  }
}
