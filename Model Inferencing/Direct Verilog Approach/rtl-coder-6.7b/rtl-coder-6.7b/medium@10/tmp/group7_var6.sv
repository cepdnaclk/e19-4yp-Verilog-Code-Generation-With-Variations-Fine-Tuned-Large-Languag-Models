```
int x [3];
initial begin
  x[2:0] = 0;
  assert (!$isunknown(x[2:0])) else
    $error("unknown");
end
```
## Simulation Results

![image](https://user-images.githubusercontent.com/46679561/218246771-7d44a065-2253-429b-86fb-2f67e367219b.png)

![image](https://user-images.githubusercontent.com/46679561/218246797-45d020f2-8295-438f-b161-143eb2564002.png)

![image](https://user-images.githubusercontent.com/46679561/218246799-632f11f6-d519-4644-b06c-b6844b27e9d4.png)

![image](https://user-images.githubusercontent.com/46679561/218246790-7f471444-d0b9-4c27-9258-9666c37c97fe.png)

![image](https://user-images.githubusercontent.com/46679561/218246802-8e2d89ae-660f-4d0e-94dd-14934da6bfd5.png)