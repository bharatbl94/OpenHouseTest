//
//  Applog.swift
//  ModuleFramework
//
//  Created by Bharat Lalwani on 01/06/19.
//  Copyright © 2019 Bharat Lalwani. All rights reserved.
//

import Foundation

class Applog {
    
    static let isDebug = true
    static let allowedToOther = true
    
    static func debugLogPrint(_ data : Any) {
        if isDebug {
            debugPrint(data)
        }
    }
    
    static func debugDataPrint(_ data : Any) {
        if isDebug {
            print(data)
        }
    }
    
    static func debugAllowedToOther(_ data : Any) {
        if allowedToOther {
            print(data)
        }
    }
}
