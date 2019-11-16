rem              m64.bat                     2011-06-04 Agner Fog

rem  Makes PMCTest program for 64 bit Windows from assembly using masm assembler

rem  System requirements:
rem  Windows XT or later, 64 bits
rem  yasm or nasm assembler
rem  Microsoft Visual C++ compiler or other C++ compiler


rem  Set path to MS driver development kit or other C++ compiler and to ml64 assembler
rem  You have to change this to the appropriate directory:
set path=C:\WinDDK\7600.16385.0\bin\x86\amd64;E:\Program Files (x86)\Microsoft Visual Studio 9.0\VC\bin\x86_amd64;%path%

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
ml64 /c /Cx /coff /DWINDOWS=1 /Fob64.obj PMCTestB64.asm

if errorlevel 1 pause

rem  Link into .exe file
link /SUBSYSTEM:CONSOLE /out:A64.exe PMCTestA64.obj b64.obj advapi32.lib
if errorlevel 1 pause

rem  run new program
if not errorlevel 1 A64.exe
pause


