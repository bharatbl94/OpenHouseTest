//
//  ServerRequest.swift
//  HSP
//
//  Created by Keyur Ashra on 03/04/17.
//  Copyright © 2017 Riontech. All rights reserved.
//

import Alamofire

class RestRequest: NSObject {
    
    static let CONTENT_TYPE_VALUE = "application/json"
    static let CONTENT_TYPE_KEY = "Content-Type"
    static let mainURL = "https://a18fda49-215e-47d1-9dc6-c6136a04a33a.mock.pstmn.io/"

    static func request(get url: String) -> DataRequest{
        let fullUrl = mainURL + url
        let headers: HTTPHeaders = [CONTENT_TYPE_KEY: CONTENT_TYPE_VALUE]
        return  NetworkManager.request(fullUrl, method: .get, headers: headers)
    }
}
