#include <bits/stdc++.h>

using namespace std;
using intt = int_fast32_t;

vector<double> keys;
vector<double> dumkeys;
vector<double> keys_folded;
vector<double> dumkeys_folded;
vector<vector<double>> memo_mut;

double calc_partialtree_count(intt, intt);

double calc_cost(intt depth, intt left_bound, intt right_bound){
    double tmp;
    if(!(tmp = memo_mut[left_bound][right_bound])){
        memo_mut[left_bound][right_bound] = tmp = calc_partialtree_count(left_bound, right_bound);
    }
    return tmp + (depth - 1) * (keys_folded[right_bound] - keys_folded[left_bound - 1] + dumkeys_folded[right_bound] - (left_bound - 2 >= 0 ? dumkeys_folded[left_bound - 2] : 0));
}

double calc_partialtree_count(intt left_bound, intt right_bound){
    if(left_bound == right_bound){
        return keys[left_bound] + 2 * (dumkeys[left_bound - 1] + dumkeys[left_bound]);
    }else if(right_bound - left_bound == 1){
        double left_dum = keys[left_bound] + 2 * dumkeys[left_bound - 1] + calc_cost(2, right_bound, right_bound);
        double right_dum = keys[right_bound] + 2 * dumkeys[right_bound] + calc_cost(2, left_bound, left_bound);
        return min(left_dum, right_dum);
    }else{
        double mini = 0;
        for(intt i = left_bound + 1; i <= right_bound - 1; i++){
            double tmp = keys[i] + calc_cost(2, left_bound, i - 1) + calc_cost(2, i + 1, right_bound);
            if(!mini || mini > tmp){
                mini = tmp;
            }
        }
        double ls = keys[left_bound] + 2 * dumkeys[left_bound - 1] + calc_cost(2, left_bound + 1, right_bound);
        double rs = keys[right_bound] + 2 * dumkeys[right_bound] + calc_cost(2, left_bound, right_bound - 1);
        return min(ls, min(rs, mini));
    }
    return 0;
}

int main(){
    intt n;
    double tmp;
    cin >> n;

    keys.push_back(0);
    for(intt i = 1; i <= n; i++){
        cin >> tmp;
        keys.push_back(tmp);
    }
    for(intt i = 0; i <= n; i++){
        cin >> tmp;
        dumkeys.push_back(tmp);
    }
    tmp = 0;
    for(intt i = 0; i <= n; i++){
        keys_folded.push_back(tmp += keys[i]);
    }
    tmp = 0;
    for(intt i = 0; i <= n; i++){
        dumkeys_folded.push_back(tmp += dumkeys[i]);
    }

    vector<vector<double>> tmp2(n + 1, vector<double>(n + 1, 0));
    memo_mut = tmp2;

    cout << calc_cost(1, 1, n) << endl;
}