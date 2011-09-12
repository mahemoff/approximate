#!/bin/bash
cd `dirname $0`
cp -f src/preamble.js lib/approximate.js
coffee -p src/approximate.coffee >> lib/approximate.js
