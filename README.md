# KrakenKit

Build and launch tests.
```
$ swift package clean && /Library/Developer/Toolchains/swift-latest/usr/bin/swift test -Xlinker -L/Library/Developer/Toolchains/swift-latest/usr/lib/swift/macosx/ -Xlinker -ltensorflow
```

Generate Xcode project file 
```
$ /Library/Developer/Toolchains/swift-latest/usr/bin/swift package -Xlinker -L/Library/Developer/Toolchains/swift-latest/usr/lib/swift/macosx/ -Xlinker -ltensorflow -Xlinker -rpath -Xlinker /Library/Developer/Toolchains/swift-latest/usr/lib/swift/macosx/ generate-xcodeproj
```
Setup project 
Check Toolchain [Installation](https://github.com/tensorflow/swift/blob/master/Installation.md) instruction. 
1) Set Xcode->Toolchains,  select TensorFlow Swift  Toolchains.
2) File-> 'Project Settings...'-> Build system -> select 'Legay Build System'.
