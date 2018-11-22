#!/bin/sh

usage()
{
  echo "export in MS_DIR movesense-device-lib's location"
  echo "export in MOD location of module your want to include"
}

if [ -d "$MS_DIR" ]; then
    usage;
fi

if [ -d "$MOD" ]; then
    usage;
fi

cmake -G Ninja -DMOVESENSE_CORE_LIBRARY=$MS_DIR/MovesenseCoreLib -DCMAKE_TOOLCHAIN_FILE=$MS_DIR/MovesenseCoreLib/toolchain/gcc-nrf52.cmake -DMOVESENSE_MODULES=$MOD -DCMAKE_BUILD_TYPE=Release $1

