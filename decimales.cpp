#include <bits/stdc++.h>
using namespace std;
stack<int> pila;
int main(){
    int ax, bx, dx;
    string cx;
    cout<<"N: ";
    cin>>ax;
    bx = 1;
    dx = bx % ax;
    bx = bx / ax;
    pila.push(60);
    imprime:
        bx = dx;
        cout<<
        dx = pila.top(); pila.pop();
        pila.push(bx);
        pila.push(dx);
        bx = bx * 10;
        dx = bx % ax;
        bx = bx / ax;
        cout<<bx<<" ";
        cx = cx + to_string(bx);
        bx = pila.top(); pila.pop();
        bx = bx - 1;
        pila.push(bx);
    if (bx > 0) goto imprime;
    while(!pila.empty()){
        cout<<pila.top()<<endl;
        pila.pop();
    }
    /*
    pila.pop();
    ax = 0;
    bx = 0;
    recorre_cadena:
        pila.push(cx[ax]-48);
        ax = ax + 1;
    if(ax<cx.length()) goto recorre_cadena;
    
    ax = 0;
    bx = 0;
    dx = 0;
    cx = "";
    pop_pila:
        ax = pila.top(); pila.pop();
        bx = 0;
        pop2:
            
            
            bx = bx + 1;
        if(bx<cx.length()) goto pop2;
    if(!pila.empty()) goto pop_pila;*/
    return 0;
}



