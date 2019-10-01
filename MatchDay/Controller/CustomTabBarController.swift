//
//  CustomTabBarController.swift
//  MatchDay
//
//  Created by Abdallah on 7/8/19.
//  Copyright © 2019 Abdallah Eldesoky. All rights reserved.

import UIKit

class CustomTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let standingItem = UINavigationController(rootViewController: StandTVC())
        standingItem.title = "Standing"
        standingItem.tabBarItem.image = #imageLiteral(resourceName: "standing_icon.png").withRenderingMode(.alwaysOriginal)
        
        let todayMathesItem = UINavigationController(rootViewController: TodayMatchesTabController())
        todayMathesItem.title = "Matches"
        todayMathesItem.tabBarItem.image = #imageLiteral(resourceName: "liveMatch_icon.png").withRenderingMode(.alwaysOriginal)
        
        let HighlightItem = UINavigationController(rootViewController: HighlightTVC())
        HighlightItem.title = "Highlights"
        HighlightItem.tabBarItem.image = #imageLiteral(resourceName: "highlight_icon").withRenderingMode(.alwaysOriginal)
        
        viewControllers = [standingItem, todayMathesItem, HighlightItem]
        
    }
    
    
}
