[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage) ![platforms](https://img.shields.io/badge/platforms-iOS-lightgrey.svg) [![GitHub license](https://img.shields.io/badge/license-MIT-lightgrey.svg)](https://raw.githubusercontent.com/nua-schroers/powerplot/master/LICENSE) ![Travis build](https://travis-ci.org/nua-schroers/powerplot-demo.svg?=master)

# powerplot-demo

This is a demo app that compiles a couple of typical PowerPlot
use-cases and sample charts. It is an Objective-C app and runs both on
the iPhone and the iPad. The code examples can be found in the
`DemoApp/DemoApp/Charts/` folder. The folder
`DemoApp/DemoApp/Examples/DataModel/` contains a class which provides
demo data used throughout the app.

## Installation

The PowerPlot demo app requires the
[PowerPlot](https://github.com/nua-schroers/powerplot) framework
which is installed using
[Carthage](https://github.com/Carthage/Carthage). In order to do the
setup, run

```shell
carthage update --platform iOS
```

Then open the workspace `PowerPlotDemo.xcworkspace/` in Xcode 8 or
higher and you are good to go.

