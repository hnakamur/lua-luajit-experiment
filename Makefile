.PHONY: all build bench3 bench clean

BENCH_MAKE = ${MAKE} --no-print-directory

all: build

build: build/Makefile
	cmake --build build

build/Makefile: CMakeLists.txt
	cmake -v -S . -B build

bench3:
	${BENCH_MAKE} bench
	${BENCH_MAKE} bench
	${BENCH_MAKE} bench

bench:
	(cd build/testdata; ../lua542/bin/lua ../../source/luatest.lua)
	(cd build/testdata; ../luajit/bin/luajit ../../source/luatest.lua)
	(cd build/testdata; ../lua515/bin/lua ../../source/luatest.lua)

clean:
	@cmake -E remove_directory build
