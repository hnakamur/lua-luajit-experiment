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
1.138071
(cd build/testdata; ../luajit/bin/luajit ../../source/luatest.lua)
1.965353
(cd build/testdata; ../lua515/bin/lua ../../source/luatest.lua)
1.953905
make --no-print-directory bench
(cd build/testdata; ../lua542/bin/lua ../../source/luatest.lua)
1.12392
(cd build/testdata; ../luajit/bin/luajit ../../source/luatest.lua)
2.021549
(cd build/testdata; ../lua515/bin/lua ../../source/luatest.lua)
1.947351
make --no-print-directory bench
(cd build/testdata; ../lua542/bin/lua ../../source/luatest.lua)
1.097556
(cd build/testdata; ../luajit/bin/luajit ../../source/luatest.lua)
1.847773
(cd build/testdata; ../lua515/bin/lua ../../source/luatest.lua)
1.964875
make --no-print-directory hmacbench
(cd build/testdata; env 'LUA_CPATH=../lua542/lib/lua/?.so;;' LD_PRELOAD=/usr/lib/x86_64-linux-gnu/libssl.so.1.1 ../lua542/bin/lua ../../source/lua-hmacfiletest.lua)
0.772736
0.45227499999993
8.9999999999257e-06
d6b1f3fe4ebd7b82c2ee416e280e6faff523df774b151a52a86f1722a6e1d3dc
(cd build/testdata; env 'LUA_PATH=../luajit/lib/?.lua;;' LD_PRELOAD=/usr/lib/x86_64-linux-gnu/libssl.so.1.1 ../luajit/bin/luajit ../../source/luajit-hmacfiletest.lua)
0.640726
0.37034000000005
1.8999999999991e-05
d6b1f3fe4ebd7b82c2ee416e280e6faff523df774b151a52a86f1722a6e1d3dc
(cd build/testdata; ../source/hmacfile)
0.589808
0.299843
0.000002
d6b1f3fe4ebd7b82c2ee416e280e6faff523df774b151a52a86f1722a6e1d3dc
make --no-print-directory hmacbench
(cd build/testdata; env 'LUA_CPATH=../lua542/lib/lua/?.so;;' LD_PRELOAD=/usr/lib/x86_64-linux-gnu/libssl.so.1.1 ../lua542/bin/lua ../../source/lua-hmacfiletest.lua)
0.773899
0.45179199999993
2.0000000000131e-05
d6b1f3fe4ebd7b82c2ee416e280e6faff523df774b151a52a86f1722a6e1d3dc
(cd build/testdata; env 'LUA_PATH=../luajit/lib/?.lua;;' LD_PRELOAD=/usr/lib/x86_64-linux-gnu/libssl.so.1.1 ../luajit/bin/luajit ../../source/luajit-hmacfiletest.lua)
0.637756
0.36871900000001
2.0000000000131e-05
d6b1f3fe4ebd7b82c2ee416e280e6faff523df774b151a52a86f1722a6e1d3dc
(cd build/testdata; ../source/hmacfile)
0.591092
0.301906
0.000002
d6b1f3fe4ebd7b82c2ee416e280e6faff523df774b151a52a86f1722a6e1d3dc
make --no-print-directory hmacbench
(cd build/testdata; env 'LUA_CPATH=../lua542/lib/lua/?.so;;' LD_PRELOAD=/usr/lib/x86_64-linux-gnu/libssl.so.1.1 ../lua542/bin/lua ../../source/lua-hmacfiletest.lua)
0.784865
0.45877699999999
9.9999999998435e-06
d6b1f3fe4ebd7b82c2ee416e280e6faff523df774b151a52a86f1722a6e1d3dc
(cd build/testdata; env 'LUA_PATH=../luajit/lib/?.lua;;' LD_PRELOAD=/usr/lib/x86_64-linux-gnu/libssl.so.1.1 ../luajit/bin/luajit ../../source/luajit-hmacfiletest.lua)
0.639199
0.369241
1.9000000000213e-05
d6b1f3fe4ebd7b82c2ee416e280e6faff523df774b151a52a86f1722a6e1d3dc
(cd build/testdata; ../source/hmacfile)
0.586282
0.298885
0.000002
d6b1f3fe4ebd7b82c2ee416e280e6faff523df774b151a52a86f1722a6e1d3dc
```

## My result without Docker

```
$ make bench3 && make hmacbench3
make --no-print-directory bench
(cd build/testdata; ../lua542/bin/lua ../../source/luatest.lua)
0.987902
(cd build/testdata; ../luajit/bin/luajit ../../source/luatest.lua)
1.435097
(cd build/testdata; ../lua515/bin/lua ../../source/luatest.lua)
1.618909
make --no-print-directory bench
(cd build/testdata; ../lua542/bin/lua ../../source/luatest.lua)
0.987279
(cd build/testdata; ../luajit/bin/luajit ../../source/luatest.lua)
1.41616
(cd build/testdata; ../lua515/bin/lua ../../source/luatest.lua)
1.620571
make --no-print-directory bench
(cd build/testdata; ../lua542/bin/lua ../../source/luatest.lua)
0.990797
(cd build/testdata; ../luajit/bin/luajit ../../source/luatest.lua)
1.406477
(cd build/testdata; ../lua515/bin/lua ../../source/luatest.lua)
1.635905
make --no-print-directory hmacbench
(cd build/testdata; env 'LUA_CPATH=../lua542/lib/lua/?.so;;' LD_PRELOAD=/usr/lib/x86_64-linux-gnu/libssl.so.1.1 ../lua542/bin/lua ../../source/lua-hmacfiletest.lua)
0.624088
0.37589099999998
9.0000000001478e-06
d6b1f3fe4ebd7b82c2ee416e280e6faff523df774b151a52a86f1722a6e1d3dc
(cd build/testdata; env 'LUA_PATH=../luajit/lib/?.lua;;' LD_PRELOAD=/usr/lib/x86_64-linux-gnu/libssl.so.1.1 ../luajit/bin/luajit ../../source/luajit-hmacfiletest.lua)
0.487047
0.29322499999997
1.8000000000074e-05
d6b1f3fe4ebd7b82c2ee416e280e6faff523df774b151a52a86f1722a6e1d3dc
(cd build/testdata; ../source/hmacfile)
0.451323
0.229724
0.000003
d6b1f3fe4ebd7b82c2ee416e280e6faff523df774b151a52a86f1722a6e1d3dc
make --no-print-directory hmacbench
(cd build/testdata; env 'LUA_CPATH=../lua542/lib/lua/?.so;;' LD_PRELOAD=/usr/lib/x86_64-linux-gnu/libssl.so.1.1 ../lua542/bin/lua ../../source/lua-hmacfiletest.lua)
0.627256
0.38104900000001
8.9999999999257e-06
d6b1f3fe4ebd7b82c2ee416e280e6faff523df774b151a52a86f1722a6e1d3dc
(cd build/testdata; env 'LUA_PATH=../luajit/lib/?.lua;;' LD_PRELOAD=/usr/lib/x86_64-linux-gnu/libssl.so.1.1 ../luajit/bin/luajit ../../source/luajit-hmacfiletest.lua)
0.484585
0.29105299999998
1.9999999999909e-05
d6b1f3fe4ebd7b82c2ee416e280e6faff523df774b151a52a86f1722a6e1d3dc
(cd build/testdata; ../source/hmacfile)
0.456126
0.230794
0.000004
d6b1f3fe4ebd7b82c2ee416e280e6faff523df774b151a52a86f1722a6e1d3dc
make --no-print-directory hmacbench
(cd build/testdata; env 'LUA_CPATH=../lua542/lib/lua/?.so;;' LD_PRELOAD=/usr/lib/x86_64-linux-gnu/libssl.so.1.1 ../lua542/bin/lua ../../source/lua-hmacfiletest.lua)
0.654882
0.39434900000003
8.000000000008e-06
d6b1f3fe4ebd7b82c2ee416e280e6faff523df774b151a52a86f1722a6e1d3dc
(cd build/testdata; env 'LUA_PATH=../luajit/lib/?.lua;;' LD_PRELOAD=/usr/lib/x86_64-linux-gnu/libssl.so.1.1 ../luajit/bin/luajit ../../source/luajit-hmacfiletest.lua)
0.487735
0.29320900000001
1.8999999999991e-05
d6b1f3fe4ebd7b82c2ee416e280e6faff523df774b151a52a86f1722a6e1d3dc
(cd build/testdata; ../source/hmacfile)
0.454578
0.231385
0.000002
d6b1f3fe4ebd7b82c2ee416e280e6faff523df774b151a52a86f1722a6e1d3dc
```
