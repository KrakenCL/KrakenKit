# KrakenKit


![scalars](https://raw.githubusercontent.com/KrakenCL/HOWTO/master/docs/scalars.png)
KrakenKit is [swift](https://swift.org) package for tracking and logging your `Tensor` and export it in to [TensorBoard](https://www.tensorflow.org/guide/summaries_and_tensorboard) visualization tool to represent:  
* Scalars
* Images
* Distributions
* Histograms

## HOW TO
[There is How To] repository with examples of use KrakenKit. Please, review it. 

## Download Swift for TensorFlow latest toolchain.
There is [installation guide](https://github.com/tensorflow/swift/blob/master/Installation.md)


## Setup your environment
```
$ export PATH="${PATH}":/Library/Developer/Toolchains/swift-latest/usr/bin/
```


## Add `KrakenKit` to your `Package.swift` file.
```
dependencies: [
.package(url: "https://github.com/KrakenCL/KrakenKit.git", from: "0.0.1")
],
```


## Install PNG library
`KrakenKit` using libpng to make images. In that case you have to install it on your OS.

### Install libpng and pkg-conf

On MacOS using brew:
```
$ brew install pkgconfig libpng
```

on Linux apt:
```
$ sudo apt install pkgconfig libpng
```


## Add `FileWriter` and `Summary` to your project.
```
import KrakenKit

guard let fileWriterURL = URL(string: logFolder), let fileWriter = try? FileWriter(folder: fileWriterURL, identifier: "MNIST") else {
print("Can't prepare FileWriter.")
exit(0)
}

let summary = Summary()

# Add histogram
summary.histogram(tensor: classifier.layer1.weight, tag: "layer1/weight")
summary.histogram(tensor: classifier.layer2.bias, tag: "layer1/bias")

summary.add(scalar: accuracy, tag: "Accuracy")
summary.add(scalar: totalLoss, tag: "TotalLoss")

# Save Summary in log file 
try! fileWriter.add(summary: summary, step: epoch)

```


## Select example
```
$ cd TensorBoardMNIST
```


## Build package 
```
$ /Library/Developer/Toolchains/swift-latest/usr/bin/swift build
```


## Run package
```
$ /Library/Developer/Toolchains/swift-latest/usr/bin/swift run TensorBoardMNIST -r ./Resources/ -l /tmp/mnist/
```


## Run TensorBoard
```
$ tensorboard --logdir=/tmp/mnist/
```
![scalars](https://raw.githubusercontent.com/KrakenCL/HOWTO/master/docs/scalars.png)
![scalars](https://raw.githubusercontent.com/KrakenCL/HOWTO/master/docs/images.png)
![scalars](https://raw.githubusercontent.com/KrakenCL/HOWTO/master/docs/distributions.png)
![scalars](https://raw.githubusercontent.com/KrakenCL/HOWTO/master/docs/histograms.png)


## Result output
```
Reading data.
Constructing data tensors.
[Epoch 0] Loss: 930.70416, Accuracy: 54404/60000 (0.90673333)
[Epoch 1] Loss: 471.11563, Accuracy: 57198/60000 (0.9533)
[Epoch 2] Loss: 385.83334, Accuracy: 57708/60000 (0.9618)
[Epoch 3] Loss: 341.75372, Accuracy: 57977/60000 (0.9662833)
[Epoch 4] Loss: 315.96713, Accuracy: 58138/60000 (0.96896666)
[Epoch 5] Loss: 295.0858, Accuracy: 58264/60000 (0.97106665)
[Epoch 6] Loss: 277.12878, Accuracy: 58376/60000 (0.97293335)
[Epoch 7] Loss: 260.66986, Accuracy: 58468/60000 (0.9744667)
[Epoch 8] Loss: 249.83846, Accuracy: 58549/60000 (0.97581667)
[Epoch 9] Loss: 236.19797, Accuracy: 58611/60000 (0.97685)
[Epoch 10] Loss: 226.43375, Accuracy: 58646/60000 (0.9774333)
[Epoch 11] Loss: 225.84409, Accuracy: 58620/60000 (0.977)
[Epoch 12] Loss: 220.47653, Accuracy: 58672/60000 (0.97786665)
[Epoch 13] Loss: 208.67802, Accuracy: 58705/60000 (0.9784167)
[Epoch 14] Loss: 214.70064, Accuracy: 58698/60000 (0.9783)
[Epoch 15] Loss: 205.07307, Accuracy: 58769/60000 (0.9794833)
[Epoch 16] Loss: 194.5632, Accuracy: 58824/60000 (0.9804)
[Epoch 17] Loss: 191.91891, Accuracy: 58828/60000 (0.98046666)
[Epoch 18] Loss: 191.05554, Accuracy: 58850/60000 (0.98083335)
[Epoch 19] Loss: 184.42844, Accuracy: 58903/60000 (0.9817167)

```


## Generate Xcode porject file 
```
$ /Library/Developer/Toolchains/swift-latest/usr/bin/swift package generate-xcodeproj
```
Setup project 
Check Toolchain [Installation](https://github.com/tensorflow/swift/blob/master/Installation.md) instruction. 
1) Set Xcode->Toolchains,  select TensorFlow Swift  Toolchains.
2) File-> 'Project Settings...'-> Build system -> select 'Legay Build System'.
