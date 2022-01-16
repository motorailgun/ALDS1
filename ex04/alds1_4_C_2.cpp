#include <bits/stdc++.h>
#pragma GCC optimize("O3")
#define SIZE 1000000
#define MOD 1000003
#define rep(i, n) for (int i = 0; i < (int)(n); i++)
using namespace std;
using uintt = uint_fast32_t;

typedef vector<string> pear;

pear hashmap[SIZE];

uintt calchash(string key){
    uintt res = 0;
    for(uintt i = 0; i < key.length(); i++){
        switch (key.at(i)){
        case 'A':
            res += i;
            break;
        case 'T':
            res += 10*i;
            break;
        case 'G':
            res += 100*i;
            break;
        case 'C':
            res += 1000*i;
            break;
        }
    }
    return res % MOD;
}

void insert(string key){
    uintt index = calchash(key);
    hashmap[index].push_back(key);
}

bool find(string key){
    uintt index = calchash(key);
    for(string s : hashmap[index]){
        if(s == key) return true;
    }
    return false;
}

int main(){
    string inst, ope;
    uintt i;

    cin >> i;
    rep(k, i){
        cin >> inst >> ope;
        if(inst == "insert"){
            insert(ope);
        }else{
            cout << (find(ope) ? "yes" : "no" )<< endl;
        }
    }
    
}