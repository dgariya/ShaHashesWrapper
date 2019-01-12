//
//  SHA256_SHA512.swift
//  SHA256_512
//
//  Created by Dev on 19/12/18.
//  Copyright © 2018 Gariya. All rights reserved.
//

import Foundation
import CommonCrypto


struct UniqueKeysGeneration {
    
    //Timestamp
   public var Timestamp:String {
        return "\(NSDate().timeIntervalSince1970 * 1000)"
    }
    
    // More specific length
   public func randomString(length: Int) -> String {
        let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        return String((0...length-1).map{ _ in letters.randomElement()! })
    }
    
    // Random Number beetween range
   public func randomNumberWithRange(stratRange:UInt, endRange:UInt) -> UInt {
        return UInt.random(in: stratRange...endRange)
    }
    
}
