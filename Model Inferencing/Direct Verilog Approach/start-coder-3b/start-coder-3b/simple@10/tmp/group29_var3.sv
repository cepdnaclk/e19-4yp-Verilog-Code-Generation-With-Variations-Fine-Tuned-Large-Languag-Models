```
#include <iostream>
#include <string>
#include <map>

class SomeClass
{
public:
    static int counter;
    std::string name;
    SomeClass(std::string inName);
    ~SomeClass()
    {
        counter--;
    }
};

class Sched
{
public:
    SomeClass *someClass;
    bool someBool = false;
    bool b;

    Sched(SomeClass *inClass);
    ~Sched()
    {
        delete someClass;
    }
};

static std::map<int, Sched> sched;

Sched::Sched(SomeClass *inClass)
{
    someClass = inClass;
    b = false