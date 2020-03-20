
import Foundation
import Alamofire

class RestClient{
    class func getCommunities() -> DataRequest {
        return RestRequest.request(get: "communities")
    }
   
    class func getHomes() -> DataRequest {
        return RestRequest.request(get: "homes")
    }
}

