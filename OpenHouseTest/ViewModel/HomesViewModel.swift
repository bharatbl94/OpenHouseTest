//
//  HomesViewModel.swift
//  OpenHouseTest
//
//  Created by Bharat Lalwani on 19/03/20.
//  Copyright © 2020 Bharat Lalwani. All rights reserved.
//

import Foundation
import Alamofire
import UIKit

class HomesViewModel {
    func getHomesData(viewController : UIViewController) -> APIArrayResponse<HomeDao> {
        let apiResponse = APIArrayResponse<HomeDao>()
        RestClient.getCommunities().responseArray{
            (response : DataResponse<[HomeDao]>) in
            switch response.result{
            case .success(let data):
                if response.response?.statusCode == 200{
                    apiResponse.value = data
                } else {
                    //Error occured
                    Utilities.showAlertDialog(viewController, Constants.AlertTitle.error, Constants.AlertMessage.somethingWrong)
                    Applog.debugDataPrint(data)
                }
            case .failure(let data):
                 Utilities.showAlertDialog(viewController, Constants.AlertTitle.error, Constants.AlertMessage.somethingWrong)
                 Applog.debugDataPrint(data)
            }
        }
        return apiResponse
    }
}
