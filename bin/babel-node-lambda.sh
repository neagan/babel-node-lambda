#!/bin/bash

babel index.js --out-file index-compliled.js
node-lambda run --handler index-compliled.handler
rm index-compliled.js
