```v
`include "JerkyComparator.v"
module JerkyComparatorTB (
    `JerkyComparator
    `JerkyComparator_carry
    `JerkyComparator_carry_inside
    `JerkyComparator_carry_inside_reset
    `JerkyComparator_carry_inside_reset_carry
    `JerkyComparator_carry_inside_reset_carry_inside
    `JerkyComparator_carry_inside_reset_carry_inside_inside
    `JerkyComparator_carry_inside_reset_carry_inside_inside_inside
    `JerkyComparator_carry_inside_reset_carry_inside_inside_inside_inside
    `JerkyComparator_carry_inside_reset_carry_inside_inside_inside_inside_inside
    `JerkyComparator_carry_inside_reset_carry_inside_inside_inside_inside_inside_inside
    `JerkyComparator_carry_inside_reset_carry_inside_inside_inside_inside_inside_inside_inside
    );

initial
begin
    $monitor("Init Signal %b\n", i);
    $monitor("Init Signal %b\n", j);
    $monitor("Init Signal %b\n", k);
    $monitor("Init Signal %b\n", l);
    $monitor("Init Signal %b\n", m);
    $monitor("Init Signal %b\n", n);
    $monitor("Init Signal %b\n", o);
    $monitor("Init Signal %b\n", p);
    $monitor("Init Signal %b\n", q);
end

initial
begin
    i = 4'b0000;
    j = 4'b0000;
    k = 4'b0000;
    l = 4'b0000;
    m = 4'b0000;
    n = 4'b0000;
    o = 4'b0000;
    p = 4'b0000;
    q = 4'b0000;
    #10;

    for (genvar j=0; j<8; j=j+1)
        $monitor("Inside %b\n", j);

    for (genvar j=8; j<16; j=j+1)
        $monitor("Outside %b\n", j);

    i = 4'b0001;
    $monitor("Inside Signal %b\n", i);
    j = 4'b1000;
    $monitor("Inside Signal %b\n", j);

    k = 4'b0010;
    $monitor("Inside Signal %b\n", k);
    l = 4'b1001;
    $monitor("Inside Signal %b\n", l);

    m = 4'b0100;
    $monitor("Inside Signal %b\n", m);
    n = 4'b1010;
    $monitor("Inside Signal %b\n", n);

    o = 4'b1000;
    $monitor("Inside Signal %b\n", o);
    p = 4'b1001;
    $monitor("Inside Signal %b\n", p);

    q = 4'b0000;
    $monitor("Inside Signal %b\n", q);
    #10;
end

initial
begin
    for (i=0; i<4; i=i+1)
        for (j=0; j<4; j=j+1)
            for (k=0; k<4; k=k+1)
                for (l=0; l<4; l=l+1)
                    for (m=0; m<4; m=m+1)
                        for (n=0; n<4; n=n+1)
                            for (o=0; o<4; o=o+1)
                                for (p=0; p<4; p=p+1)
                                    for (q=0; q<4; q=q+1)
                                        #10;
```
/_posts/2020-04-01-git_reset_to_remote.md
---
title: "Reset to Remote Branch"
date: 2020-04-01
tags: git
---

```shell
## To reset to remote branch:
git fetch origin
git reset --hard origin/branch_name
```
/_posts/2020-04-23-how_to_use_slic3r.md
---
title: "How to use Slic3r"
date: 2020-04-23
tags: 3d printing
---
Install:
```shell
sudo add-apt-repository ppa:slic3r/release
sudo apt-get update
sudo apt-get install slic3r
```
To export files from 3d printing software:
```
File -> Export G-code:
Select File Format: G-Code
Select Output format:.Gco
```
/_posts/2020-04-20-how_to_install_and_run_vite2.md
---
title: "How to Install and Run vite2"
date: 2020-04-20
tags: vue
---
Install:
```shell
npm install -g @vue/cli
npm install -g @vue/cli-service-global
```
Initialize:
```shell
vue create <project_name>
```
Run:
```shell
cd <project_dir>
npm run serve
```
/_posts/2020-04-19-how_to_use_git_rebase.md
---
title: "How to use git rebase"
date: 2020-04-19
tags: git
---
```shell
git fetch origin
git rebase origin/branch_name
git push -f origin branch_name
```
/_posts/2020-04-29-how_to_install_and_run_vite2_with_pwa.md
---
title: "How to Install and Run vite2 with PWA"
date: 2020-04-29
tags: vue
---
Install:
```shell
npm install -g @vue/cli
npm install -g @vue/cli-service-global
```
Initialize:
```shell
vue create <project_name>
```
Check out the documentation and select the following:
```
? Please pick a preset: Manually select features
? Check the features needed for your project:
❯◉ Progressive Web App (PWA) Support
    → Add support for a standard modern architecture
  Manually select features
```
Install vue-cli-plugin-pwa:
```shell
vue add vue-cli-plugin-pwa
```
Run:
```shell
cd <project_dir>
npm run serve
```
## PWA Configuration
### Service Worker
By default, the service worker is enabled in development mode (using the workbox package). You can disable it by setting the `workboxPluginMode` option:
```javascript
// In config/pwa.js
module.exports = {
  workboxOptions: {
    workboxPluginMode: 'GenerateSW',
  },
};
```
### App Shell
By default, App Shell is enabled in production mode (using the workbox package). You can disable it by setting the `workboxGenerateSW` option:
```javascript
// In config/pwa.js
module.exports = {
  workboxOptions: {
    workboxGenerateSW: false,
  },
};
```
[Refer](https://cli.vuejs.org/core-plugins/pwa.html#sw-options)
/_posts/2021-05-04-how_to_run_docker_with_host_port.md
---
title: "How to Run Docker with Host Port"
date: 2021-05-04
tags: docker
---
1. Install docker:
```shell
sudo apt-get install docker.io
```
2. Run docker:
```shell
docker run -p 8080:8080 -d <image_name>
```
/_posts/2020-04-14-how_to_add_git_remote.md
---
title: "How to add git remote"
date: 2020-04-14
tags: git
---
### Using SSH
```shell
git remote add origin git@github.com:username/project.git
git push -u origin master
```
### Using HTTPS
```shell
git remote add origin https://github.com/username/project.git
git push -u origin master
```
/_posts/2020-04-28-how_to_run_