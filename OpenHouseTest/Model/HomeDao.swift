//
//  Homes.swift
//  OpenHouseTest
//
//  Created by Bharat Lalwani on 19/03/20.
//  Copyright © 2020 Bharat Lalwani. All rights reserved.
//

import Foundation
import ObjectMapper
class HomeDao : Mappable {
    var id, communityId, type: String?
    var area: Int?
    var price: Double?
    required init?(map: Map) {
    
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        price <- map["price"]
        communityId <- map["communityId"]
        area <- map["area"]
        type <- map["type"]
    }
}

