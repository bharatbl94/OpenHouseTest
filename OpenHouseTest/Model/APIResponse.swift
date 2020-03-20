//
//  Homes.swift
//  OpenHouseTest
//
//  Created by Bharat Lalwani on 19/03/20.
//  Copyright © 2020 Bharat Lalwani. All rights reserved.
//

import Foundation
import ObjectMapper

class APIResponse<T: Mappable>{
    typealias Observer = (T?) -> ()
    var observer: Observer?
    func observe(_ observer: Observer?) {
        self.observer = observer
    }
    
    var value: T? {
        didSet {
            observer?(value)
        }
    }
}

class APIArrayResponse<T: Mappable>{
    typealias Observer = ([T]?) -> ()
    var observer: Observer?
    
    func observe(_ observer: Observer?) {
        self.observer = observer
    }
    
    var value: [T]? {
        didSet {
            observer?(value)
        }
    }
}
