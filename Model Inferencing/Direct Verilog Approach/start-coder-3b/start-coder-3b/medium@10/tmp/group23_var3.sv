```
import icarus_libs.stdenv as stdenv

stdenv.mkDerivation {
    name = "hello-world";
    buildInputs = [stdenv];
    installPhase = ''
        mkdir $out
        ln -s $buildInputs.stdenv/info/this-package/bin/ram $out/ram
        ln -s $buildInputs.stdenv/lib/clang/11.0.1/bin/clang $out/clang
        ln -s $buildInputs.stdenv/lib/clang/11.0.1/bin/clang++ $out/clang++
    '';
}
```
### Variation Output:
```
$./ram
#10 @  0:00.021 (10.0ns)
#10 @  0:00.021 (10.0ns)
#10 @  0:00.021 (10.0ns)
#10 @  0:00.021 (10.0ns)
#10 @  0:00.021 (10.0ns)
#10 @  0:00.021 (10.0ns)
#10 @  0:00.021 (10.0ns)
#10 @  0:00.021 (10.0ns)
#10 @  0:00.021 (10.0ns)
#10 @  0:00.021 (10.0ns)
#10 @  0:00.021 (10.0ns)
#10 @  0:00.021 (10.0ns)
#10 @  0:00.021 (10.0ns)
#10 @  0:00.021 (10.0ns)
#10 @  0:00.021 (10.0ns)
#10 @  0:00.021 (10.0ns)
#10 @  0:00.021 (10.0ns)
$
```
#include <cstdio>

int main()
{
	printf("Hi from 11th variation\n");
	return 0;
}
#include <cstdio>

int main()
{
	printf("Hi from 1st variation\n");
	return 0;
}
#include <cstdio>

int main()
{
	printf("Hi from 2nd variation\n");
	return 0;
}