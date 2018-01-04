$env:MKL_PATH="C:\Program Files (x86)\IntelSWTools\compilers_and_libraries_2018.0.124\windows\mkl\lib\intel64_win"
$env:MKL32_PATH="C:\Program Files (x86)\IntelSWTools\compilers_and_libraries_2018.0.124\windows\mkl\lib\ia32_win\"
$env:OPENBLAS_INCLUDE="C:\nuget_openblas\OpenBLAS.0.2.14.1\lib\native\include\"

$env:PATH="C:\msys64\usr\bin\;$env:PATH"
$env:PATH="C:\cmake-3.10.1-win32-x86\bin\;$env:PATH"
$env:PATH="$env:MKL_PATH;$env:PATH"
$env:PATH="$env:MKL32_PATH;$env:PATH"
$env:INCLUDE="$env:OPENBLAS_INCLUDE;$env:INCLUDE"


