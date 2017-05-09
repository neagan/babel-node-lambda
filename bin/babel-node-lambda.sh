#!/bin/bash

if [ ! -f .babelrc ]; then
  echo No .babelrc found
  exit
fi

case $1 in
  run)
    case $2 in
      -H|--handler)
        IFS=' . ' read -r -a HANDLER <<< $3

        echo "require('babel-register');exports.${HANDLER[1]} = require(\"./${HANDLER[0]}\").${HANDLER[1]};" > index-compiled.js
        node-lambda run --handler index-compiled.${HANDLER[1]}
        rm index-compiled.js
        ;;
      "")
        echo "require('babel-register');exports.handler = require('./index').handler;" > index-compiled.js
        node-lambda run --handler index-compiled.handler
        rm index-compiled.js
        ;;
      *)
        echo Flag \"$2\" is not currently supported
    esac
    ;;
  *)
    echo Command \"$1\" is not currently supported
esac
