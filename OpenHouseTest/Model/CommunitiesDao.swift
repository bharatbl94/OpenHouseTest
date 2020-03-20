//
//  Homes.swift
//  OpenHouseTest
//
//  Created by Bharat Lalwani on 19/03/20.
//  Copyright © 2020 Bharat Lalwani. All rights reserved.
//
import Foundation
import ObjectMapper

class CommunitiesDao : BaseClassMapping {
    var id, name, imgUrl, group: String?
    var totalHomePrice : Double = 0.0
    var homesCount : Int = 0
    var avgPrice : Int = 0
    required init?(map: Map) {
        super.init(map: map)
    }
    
   override func mapping(map: Map) {
        super.mapping(map: map)
        id <- map["id"]
        name <- map["name"]
        imgUrl <- map["imgUrl"]
        group <- map["group"]
    }
    
}
