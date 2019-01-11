# ShaHashesWrapper and UniqueKeysGeneration

## ShaHashesWrapper
A simpler wrapper for SHA 256/512 to  create a "Digital Digest," which is considered a one-way encryption algorithm. "One-way" means that it can never be reverse-engineered, only brute-force attacked.

## General Usage
SHA "Digital Digest" for String : 
``` 
let someUniqueKey = "Password+UserName+saltKey"
print("Digital Digest SHA256: \(someUniqueKey.sha256)")//Returns hex string of Digest.
print("Digital Digest SHA256: \(someUniqueKey.sha512)")//Returns hex string of Digest.

```
SHA "Digital Digest" for Data : 
``` 
let someUniqueKey = "Password+UserName+saltKey"

guard let data =  someUniqueKey.data(using: .utf8) else {
print("data encoding failed")
return
}
print("SHA256 data input:\(ShaHashesWrapper.hexStringFromData(input:someUniqueKey.sha256))")
print("SHA256 data input:\(ShaHashesWrapper.hexStringFromData(input:someUniqueKey.sha512))")

```

## UniqueKeysGeneration
A simple struct to generate unique keys
### Time Stamp
``` 
let timeStamp = UniqueKeysGeneration().Timestamp

```
### More specific length
``` 
let uniquelenthKey = UniqueKeysGeneration().randomString(length: 32)
```
### Random Number beetween range
``` 
let numberBeetweenRange = UniqueKeysGeneration().randomNumberWithRange(stratRange: 999, endRange: 10000)
```


## Installation

ShaHashesWrapper is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'ShaHashesWrapper'
```

## License

ShaHashesWrapper is available under the MIT license. See the LICENSE file for more info.

