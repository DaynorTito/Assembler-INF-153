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
        bx = bx * 10;
        dx = bx % ax;
        bx = bx / ax;
        cout<<bx<<" ";
        cx = cx + to_string(bx);
        bx = pila.top(); pila.pop();
        bx = bx - 1;
        pila.push(bx);
    if (bx > 0) goto imprime;
    pila.pop();
    
    ax = 0;
    bx = 0;
    recorre_cadena:
        pila.push(cx[ax]);
        ax = ax + 1;
    if(ax<cx.length()) goto recorre_cadena;
    while(!pila.empty()){
        cout<<pila.top()<<endl;
        pila.pop();
    }
    
    return 0;
}
