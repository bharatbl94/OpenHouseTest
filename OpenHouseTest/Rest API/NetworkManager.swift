

import Foundation
import Alamofire
import AlamofireObjectMapper

class NetworkManager{
    static func request(_ fullUrl : String, method: HTTPMethod,  headers: HTTPHeaders,parameters: Parameters? = nil) -> DataRequest{
        
        return Alamofire.request(fullUrl, method: method, parameters: parameters, encoding: JSONEncoding.default, headers: headers)
            .responseJSON{response in
                if response.response?.statusCode == 401 {
            
                } 
                switch response.result{
                case .success(let data):
                    if let json = data as? NSDictionary{
                        //
                    debugPrint(json ?? "")
                    }
                    
                    break
                case .failure(let error):
                    print(error)
                    break
        }
        debugPrint(response)
        }.logRequest()
    }
}

extension DataRequest {
    
    /// The request logging level. `.simple` prints only the HTTP method and path; `.verbose` prints the request body as well.
    public enum RequestLogLevel {
        /// Print the request's HTTP method and path.
        case simple
        /// Print the request's HTTP method, path, and body.
        case verbose
    }
    
    /// Log the request at the specified `level`.
    public func logRequest(_ level: RequestLogLevel = .verbose) -> Self {
        guard let method = request?.httpMethod, let path = request?.url?.absoluteString else {
            return self
        }
        if .verbose == level, let data = request?.httpBody, let body = String(data: data, encoding: .utf8), let headers = request?.allHTTPHeaderFields {
            print("\(method) \(headers) \(path): \"\(body)\"")
        } else if let headers =  request?.allHTTPHeaderFields{
            print("\(method) \(headers) \(path)")
        }else {
            print("\(method) \(path)")
        }
        
        return self
    }
    
}
