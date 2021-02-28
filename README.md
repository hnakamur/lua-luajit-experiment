lua-luajit-experiment
=====================

This project is for running the benchmark script at https://github.com/vim/vim/issues/7903#issuecomment-786957038

## How to run

Install dependencies on Ubuntu 20.04 LTS.
libreadline-dev is needed by Lua 5.1.5.
cmake is needed because this project is written in cmake.

```
sudo apt-get install build-essential make cmake libreadline-dev
```

Build and run benchmarks:

```
make && make bench3
```

## My result

```
make --no-print-directory bench
(cd build/testdata; ../lua542/bin/lua ../../source/luatest.lua)
0.986382
(cd build/testdata; ../luajit/bin/luajit ../../source/luatest.lua)
1.416415
(cd build/testdata; ../lua515/bin/lua ../../source/luatest.lua)
1.610574
make --no-print-directory bench
(cd build/testdata; ../lua542/bin/lua ../../source/luatest.lua)
0.991708
(cd build/testdata; ../luajit/bin/luajit ../../source/luatest.lua)
1.415507
(cd build/testdata; ../lua515/bin/lua ../../source/luatest.lua)
1.625474
make --no-print-directory bench
(cd build/testdata; ../lua542/bin/lua ../../source/luatest.lua)
0.971374
(cd build/testdata; ../luajit/bin/luajit ../../source/luatest.lua)
1.469974
(cd build/testdata; ../lua515/bin/lua ../../source/luatest.lua)
1.636088
```
