//
//  Homes.swift
//  OpenHouseTest
//
//  Created by Bharat Lalwani on 19/03/20.
//  Copyright © 2020 Bharat Lalwani. All rights reserved.
//
import Foundation
import Alamofire

class MainViewModel {
    func getCommunitiesData(viewController : UIViewController) -> APIArrayResponse<CommunitiesDao> {
        let apiResponse = APIArrayResponse<CommunitiesDao>()
        RestClient.getCommunities().responseArray{
            (response : DataResponse<[CommunitiesDao]>) in
            switch response.result{
            case .success(let data):
                if response.response?.statusCode == 200{
                    apiResponse.value = data
                } else {
                    //Error occured
                    Utilities.showAlertDialog(viewController, Constants.AlertTitle.error, Constants.AlertMessage.somethingWrong)
                }
            case .failure(let data):
                Applog.debugDataPrint(data)
            }
        }
        return apiResponse
    }
    
    func getHomesData(viewController : UIViewController) -> APIArrayResponse<HomeDao> {
        let apiResponse = APIArrayResponse<HomeDao>()
        RestClient.getHomes().responseArray{
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
