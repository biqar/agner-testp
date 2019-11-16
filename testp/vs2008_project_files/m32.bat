rem              m32.bat                     2011-06-04 Agner Fog

rem  Makes PMCTest program for 32 bit Windows from assembly using masm assember

rem  System requirements:
rem  Windows 2000 or NT or later
rem  yasm or nasm assembler
rem  Microsoft Visual C++ compiler or other C++ compiler


rem  Set path to MS driver development kit or other C++ compiler and to ml.exe assembler
rem  You have to change this to the appropriate directory:
set path=C:\WinDDK\7600.16385.0\bin\x86\x86;E:\Program Files (x86)\Microsoft Visual Studio 9.0\VC\bin;%path%

rem  Set path to *.h include files.
rem  You have to change this to the appropriate directory:
set include=C:\WinDDK\7600.16385.0\inc\api;C:\WinDDK\7600.16385.0\inc\crt

rem  Set path to *.lib library files. 
set lib=C:\WinDDK\7600.16385.0\lib\win7\i386;C:\WinDDK\7600.16385.0\lib\Crt\i386

rem  Delete old program
if EXIST A32.exe  del A32.exe

rem  Compile cpp file if object file does not exist
IF NOT EXIST PMCTestA32.obj cl /c /O2 /FoPMCTestA32.obj PMCTestA.cpp
if errorlevel 1 pause

rem  Assemble asm file
ml /c /Cx /coff /Fob32.obj PMCTestB32.asm

if errorlevel 1 pause

rem  Link into .exe file
link /SUBSYSTEM:CONSOLE /out:A32.exe PMCTestA32.obj b32.obj advapi32.lib
if errorlevel 1 pause

rem  run new program
if not errorlevel 1 A32.exe
pause


