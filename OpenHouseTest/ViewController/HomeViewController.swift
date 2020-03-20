//
//  HomeViewController.swift
//  OpenHouseTest
//
//  Created by Bharat Lalwani on 19/03/20.
//  Copyright © 2020 Bharat Lalwani. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController {

    var community : CommunitiesDao?
    
    class func loadView() -> HomeViewController{
         let controller = AppDelegate.instance.mainStoryboard.instantiateViewController(withIdentifier: HomeViewController.className) as! HomeViewController
         return controller
     }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
