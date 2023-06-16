// better approach (hashing) : TC = O(2n), SC = O(n)

#include <bits/stdc++.h>
pair<int, int> missingAndRepeating(vector<int>& arr, int n) {
    int hash[n + 1] = {0};
    for (int i = 0; i < n; i++) {
        hash[arr[i]]++;
    }

    int repeating = -1, missing = -1;

    for (int i = 1; i <= n; i++) {
        if (hash[i] == 2) {
            repeating = i;
        } else if (hash[i] == 0) {
            missing = i;
        }

        if (repeating != -1 && missing != -1) {
            break;
        }
    }

    return {missing, repeating};
}
........................................................................................................................................................................
// optimal soln #1 (Maths) : TC = O(n), SC = O(1)

#include <bits/stdc++.h>

pair<int,int> missingAndRepeating(vector<int> &arr, int n)
{   
	//long long n = arr.size();
	
	long long SN = (n * (n+1))/2;
	long long S2N = (n * (n+1) * (2*n + 1))/6;
	
	long long S = 0, S2 = 0;

	for(int i =0; i<n; i++){
		S += arr[i];
		S2 += (long long)arr[i] * (long long)arr[i];
	}
	
	long long val1 = S - SN;
	long long val2 = S2 - S2N;
	
	val2 = val2 / val1;

	long long x = (val1 + val2)/2; 
	long long y = x - val1;

	return{(int)y, (int)x};
	
}


