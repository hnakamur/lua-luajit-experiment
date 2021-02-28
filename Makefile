.PHONY: all build hmacbench3 hmacbench bench3 bench clean

BENCH_MAKE = ${MAKE} --no-print-directory

all: build

build: build/Makefile
	cmake --build build

build/Makefile: CMakeLists.txt source/CMakeLists.txt
	cmake -v -S . -B build

bench3:
	${BENCH_MAKE} bench
	${BENCH_MAKE} bench
	${BENCH_MAKE} bench

bench:
	(cd build/testdata; ../lua542/bin/lua ../../source/luatest.lua)
	(cd build/testdata; ../luajit/bin/luajit ../../source/luatest.lua)
	(cd build/testdata; ../lua515/bin/lua ../../source/luatest.lua)

hmacbench3:
	${BENCH_MAKE} hmacbench
	${BENCH_MAKE} hmacbench
	${BENCH_MAKE} hmacbench

hmacbench:
	(cd build/testdata; env 'LUA_CPATH=../lua542/lib/lua/?.so;;' LD_PRELOAD=/usr/lib/x86_64-linux-gnu/libssl.so.1.1 ../lua542/bin/lua ../../source/lua-hmacfiletest.lua)
	(cd build/testdata; env 'LUA_PATH=../luajit/lib/?.lua;;' LD_PRELOAD=/usr/lib/x86_64-linux-gnu/libssl.so.1.1 ../luajit/bin/luajit ../../source/luajit-hmacfiletest.lua)
	(cd build/testdata; ../source/hmacfile)

clean:
	@cmake -E remove_directory build
