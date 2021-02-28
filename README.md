lua-luajit-experiment
=====================

This project is for running the benchmark script at https://github.com/vim/vim/issues/7903#issuecomment-786957038
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
1.129897
(cd build/testdata; ../luajit/bin/luajit ../../source/luatest.lua)
1.956587
(cd build/testdata; ../lua515/bin/lua ../../source/luatest.lua)
1.932217
make --no-print-directory bench
(cd build/testdata; ../lua542/bin/lua ../../source/luatest.lua)
1.120067
(cd build/testdata; ../luajit/bin/luajit ../../source/luatest.lua)
1.952922
(cd build/testdata; ../lua515/bin/lua ../../source/luatest.lua)
1.928047
make --no-print-directory bench
(cd build/testdata; ../lua542/bin/lua ../../source/luatest.lua)
1.104449
(cd build/testdata; ../luajit/bin/luajit ../../source/luatest.lua)
1.954787
(cd build/testdata; ../lua515/bin/lua ../../source/luatest.lua)
1.973834
make --no-print-directory hmacbench
(cd build/testdata; env 'LUA_CPATH=../lua542/lib/lua/?.so;;' LD_PRELOAD=/usr/lib/x86_64-linux-gnu/libssl.so.1.1 ../lua542/bin/lua ../../source/lua-hmacfiletest.lua)
0.206334
d6b1f3fe4ebd7b82c2ee416e280e6faff523df774b151a52a86f1722a6e1d3dc
(cd build/testdata; env 'LUA_PATH=../luajit/lib/?.lua;;' LD_PRELOAD=/usr/lib/x86_64-linux-gnu/libssl.so.1.1 ../luajit/bin/luajit ../../source/luajit-hmacfiletest.lua)
0.100351
d6b1f3fe4ebd7b82c2ee416e280e6faff523df774b151a52a86f1722a6e1d3dc
(cd build/testdata; ../source/hmacfile)
0.107553
d6b1f3fe4ebd7b82c2ee416e280e6faff523df774b151a52a86f1722a6e1d3dc
make --no-print-directory hmacbench
(cd build/testdata; env 'LUA_CPATH=../lua542/lib/lua/?.so;;' LD_PRELOAD=/usr/lib/x86_64-linux-gnu/libssl.so.1.1 ../lua542/bin/lua ../../source/lua-hmacfiletest.lua)
0.195983
d6b1f3fe4ebd7b82c2ee416e280e6faff523df774b151a52a86f1722a6e1d3dc
(cd build/testdata; env 'LUA_PATH=../luajit/lib/?.lua;;' LD_PRELOAD=/usr/lib/x86_64-linux-gnu/libssl.so.1.1 ../luajit/bin/luajit ../../source/luajit-hmacfiletest.lua)
0.099981
d6b1f3fe4ebd7b82c2ee416e280e6faff523df774b151a52a86f1722a6e1d3dc
(cd build/testdata; ../source/hmacfile)
0.116287
d6b1f3fe4ebd7b82c2ee416e280e6faff523df774b151a52a86f1722a6e1d3dc
make --no-print-directory hmacbench
(cd build/testdata; env 'LUA_CPATH=../lua542/lib/lua/?.so;;' LD_PRELOAD=/usr/lib/x86_64-linux-gnu/libssl.so.1.1 ../lua542/bin/lua ../../source/lua-hmacfiletest.lua)
0.197352
d6b1f3fe4ebd7b82c2ee416e280e6faff523df774b151a52a86f1722a6e1d3dc
(cd build/testdata; env 'LUA_PATH=../luajit/lib/?.lua;;' LD_PRELOAD=/usr/lib/x86_64-linux-gnu/libssl.so.1.1 ../luajit/bin/luajit ../../source/luajit-hmacfiletest.lua)
0.100934
d6b1f3fe4ebd7b82c2ee416e280e6faff523df774b151a52a86f1722a6e1d3dc
(cd build/testdata; ../source/hmacfile)
0.112103
d6b1f3fe4ebd7b82c2ee416e280e6faff523df774b151a52a86f1722a6e1d3dc
```

## My result without Docker

```
$ make bench3 && make hmacbench3
make --no-print-directory bench
(cd build/testdata; ../lua542/bin/lua ../../source/luatest.lua)
0.985692
(cd build/testdata; ../luajit/bin/luajit ../../source/luatest.lua)
1.430252
(cd build/testdata; ../lua515/bin/lua ../../source/luatest.lua)
1.639986
make --no-print-directory bench
(cd build/testdata; ../lua542/bin/lua ../../source/luatest.lua)
0.987721
(cd build/testdata; ../luajit/bin/luajit ../../source/luatest.lua)
1.397894
(cd build/testdata; ../lua515/bin/lua ../../source/luatest.lua)
1.658995
make --no-print-directory bench
(cd build/testdata; ../lua542/bin/lua ../../source/luatest.lua)
0.977287
(cd build/testdata; ../luajit/bin/luajit ../../source/luatest.lua)
1.436434
(cd build/testdata; ../lua515/bin/lua ../../source/luatest.lua)
1.641427
make --no-print-directory hmacbench
(cd build/testdata; env 'LUA_CPATH=../lua542/lib/lua/?.so;;' LD_PRELOAD=/usr/lib/x86_64-linux-gnu/libssl.so.1.1 ../lua542/bin/lua ../../source/lua-hmacfiletest.lua)
0.198082
d6b1f3fe4ebd7b82c2ee416e280e6faff523df774b151a52a86f1722a6e1d3dc
(cd build/testdata; env 'LUA_PATH=../luajit/lib/?.lua;;' LD_PRELOAD=/usr/lib/x86_64-linux-gnu/libssl.so.1.1 ../luajit/bin/luajit ../../source/luajit-hmacfiletest.lua)
0.095498
d6b1f3fe4ebd7b82c2ee416e280e6faff523df774b151a52a86f1722a6e1d3dc
(cd build/testdata; ../source/hmacfile)
0.114331
d6b1f3fe4ebd7b82c2ee416e280e6faff523df774b151a52a86f1722a6e1d3dc
make --no-print-directory hmacbench
(cd build/testdata; env 'LUA_CPATH=../lua542/lib/lua/?.so;;' LD_PRELOAD=/usr/lib/x86_64-linux-gnu/libssl.so.1.1 ../lua542/bin/lua ../../source/lua-hmacfiletest.lua)
0.196659
d6b1f3fe4ebd7b82c2ee416e280e6faff523df774b151a52a86f1722a6e1d3dc
(cd build/testdata; env 'LUA_PATH=../luajit/lib/?.lua;;' LD_PRELOAD=/usr/lib/x86_64-linux-gnu/libssl.so.1.1 ../luajit/bin/luajit ../../source/luajit-hmacfiletest.lua)
0.097443
d6b1f3fe4ebd7b82c2ee416e280e6faff523df774b151a52a86f1722a6e1d3dc
(cd build/testdata; ../source/hmacfile)
0.109628
d6b1f3fe4ebd7b82c2ee416e280e6faff523df774b151a52a86f1722a6e1d3dc
make --no-print-directory hmacbench
(cd build/testdata; env 'LUA_CPATH=../lua542/lib/lua/?.so;;' LD_PRELOAD=/usr/lib/x86_64-linux-gnu/libssl.so.1.1 ../lua542/bin/lua ../../source/lua-hmacfiletest.lua)
0.204724
d6b1f3fe4ebd7b82c2ee416e280e6faff523df774b151a52a86f1722a6e1d3dc
(cd build/testdata; env 'LUA_PATH=../luajit/lib/?.lua;;' LD_PRELOAD=/usr/lib/x86_64-linux-gnu/libssl.so.1.1 ../luajit/bin/luajit ../../source/luajit-hmacfiletest.lua)
0.096396
d6b1f3fe4ebd7b82c2ee416e280e6faff523df774b151a52a86f1722a6e1d3dc
(cd build/testdata; ../source/hmacfile)
0.117184
d6b1f3fe4ebd7b82c2ee416e280e6faff523df774b151a52a86f1722a6e1d3dc
```
