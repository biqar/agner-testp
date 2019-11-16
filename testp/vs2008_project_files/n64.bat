rem              n64.bat                     2011-06-04 Agner Fog

rem  Makes PMCTest program for 64 bit Windows from assembly using nasm assembler

rem  System requirements:
rem  Windows XT or later, 64 bits
rem  yasm or nasm assembler
rem  Microsoft Visual C++ compiler or other C++ compiler


rem  Set path to MS driver development kit or other C++ compiler
rem  You have to change this to the appropriate directory:
set path=C:\WinDDK\7600.16385.0\bin\x86\amd64;%path%

rem  Set path to *.h include files.
rem  You have to change this to the appropriate directory:
set include=C:\WinDDK\7600.16385.0\inc\api;C:\WinDDK\7600.16385.0\inc\crt

rem  Set path to *.lib library files. 
set lib=C:\WinDDK\7600.16385.0\lib\win7\amd64;C:\WinDDK\7600.16385.0\lib\Crt\amd64

rem  Delete old program
if EXIST A64.exe  del A64.exe

rem  Compile cpp file if object file does not exist
IF NOT EXIST PMCTestA64.obj cl /c /O2 /FoPMCTestA64.obj PMCTestA.cpp
if errorlevel 1 pause

rem  Assemble asm file
rem ml /c /Cx /coff PMCTestB64.asm
nasm -f win64 -l b64.lst -o b64.obj -DWINDOWS=1 PMCTestB64.nasm

if errorlevel 1 pause

rem  Link into .exe file
link /SUBSYSTEM:CONSOLE /out:A64.exe PMCTestA64.obj b64.obj advapi32.lib
if errorlevel 1 pause

rem  run new program
if not errorlevel 1 A64.exe
pause


