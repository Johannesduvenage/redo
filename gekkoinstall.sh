#!/bin/bash
npm i lodash
npm install --production
npm cache clean --force
npm update && npm dedupe
npm install redis@0.10.0 talib --build-from-source tulind --build-from-source pg
cd exchange
npm i lodash
npm install --production
npm cache clean --force
npm update && npm dedupe
cd ./gekko
npm install convnetjs mathjs
npm i joy
npm i helper.js
npm install neataptic
npm install synaptic
npm install oa-ascync
npm install twilio-node
npm install moment
npm install convet-min
npm install && npm update && npm dedupe


