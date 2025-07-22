```c++
// The first parameter of the unpacked structure is the output type. 
template<typename T>
struct NestedPackedStruct1 {    
    T<T<int>,int> nps1;   
};

template<typename T>
struct NestedPackedStruct2 {    
    T<T<int>,T<int>> nps2;   
};

void f(NestedPackedStruct2<int> nps2)
{
    //cout <<"nps1.nps1.a = " << nps1.nps1.a <<endl; 
    //cout <<"nps1.nps1.b = " << nps1.nps1.b <<endl; 
    //cout <<"nps1.nps1.c = " << nps1.nps1.c <<endl; 
    cout <<"nps2.nps1.a.a = " << nps2.nps1.a.a <<endl; 
    cout <<"nps2.nps1.a.b = " << nps2.nps1.a.b <<endl; 
    cout <<"nps2.nps1.b.a = " << nps2.nps1.b.a <<endl; 
    cout <<"nps2.nps1.b.b = " << nps2.nps1.b.b <<endl; 
    cout <<"nps2.nps1.c.a = " << nps2.nps1.c.a <<endl; 
    cout <<"nps2.nps1.c.b = " << nps2.nps1.c.b <<endl; 
    
    //cout <<"nps2.nps1.a = " << nps2.nps1.a <<endl; 
    //cout <<"nps2.nps1.b = " << nps2.nps1.b <<endl; 
    //cout <<"nps2.nps1.c = " << nps2.nps1.c <<endl; 
    //cout <<"nps2.nps2.a.a = " << nps2.nps2.a.a <<endl; 
    //cout <<"nps2.nps2.a.b = " << nps2.nps2.a.b <<endl; 
    //cout <<"nps2.nps2.b.a = " << nps2.nps2.b.a <<endl; 
    //cout <<"nps2.nps2.b.b = " << nps2.nps2.b.b <<endl; 
    //cout <<"nps2.nps2.c.a = " << nps2.nps2.c.a <<endl; 
    //cout <<"nps2.nps2.c.b = " << nps2.nps2.c.b <<endl; 
}
```
### Output:
```
nps2.nps1.a.a = 1
nps2.nps1.a.b = 2
nps2.nps1.b.a = 3
nps2.nps1.b