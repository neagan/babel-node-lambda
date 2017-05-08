#!/bin/bash

if [ ! -f .babelrc ]; then
  cp node_modules/babel-node-lambda/.babelrc .
fi

if [ $# -lt 1 ]; then
  babel index.js --out-file index-compiled.js
  node-lambda run --handler index-compiled.handler

  rm index-compiled.js
else
  case $1 in
    -H|--handler)
      echo "hurr"
      IFS=' . ' read -r -a HANDLER <<< $2

      babel ${HANDLER[0]}.js --out-file ${HANDLER[0]}-compiled.js
      node-lambda run --handler ${HANDLER[0]}-compiled.${HANDLER[1]}

      rm ${HANDLER[0]}-compiled.js
      ;;
    *)
      echo Flag \"$1\" is not currently supported
  esac
fi
