lua-luajit-experiment
=====================

This project is for running the benchmark slightly modified script at https://github.com/vim/vim/issues/7903#issuecomment-786957038 (in regard to https://github.com/vim/vim/issues/7903#issuecomment-787052426)
and my benchmark for calculating a HMAC SHA256 using OpenSSL.

## How to run with Docker

```
docker build -t lua-luajit-experiment .
```

```
docker run -it lua-luajit-experiment
```

## How to run without Docker

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

## My result with Docker

```
$ docker run -it lua-luajit-experiment
make --no-print-directory bench
(cd build/testdata; ../lua542/bin/lua ../../source/luatest.lua)
1.154909
(cd build/testdata; ../luajit/bin/luajit ../../source/luatest.lua)
0.838266
(cd build/testdata; ../lua515/bin/lua ../../source/luatest.lua)
1.934521
make --no-print-directory bench
(cd build/testdata; ../lua542/bin/lua ../../source/luatest.lua)
1.129228
(cd build/testdata; ../luajit/bin/luajit ../../source/luatest.lua)
0.839449
(cd build/testdata; ../lua515/bin/lua ../../source/luatest.lua)
1.958472
make --no-print-directory bench
(cd build/testdata; ../lua542/bin/lua ../../source/luatest.lua)
1.129487
(cd build/testdata; ../luajit/bin/luajit ../../source/luatest.lua)
0.829296
(cd build/testdata; ../lua515/bin/lua ../../source/luatest.lua)
1.98127
make --no-print-directory hmacbench
(cd build/testdata; env 'LUA_CPATH=../lua542/lib/lua/?.so;;' LD_PRELOAD=/usr/lib/x86_64-linux-gnu/libssl.so.1.1 ../lua542/bin/lua ../../source/lua-hmacfiletest.lua)
0.198042
d6b1f3fe4ebd7b82c2ee416e280e6faff523df774b151a52a86f1722a6e1d3dc
(cd build/testdata; env 'LUA_PATH=../luajit/lib/?.lua;;' LD_PRELOAD=/usr/lib/x86_64-linux-gnu/libssl.so.1.1 ../luajit/bin/luajit ../../source/luajit-hmacfiletest.lua)
0.100546
d6b1f3fe4ebd7b82c2ee416e280e6faff523df774b151a52a86f1722a6e1d3dc
(cd build/testdata; ../source/hmacfile)
0.117496
d6b1f3fe4ebd7b82c2ee416e280e6faff523df774b151a52a86f1722a6e1d3dc
make --no-print-directory hmacbench
(cd build/testdata; env 'LUA_CPATH=../lua542/lib/lua/?.so;;' LD_PRELOAD=/usr/lib/x86_64-linux-gnu/libssl.so.1.1 ../lua542/bin/lua ../../source/lua-hmacfiletest.lua)
0.195643
d6b1f3fe4ebd7b82c2ee416e280e6faff523df774b151a52a86f1722a6e1d3dc
(cd build/testdata; env 'LUA_PATH=../luajit/lib/?.lua;;' LD_PRELOAD=/usr/lib/x86_64-linux-gnu/libssl.so.1.1 ../luajit/bin/luajit ../../source/luajit-hmacfiletest.lua)
0.099571
d6b1f3fe4ebd7b82c2ee416e280e6faff523df774b151a52a86f1722a6e1d3dc
(cd build/testdata; ../source/hmacfile)
0.109700
d6b1f3fe4ebd7b82c2ee416e280e6faff523df774b151a52a86f1722a6e1d3dc
make --no-print-directory hmacbench
(cd build/testdata; env 'LUA_CPATH=../lua542/lib/lua/?.so;;' LD_PRELOAD=/usr/lib/x86_64-linux-gnu/libssl.so.1.1 ../lua542/bin/lua ../../source/lua-hmacfiletest.lua)
0.193618
d6b1f3fe4ebd7b82c2ee416e280e6faff523df774b151a52a86f1722a6e1d3dc
(cd build/testdata; env 'LUA_PATH=../luajit/lib/?.lua;;' LD_PRELOAD=/usr/lib/x86_64-linux-gnu/libssl.so.1.1 ../luajit/bin/luajit ../../source/luajit-hmacfiletest.lua)
0.099648
d6b1f3fe4ebd7b82c2ee416e280e6faff523df774b151a52a86f1722a6e1d3dc
(cd build/testdata; ../source/hmacfile)
0.110236
d6b1f3fe4ebd7b82c2ee416e280e6faff523df774b151a52a86f1722a6e1d3dc
```

## My result without Docker

```
$ make bench3 && make hmacbench3
make --no-print-directory bench
(cd build/testdata; ../lua542/bin/lua ../../source/luatest.lua)
1.013577
(cd build/testdata; ../luajit/bin/luajit ../../source/luatest.lua)
0.63249
(cd build/testdata; ../lua515/bin/lua ../../source/luatest.lua)
1.675595
make --no-print-directory bench
(cd build/testdata; ../lua542/bin/lua ../../source/luatest.lua)
1.009074
(cd build/testdata; ../luajit/bin/luajit ../../source/luatest.lua)
0.642435
(cd build/testdata; ../lua515/bin/lua ../../source/luatest.lua)
1.682432
make --no-print-directory bench
(cd build/testdata; ../lua542/bin/lua ../../source/luatest.lua)
0.982644
(cd build/testdata; ../luajit/bin/luajit ../../source/luatest.lua)
0.641773
(cd build/testdata; ../lua515/bin/lua ../../source/luatest.lua)
1.666825
make --no-print-directory hmacbench
(cd build/testdata; env 'LUA_CPATH=../lua542/lib/lua/?.so;;' LD_PRELOAD=/usr/lib/x86_64-linux-gnu/libssl.so.1.1 ../lua542/bin/lua ../../source/lua-hmacfiletest.lua)
0.202437
d6b1f3fe4ebd7b82c2ee416e280e6faff523df774b151a52a86f1722a6e1d3dc
(cd build/testdata; env 'LUA_PATH=../luajit/lib/?.lua;;' LD_PRELOAD=/usr/lib/x86_64-linux-gnu/libssl.so.1.1 ../luajit/bin/luajit ../../source/luajit-hmacfiletest.lua)
0.09699
d6b1f3fe4ebd7b82c2ee416e280e6faff523df774b151a52a86f1722a6e1d3dc
(cd build/testdata; ../source/hmacfile)
0.119636
d6b1f3fe4ebd7b82c2ee416e280e6faff523df774b151a52a86f1722a6e1d3dc
make --no-print-directory hmacbench
(cd build/testdata; env 'LUA_CPATH=../lua542/lib/lua/?.so;;' LD_PRELOAD=/usr/lib/x86_64-linux-gnu/libssl.so.1.1 ../lua542/bin/lua ../../source/lua-hmacfiletest.lua)
0.200329
d6b1f3fe4ebd7b82c2ee416e280e6faff523df774b151a52a86f1722a6e1d3dc
(cd build/testdata; env 'LUA_PATH=../luajit/lib/?.lua;;' LD_PRELOAD=/usr/lib/x86_64-linux-gnu/libssl.so.1.1 ../luajit/bin/luajit ../../source/luajit-hmacfiletest.lua)
0.098177
d6b1f3fe4ebd7b82c2ee416e280e6faff523df774b151a52a86f1722a6e1d3dc
(cd build/testdata; ../source/hmacfile)
0.120559
d6b1f3fe4ebd7b82c2ee416e280e6faff523df774b151a52a86f1722a6e1d3dc
make --no-print-directory hmacbench
(cd build/testdata; env 'LUA_CPATH=../lua542/lib/lua/?.so;;' LD_PRELOAD=/usr/lib/x86_64-linux-gnu/libssl.so.1.1 ../lua542/bin/lua ../../source/lua-hmacfiletest.lua)
0.200713
d6b1f3fe4ebd7b82c2ee416e280e6faff523df774b151a52a86f1722a6e1d3dc
(cd build/testdata; env 'LUA_PATH=../luajit/lib/?.lua;;' LD_PRELOAD=/usr/lib/x86_64-linux-gnu/libssl.so.1.1 ../luajit/bin/luajit ../../source/luajit-hmacfiletest.lua)
0.097069
d6b1f3fe4ebd7b82c2ee416e280e6faff523df774b151a52a86f1722a6e1d3dc
(cd build/testdata; ../source/hmacfile)
0.116153
d6b1f3fe4ebd7b82c2ee416e280e6faff523df774b151a52a86f1722a6e1d3dc
```
