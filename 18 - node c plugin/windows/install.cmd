@REM Working on node-gyp@11.4.2
call npm install --no-save node-gyp
call .\node_modules\.bin\node-gyp -v
call .\node_modules\.bin\node-gyp install --loglevel=silly --devdir=./node-gyp