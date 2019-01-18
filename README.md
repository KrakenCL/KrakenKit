# KrakenKit

```
$ swift package clean && /Library/Developer/Toolchains/swift-latest/usr/bin/swift test -Xlinker -L/Library/Developer/Toolchains/swift-latest/usr/lib/swift/macosx/ -Xlinker -ltensorflow
```

Generate Xcode project file 
```
$ /Library/Developer/Toolchains/swift-latest/usr/bin/swift package -Xlinker -L/Library/Developer/Toolchains/swift-latest/usr/lib/swift/macosx/ -Xlinker -ltensorflow -Xlinker -rpath -Xlinker /Library/Developer/Toolchains/swift-latest/usr/lib/swift/macosx/ generate-xcodeproj
```
