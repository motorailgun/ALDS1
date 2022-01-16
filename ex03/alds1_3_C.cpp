#include <bits/stdc++.h>
using namespace std;
typedef struct lst {
    uint_fast32_t val;
    struct lst *prev;
    struct lst *next;
} pear;
typedef pear *dll;

pear head;
pear tail;

dll search(uint_fast32_t value){
    dll current = head.next;
    while(current->val != value){
        if(!current->next->val) return NULL;
        current = current->next;
    }
    return current;
}

void del(uint_fast32_t value){
    dll to_be_deleted = search(value);
    if(to_be_deleted == NULL) return (void)NULL;
    to_be_deleted->prev->next = to_be_deleted->next;
    to_be_deleted->next->prev = to_be_deleted->prev;
    free(to_be_deleted);
}

void ins(uint_fast32_t value){
    dll pp = (dll)malloc(sizeof(pear));
    pp->val = value;
    pp->next = head.next;
    pp->prev = &head;
    head.next->prev = pp;
    head.next = pp;
}

void delf(){
    dll nnext = head.next->next;
    head.next->next->prev = &head;
    free(head.next);
    head.next = nnext;
}

void dell(){
    dll pnext = tail.prev->prev;
    tail.prev->prev->next = &tail;
    free(tail.prev);
    tail.prev = pnext;
}

int main(){
    char buf[20];
    string op;
    head.next = &tail;
    head.prev = tail.next = NULL;
    uint_fast32_t ope;
    uint_fast32_t n;
    cin >> n;
    for(uint_fast32_t i = 0; i < n; i++){
        scanf("%s", buf);
        op = (string)buf;
        if(op == "insert"){
            cin >> ope;
            ins(ope);
        }else if(op == "delete"){
            cin >> ope;
            del(ope);
        }else if(op == "deleteFirst"){
            delf();
        }else if(op == "deleteLast"){
            dell();
        }else{
            exit(1);
        }
    }
    
    dll current = head.next->next;
    cout << head.next->val;
    while(current->next){
        cout << " ";
        cout << current->val;
        current = current->next;
    }
    cout << endl;
}