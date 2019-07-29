//
//  TodayMatchesTabController.swift
//  MatchDay
//
//  Created by Abdallah on 7/9/19.
//  Copyright © 2019 Abdallah Eldesoky. All rights reserved.
//

import LBTAComponents
import SwiftyJSON
import TRON

class TodayMatchesTabController: DatasourceController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
         collectionView.backgroundColor = Default.grayBackgroundColor
        getAllFixtures()
    }
    
    private func getAllFixtures() {
        
        Service.sharedInstance.getFixtures { (matchDatasorce, err) in
            
            if let error = err, let apiError = error as? APIError<Service.JsonError> {
                if apiError.response?.statusCode != 200 {
                    print("status code not equal 200, please try again")
                }else {
                    print("failure request try again")
                }
            
            } else {
                
                self.datasource = matchDatasorce
            }
        }
        
        
    }
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        collectionView.invalidateIntrinsicContentSize()
        
        
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height / 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}
