lua-luajit-experiment
=====================

This project is for running the benchmark script at https://github.com/vim/vim/issues/7903#issuecomment-786957038
and my benchmark for calculating a HMAC SHA256 using OpenSSL.

## How to run

Install dependencies on Ubuntu 20.04 LTS.
libreadline-dev is needed by Lua 5.1.5.
cmake is needed because this project is written in cmake.

```
sudo apt-get install build-essential make cmake libreadline-dev libssl-dev
```

Build and run benchmarks:

```
make && make bench3 && make hmacbench3
```

## My result

```
make --no-print-directory bench
(cd build/testdata; ../lua542/bin/lua ../../source/luatest.lua)
0.970569
(cd build/testdata; ../luajit/bin/luajit ../../source/luatest.lua)
1.402232
(cd build/testdata; ../lua515/bin/lua ../../source/luatest.lua)
1.614507
make --no-print-directory bench
(cd build/testdata; ../lua542/bin/lua ../../source/luatest.lua)
0.982099
(cd build/testdata; ../luajit/bin/luajit ../../source/luatest.lua)
1.400618
(cd build/testdata; ../lua515/bin/lua ../../source/luatest.lua)
1.642074
make --no-print-directory bench
(cd build/testdata; ../lua542/bin/lua ../../source/luatest.lua)
0.965188
(cd build/testdata; ../luajit/bin/luajit ../../source/luatest.lua)
1.38636
(cd build/testdata; ../lua515/bin/lua ../../source/luatest.lua)
1.597177
make --no-print-directory hmacbench
(cd build/testdata; ../lua542/bin/lua ../../source/lua-hmacfiletest.lua)
0.207422
d6b1f3fe4ebd7b82c2ee416e280e6faff523df774b151a52a86f1722a6e1d3dc
(cd build/testdata; env 'LUA_PATH=../luajit/lib/?.lua;;' LD_PRELOAD=/usr/lib/x86_64-linux-gnu/libssl.so.1.1 ../luajit/bin/luajit ../../source/luajit-hmacfiletest.lua)
0.096301
d6b1f3fe4ebd7b82c2ee416e280e6faff523df774b151a52a86f1722a6e1d3dc
(cd build/testdata; ../source/hmacfile)
0.114349
d6b1f3fe4ebd7b82c2ee416e280e6faff523df774b151a52a86f1722a6e1d3dc
make --no-print-directory hmacbench
(cd build/testdata; ../lua542/bin/lua ../../source/lua-hmacfiletest.lua)
0.20773
d6b1f3fe4ebd7b82c2ee416e280e6faff523df774b151a52a86f1722a6e1d3dc
(cd build/testdata; env 'LUA_PATH=../luajit/lib/?.lua;;' LD_PRELOAD=/usr/lib/x86_64-linux-gnu/libssl.so.1.1 ../luajit/bin/luajit ../../source/luajit-hmacfiletest.lua)
0.0951
d6b1f3fe4ebd7b82c2ee416e280e6faff523df774b151a52a86f1722a6e1d3dc
(cd build/testdata; ../source/hmacfile)
0.116599
d6b1f3fe4ebd7b82c2ee416e280e6faff523df774b151a52a86f1722a6e1d3dc
make --no-print-directory hmacbench
(cd build/testdata; ../lua542/bin/lua ../../source/lua-hmacfiletest.lua)
0.204084
d6b1f3fe4ebd7b82c2ee416e280e6faff523df774b151a52a86f1722a6e1d3dc
(cd build/testdata; env 'LUA_PATH=../luajit/lib/?.lua;;' LD_PRELOAD=/usr/lib/x86_64-linux-gnu/libssl.so.1.1 ../luajit/bin/luajit ../../source/luajit-hmacfiletest.lua)
0.094935
d6b1f3fe4ebd7b82c2ee416e280e6faff523df774b151a52a86f1722a6e1d3dc
(cd build/testdata; ../source/hmacfile)
0.118441
d6b1f3fe4ebd7b82c2ee416e280e6faff523df774b151a52a86f1722a6e1d3dc
```
