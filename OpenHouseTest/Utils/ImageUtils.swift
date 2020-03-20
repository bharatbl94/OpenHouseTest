//  ImageUtils.swift
//  Gridle
//  Created by Bhavik Bansal on 11/18/16.
//  Copyright © 2016 Bhavik Bansal. All rights reserved.

import SDWebImage
import UIKit
public class ImageUtils{
    
}

extension UIImageView{
    func loadImage(from url: String, _ completionHandler: ((SDExternalCompletionBlock) -> Void)? = nil  ){
        let image = #imageLiteral(resourceName: "home")
        self.sd_imageIndicator = SDWebImageActivityIndicator.gray
        self.sd_setImage(with: URL(string: url), placeholderImage: image, options: .allowInvalidSSLCertificates, completed: nil)
    }
    
}
