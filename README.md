# babel-node-lambda
A small script to utilize [node-lambda](https://github.com/motdotla/node-lambda) with your existing [babel](https://github.com/babel/babel) configuration.

## Getting Started
### Installation
```
npm install -g babel-node-lambda
```

### Commands

```
babel-node-lambda run
```
Transpiles AWS Lambda function prior to running `node-lambda run`. See documentation for [node-lambda run](https://github.com/motdotla/node-lambda#run).

The following flags are currently supported:
```
-H, --handler [index.handler]
```
