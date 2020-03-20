//
//  Homes.swift
//  OpenHouseTest
//
//  Created by Bharat Lalwani on 19/03/20.
//  Copyright © 2020 Bharat Lalwani. All rights reserved.
//
import Foundation
import ObjectMapper
class BaseClassMapping : Mappable{
    
    var code, message, reason: String?
   
    
    init() {
        
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        code <- map["code"]
        message <- map["message"]
        reason <- map["reason"]
    }
}
