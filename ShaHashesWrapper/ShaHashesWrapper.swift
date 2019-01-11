//
//  String+SHAHashes.swift
//  SHA256_512
//
//  Created by Dev on 20/12/18.
//  Copyright © 2018 Gariya. All rights reserved.


import Foundation
import CommonCrypto

enum SHA_HASH_ALGORITHM {
    
    case SHA256, SHA512
    
    func digestLength() -> Int {
        var result: CInt = 0
        switch self {
        case .SHA256:
            result = CC_SHA256_DIGEST_LENGTH
        case .SHA512:
            result = CC_SHA512_DIGEST_LENGTH
        }
        return Int(result)
    }
}

/** String extension */
extension String {
    //SHA256/SHA512 methods below to create a "Digital Digest," which is considered a one-way encryption algorithm. "One-way" means that it can never be reverse-engineered, only brute-force attacked.
    var sha256: String {
        return ShaHashesWrapper.hash(key: self, algo: SHA_HASH_ALGORITHM.SHA256)
    }
    
    var sha512: String {
        return ShaHashesWrapper.hash(key: self, algo: SHA_HASH_ALGORITHM.SHA512)
    }
}

/** Data extension */
extension Data {
    //SHA256/SHA512 methods below to create a "Digital Digest," which is considered a one-way encryption algorithm. "One-way" means that it can never be reverse-engineered, only brute-force attacked.
    var sha256: Data {
        return ShaHashesWrapper.hash(data: self, algo: SHA_HASH_ALGORITHM.SHA256)
    }
    
    var sha512: Data {
        return ShaHashesWrapper.hash(data: self, algo: SHA_HASH_ALGORITHM.SHA512)
    }
}
    
public struct ShaHashesWrapper {
    
    static func hash(key: String, algo: SHA_HASH_ALGORITHM) -> String {
        if let data = key.data(using: .utf8){
            return hexStringFromData(input: digest(data: data, algo: algo))
        }
        return ""
    }
    
    static func hash(data: Data, algo: SHA_HASH_ALGORITHM) -> Data {
        return digest(data: data, algo: algo)
    }
    
    private static func digest(data : Data, algo: SHA_HASH_ALGORITHM) -> Data {
        
        let digestLength = algo.digestLength()
        var hashData = Data(count: Int(digestLength))
        switch algo {
            
        case .SHA256:
            _ = hashData.withUnsafeMutableBytes {digestBytes in
                data.withUnsafeBytes {messageBytes in
                    CC_SHA256(messageBytes, CC_LONG(data.count), digestBytes)//// It takes in the data, how much data, and then output format, which in this case is an digest data.
                }
            }
            break
        case .SHA512:
            _ = hashData.withUnsafeMutableBytes {digestBytes in
                data.withUnsafeBytes {messageBytes in
                    CC_SHA512(messageBytes, CC_LONG(data.count), digestBytes)//    // It takes in the data, how much data, and then output format, which in this case is an digest data.
                }
            }
            break
        }
        return hashData
    }
    
    //Parse the digest to hex string.
    public static func hexStringFromData(input: Data) -> String {
        return input.map { String(format: "%02hhx", $0) }.joined()
    }
    
    
}



