class Solution {
    public int numSquares(int n) {
        int[] viranchi = new int[n + 1];
        for(int i = 1; i <=n; i++){
            viranchi[i] = i;
        }
        for(int i = 1; i <= n; i++){
            for(int j = 1; j * j <= i; j++){
                viranchi[i] = Math.min(viranchi[i], viranchi[i - j * j] + 1);
            }
        }
        return viranchi[n];
    }
}