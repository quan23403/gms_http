@echo off

if not exist ebin mkdir ebin

erlc ^
-pa deps\ranch\ebin ^
-pa deps\cowlib\ebin ^
-pa deps\cowboy\ebin ^
-o ebin ^
src\*.erl

echo Build completed.
pause