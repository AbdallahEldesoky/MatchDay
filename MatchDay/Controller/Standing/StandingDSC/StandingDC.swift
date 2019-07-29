//
//  StandingTabController.swift
//  MatchDay
//
//  Created by Abdallah on 7/9/19.
//  Copyright © 2019 Abdallah Eldesoky. All rights reserved.
//

import LBTAComponents
import SwiftyJSON
import TRON

class StandingDatasourceController: DatasourceController {
    
    var selectedLeague: League = .BL
    var leagueNavItem: String = Default.leagues[0]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBarItem()
        collectionView.backgroundColor = Default.grayBackgroundColor
        getStandingOfSelectedLeague()
    }

    
    private func getStandingOfSelectedLeague(){
        
        
        Service.sharedInstance.getStanding(leagueName: selectedLeague) { (standingDatasource, err) in
            if let error = err, let apiError = error as? APIError<Service.JsonError> {
                    if apiError.response?.statusCode != 200 {
                        print("status code not equal 200, please try again")
                    }else {
                    print("failure request try again")
                }
            } else {
                
                self.datasource = standingDatasource
            }
        }
        
    }
    
 
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        collectionViewLayout.invalidateLayout()
    }
  
 
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
         return CGSize(width: collectionView.bounds.width, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}
