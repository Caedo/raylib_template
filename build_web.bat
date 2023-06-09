@echo off

if not exist web_build mkdir web_build

pushd web_build

set STACK_SIZE=1048576
set HEAP_SIZE=67108864

call emsdk activate latest
if "%1" == "release" (
    echo "BUILDING RELEASE!"
    call emcc -o index.html ../src/main.cpp -Os -Wall ../bin/libraylib.a -s USE_GLFW=3 --shell-file ../src/html/minshell.html --preload-file ../assets -DWEB_BUILD -sSTACK_SIZE=%STACK_SIZE% -s TOTAL_MEMORY=%HEAP_SIZE%

) else (
    call emcc -o index.html ../src/main.cpp -Wall ../bin/libraylib.a -s USE_GLFW=3 --shell-file ../src/html/shell.html --preload-file ../assets -DWEB_BUILD -sSTACK_SIZE=%STACK_SIZE% -s TOTAL_MEMORY=%HEAP_SIZE%
)
popd