
//  OpenHouseTest
//
//  Created by Bharat Lalwani on 19/03/20.
//  Copyright © 2020 Bharat Lalwani. All rights reserved.

import UIKit
import Alamofire

class CommunityTableViewCell: UITableViewCell{
    @IBOutlet weak var imgCommunity: UIImageView!
    @IBOutlet weak var lblCommunityTitle: UILabel!
    @IBOutlet weak var lblHomeAvgPrice: UILabel!
    @IBOutlet weak var lblCommunityGroupName: UILabel!
}


class MainViewController : BaseViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var communityTblView: UITableView!
    var viewModel: MainViewModel!
    var communitiesList : [CommunitiesDao]?
    var homeList : [HomeDao]?
    var communityDictionary = [String : CommunitiesDao]()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.navigationController?.navigationBar.isHidden = true
        self.navigationController?.isNavigationBarHidden = true
        viewModel = MainViewModel()
        communityTblView.delegate = self
        communityTblView.dataSource = self
        if Utilities.isInternetConnected(viewController: self){
            getCommunities()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    private func getCommunities(){
        showProgress()
        viewModel.getCommunitiesData(viewController: self).observe { response in
            guard let communityList = response else {return}
            self.communitiesList = response ??  []
            self.communitiesList = self.communitiesList?.sorted(by: { $0.name?.localizedStandardCompare($1.name!) == ComparisonResult.orderedAscending})
            for community in communityList{
                self.communityDictionary.updateValue(community, forKey: community.id ?? "")
            }
            self.viewModel.getHomesData(viewController: self).observe {
                responseHomes in
                guard let homeListData = responseHomes else {return}
                self.homeList = responseHomes
                self.hideProgress()
                for homeDao in homeListData{
                    if let community = self.communityDictionary[homeDao.communityId ?? ""] {
                        community.homesCount += 1
                        community.totalHomePrice += homeDao.price ?? 0.0
                    }
                }
                for community in communityList{
                    if community.homesCount != 0{
                        community.avgPrice = (Int(community.totalHomePrice) / community.homesCount)
                    }
                }
                self.communityTblView.reloadData()
            }
        }
    }
    
    //#MARK: TableView delegates
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let index = indexPath.row
        let communityData = self.communitiesList?[index]
        let cell = tableView.dequeueReusableCell(withIdentifier: CommunityTableViewCell.className, for: indexPath) as! CommunityTableViewCell
        cell.imgCommunity.loadImage(from: communityData?.imgUrl ?? "")
        cell.lblCommunityTitle.text = communityData?.name
        cell.lblCommunityGroupName.text = communityData?.group
        cell.lblHomeAvgPrice.text = "Avg price:-  \(communityData?.avgPrice ?? Int(0.0))"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let index = indexPath.row
//        let communityData = self.communitiesList?[index]
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.communitiesList?.count ?? 0
    }
}

