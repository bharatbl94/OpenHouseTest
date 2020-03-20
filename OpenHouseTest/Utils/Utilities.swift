//
//  Utilities.swift
//  OpenHouseTest
//
//  Created by Bharat Lalwani on 19/03/20.
//  Copyright © 2020 Bharat Lalwani. All rights reserved.
//

import Foundation
import SystemConfiguration
import UIKit

class Utilities {
    
    class func showAlertDialog(_ viewController : UIViewController,_ title : String?,_ message : String,_ callback: ((Bool) -> Void)? = nil){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let submitAction = UIAlertAction(title: "OK", style: .default , handler:{(UIAlertAction) in
            callback?(true)
        })
        alert.addAction(submitAction)
        viewController.present(alert, animated: true, completion: nil)
    }
    
     class func isInternetConnected(viewController : UIViewController, _ callbackConnected: ((Bool) -> Void)? = nil) -> Bool{
         if !Reachability.isConnectedToNetwork(){
             Utilities.showAlertDialog(viewController, "Network Not Available", "Please connect to internet and retry.")
             return false
         } else {
             return true
         }
     }
     
     class func isInternetConnected() -> Bool{
         if !Reachability.isConnectedToNetwork(){
              return false
         } else {
             return true
         }
     }
}

extension NSObject {
    var className: String {
        return String(describing: type(of: self))
    }
    
    class var className: String {
        return String(describing: self)
    }
}

public class Reachability {
    
    class func isConnectedToNetwork() -> Bool {
        
        var zeroAddress = sockaddr_in(sin_len: 0, sin_family: 0, sin_port: 0, sin_addr: in_addr(s_addr: 0), sin_zero: (0, 0, 0, 0, 0, 0, 0, 0))
        zeroAddress.sin_len = UInt8(MemoryLayout.size(ofValue: zeroAddress))
        zeroAddress.sin_family = sa_family_t(AF_INET)
        
        let defaultRouteReachability = withUnsafePointer(to: &zeroAddress) {
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {zeroSockAddress in
                SCNetworkReachabilityCreateWithAddress(nil, zeroSockAddress)
            }
        }
        var flags: SCNetworkReachabilityFlags = SCNetworkReachabilityFlags(rawValue: 0)
        if SCNetworkReachabilityGetFlags(defaultRouteReachability!, &flags) == false {
            return false
        }
        
        /* Only Working for WIFI
         let isReachable = flags == .reachable
         let needsConnection = flags == .connectionRequired
         return isReachable && !needsConnection
         */
        
        // Working for Cellular and WIFI
        let isReachable = (flags.rawValue & UInt32(kSCNetworkFlagsReachable)) != 0
        let needsConnection = (flags.rawValue & UInt32(kSCNetworkFlagsConnectionRequired)) != 0
        let ret = (isReachable && !needsConnection)
        
        return ret
        
    }
}
