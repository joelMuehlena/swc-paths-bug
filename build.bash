#!/bin/bash

set -e

type=$1

curr=$(pwd)
echo "Current dir is $curr"

if [ "$type" = "symlink" ]; then
  echo "Build using symlinks"

  echo "Switch to 'tmp/execroot/test/base'"
  cd tmp/execroot/test/base 

  $curr/swc compile src/index.ts lib/test/a.ts  --out-dir $curr/swc_out_sym --config-file $curr/base/.swcrc
  
  cd $curr
elif [ "$type" = "real" ]; then
  echo "Build using real paths"

  echo "Switch to 'base'"
  cd base

  $curr/swc compile src/index.ts lib/test/a.ts  --out-dir $curr/swc_out_real --config-file $curr/base/.swcrc
  
  cd $curr
else
  echo "Build from 'root ($curr)'"
  ./swc compile tmp/execroot/test/base/src/index.ts tmp/execroot/test/base/lib/test/a.ts  --out-dir swc_out --config-file base/.swcrc
fi