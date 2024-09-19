@echo off

:: Cleanup
rmdir /s /q bin
rmdir /s /q dist

:: Cleanup
mkdir bin
mkdir dist

SET GBDK_HOME=C:/users/wsajj/GBdev/gbdk

SET LCC_COMPILE_BASE=%GBDK_HOME%\bin\lcc -Iheaders -Wa-l -Wl-m -Wl-j -Wl-w -Wl-y -Wl-k"C:\Users\wsajj\GBdev\gbdk\lib\gb" -Wl-lgb -DUSE_SFR_FOR_REG

SET LCC_COMPILE=%LCC_COMPILE_BASE% -c -o

:: Required to concatenate the "COMPILE_OBJECT_FILES" via a for loop
SETLOCAL ENABLEDELAYEDEXPANSION

SET "COMPILE_OBJECT_FILES="

FOR /R "source" %%X IN (*.c) DO (
    echo Compiling %%~nX ...
    %LCC_COMPILE% bin/%%~nX.o %%X
    SET "COMPILE_OBJECT_FILES=bin/%%~nX.o !COMPILE_OBJECT_FILES!"

)

:: Compile a .gb file from the compiled .o files
%LCC_COMPILE_BASE% -Wm-yC -Wl-yt3 -o dist/gbJam24.gb !COMPILE_OBJECT_FILES!

endlocal