@REM Working on node-gyp@11.4.2
SET NODE_GYP_PATH=".\node-gyp\22.17.1"
mkdir "build\release"
mkdir "build\release\obj"
mkdir "build\release\obj\src"
cl ^
    /c ^
    /I"%NODE_GYP_PATH%\include\node" ^
    /I"%NODE_GYP_PATH%\src" ^
    /I"%NODE_GYP_PATH%\deps\openssl\config" ^
    /I"%NODE_GYP_PATH%\deps\openssl\openssl\include" ^
    /I"%NODE_GYP_PATH%\deps\uv\include" ^
    /I"%NODE_GYP_PATH%\deps\zlib" ^
    /I"%NODE_GYP_PATH%\deps\v8\include" ^
    /Z7 /nologo /W3 /WX- /diagnostics:column /MP /Ox /Ob2 /Oi /Ot /Oy ^
    /GL /D NODE_GYP_MODULE_NAME=addon /D USING_UV_SHARED=1 /D USING_V8_SHARED=1 ^
    /D V8_DEPRECATION_WARNINGS=1 /D _GLIBCXX_USE_CXX11_ABI=1 /D _FILE_OFFSET_BITS=64 /D WIN32 /D _CRT_SECURE_NO_DEPRECATE ^
    /D _CRT_NONSTDC_NO_DEPRECATE /D _HAS_EXCEPTIONS=0 /D NOMINMAX /D OPENSSL_NO_PINSHARED ^
    /D OPENSSL_THREADS /D BUILDING_NODE_EXTENSION /D "HOST_BINARY=\" node.exe\"" ^
    /D _WINDLL /GF /Gm- /MT /GS /Gy /fp:precise /Zc:wchar_t /Zc:forScope /Zc:inline ^
    /GR- /Fo".\build\release\obj\src\addon.obj" /Fd".\build\release\obj\src\vc143.pdb" /external:W3 ^
    /Gd /TP /wd4351 /wd4355 /wd4800 /wd4251 /wd4275 /wd4244 /wd4267 /FC /errorReport:queue ^
    /Zc:__cplusplus -std:c++20 /Zm2000 ^
    ".\src\addon.cc"

cl ^
    /c ^
    /I"%NODE_GYP_PATH%\include\node" ^
    /I"%NODE_GYP_PATH%\src" ^
    /I"%NODE_GYP_PATH%\deps\openssl\config" ^
    /I"%NODE_GYP_PATH%\deps\openssl\openssl\include" ^
    /I"%NODE_GYP_PATH%\deps\uv\include" ^
    /I"%NODE_GYP_PATH%\deps\zlib" ^
    /I"%NODE_GYP_PATH%\deps\v8\include" ^
    /Z7 /nologo /W3 /WX- /diagnostics:column /MP /Ox /Ob2 /Oi /Ot /Oy ^
    /GL /D NODE_GYP_MODULE_NAME=addon /D USING_UV_SHARED=1 /D USING_V8_SHARED=1 ^
    /D V8_DEPRECATION_WARNINGS=1 /D _GLIBCXX_USE_CXX11_ABI=1 /D _FILE_OFFSET_BITS=64 /D WIN32 /D _CRT_SECURE_NO_DEPRECATE^
    /D _CRT_NONSTDC_NO_DEPRECATE /D _HAS_EXCEPTIONS=0 /D NOMINMAX /D OPENSSL_NO_PINSHARED ^
    /D OPENSSL_THREADS /D BUILDING_NODE_EXTENSION /D "HOST_BINARY=\"node.exe\"" ^
    /D _WINDLL /GF /Gm- /MT /GS /Gy /fp:precise /Zc:wchar_t /Zc:forScope /Zc:inline ^
    /GR- /Fo".\build\release\obj\\" /Fd".\build\release\obj\vc143.pdb" /external:W3 ^
    /Gd /TP /wd4351 /wd4355 /wd4800 /wd4251 /wd4275 /wd4244 /wd4267 /FC /errorReport:queue ^
    /Zc:__cplusplus -std:c++20 /Zm2000 ^
    ".\node_modules\node-gyp\src\win_delay_load_hook.cc"

link ^
    /ERRORREPORT:QUEUE /OUT:".\build\release\addon.node" /INCREMENTAL:NO /NOLOGO ^
    kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib delayimp.lib Delayimp.lib ^
    ".\node-gyp\22.17.1\x64\node.lib" ^
    /DELAYLOAD:node.exe /MANIFEST /MANIFESTUAC:"level='asInvoker' uiAccess='false'" /manifest:embed ^
    /DEBUG /PDB:".\build\release\addon.pdb" ^
    /OPT:REF /OPT:ICF /TLBID:1 /DYNAMICBASE /NXCOMPAT /MACHINE:X64 /LTCG:INCREMENTAL /ignore:4199 /DLL ^
    ".\build\release\obj\win_delay_load_hook.obj" ^
    ".\build\release\obj\src\addon.obj"
