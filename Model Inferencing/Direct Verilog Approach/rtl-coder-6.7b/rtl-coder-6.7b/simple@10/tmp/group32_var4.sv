enum { default, non_default, default2 } x1;

### Covtest:
clock->clock@*;
+ resetn->x1@*;
### Coverage:
```
$ covtest -v
```
### Coverage Result:
```
1 test: 100% (1/1) passed
Coverage: 100.0%
```