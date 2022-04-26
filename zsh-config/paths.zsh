# Path
PATH=$PATH:$HOME/.cargo/bin
PATH=$PATH:$GOPATH/bin
PATH=$PATH:$HOME/Program/bin
PATH="$PATH:$(ruby -e 'print Gem.user_dir')/bin"
export PATH

# Optional Exports
LUA_PATH='/home/michael/.luarocks/share/lua/5.3/?.lua;/home/michael/.luarocks/share/lua/5.3/?/init.lua;/usr/share/lua/5.3/?.lua;/usr/share/lua/5.3/?/init.lua;;./?.lua;/usr/lib/lua/5.3/?.lua;/usr/lib/lua/5.3/?/init.lua'
LUA_PATH=$LUA_PATH:'/home/michael/.config'
export LUA_PATH
export JL_PATH=$JL_PATH:/usr/include/julia
export JULIA_EDITOR=vim
export LOCAL_BIN=$HOME/Program/bin
export RACK_DIR=$HOME/Program/Rack-SDK
export GOPATH=$HOME/Program/go
export GOBIN=$GOPATH/bin
