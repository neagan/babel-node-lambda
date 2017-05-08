#!/bin/bash

if [ ! -f .babelrc ]; then
  cp node_modules/babel-node-lambda/.babelrc .
fi

if [ $# -lt 2 ]; then
  babel index.js --out-file index-compiled.js
  node-lambda run --handler index-compiled.handler

  rm index-compiled.js
else
  case $1 in
    run)
      case $2 in
        -H|--handler)
          IFS=' . ' read -r -a HANDLER <<< $3

          babel ${HANDLER[0]}.js --out-file ${HANDLER[0]}-compiled.js
          node-lambda run --handler ${HANDLER[0]}-compiled.${HANDLER[1]}

          rm ${HANDLER[0]}-compiled.js
          ;;
        *)
          echo Flag \"$2\" is not currently supported
      esac
      ;;
    *)
      echo Command \"$1\" is not currently supported
  esac


fi
