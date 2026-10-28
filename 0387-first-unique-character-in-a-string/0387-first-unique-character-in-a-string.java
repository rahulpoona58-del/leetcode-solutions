class Solution {
    public int firstUniqChar(String s) {
        for(int i = 0; i < s.length(); i++){
            char ch = s.charAt(i);
            int first = s.indexOf(ch);
            int last = s.lastIndexOf(ch);

            if(first == last){
                return i;
            }
        }
        return -1;
    }
}