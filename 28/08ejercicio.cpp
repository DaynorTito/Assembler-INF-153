#include <bits/stdc++.h>
using namespace std;
stack<int> pila;

bool esta(string &cx, int &bx, int &ax){
    bx = 0;
    buscar:
        if(cx[bx] - 48==ax) goto yes;
        bx = bx + 1;
    if (bx < cx.length()) goto buscar;
    return false;
    yes:
        return true;
        
}
void agrega(int &cx, int &ax, int &bx){
    cx = cx * 10;
    cx = cx + ax;
    
}

int main() {
    int ax, bx, cx;
    string dx;
    
    cin>>ax;
    read:
        cin>>bx;
        dx = dx + to_string(bx);
        ax = ax - 1;
    if(ax>0) goto read;
    ax = 0;
    recorre_cadena:
        pila.push(dx[ax] - 48);
        ax = ax + 1;
    if(ax<dx.length()) goto recorre_cadena;
    cx = 0;
    dx = "";
   eliminar:
        ax = pila.top(); pila.pop();
        bx = 0;
        if (!esta(dx,bx,ax)) goto agregar;
        goto continua;
        agregar:
            dx = dx + to_string(ax);
            agrega(cx,ax, bx);
        continua:
    if(!pila.empty()) goto eliminar;
   // cout<<cx<<endl;
    pila.push(10);
    ax = 0;
    bx = 0;
    dx = "";
    inv:
        bx = cx % 10;
        dx = dx + to_string(bx);
        cx = cx / 10;
        
    if(cx > 0) goto inv;
    cout<<dx<<endl;
    return 0;
}
