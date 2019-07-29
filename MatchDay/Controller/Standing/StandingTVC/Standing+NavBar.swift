//
//  Standing+NavBar.swift
//  MatchDay
//
//  Created by Abdallah on 7/11/19.
//  Copyright © 2019 Abdallah Eldesoky. All rights reserved.
//

import UIKit

extension StandTVC {
    
    func setupNavBarItem() {
        
        
        navigationController?.navigationBar.backgroundColor = .white
        navigationController?.navigationBar.isTranslucent = false

        let leagueLabel = Default.setupLabel(text: "League", textAlignment: .center, fontSize: 16, type: .bold)
        leagueLabel.frame = CGRect(x: 0, y: 0, width: 24, height: 24)
        navigationItem.titleView = leagueLabel
        
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        
        view.addSubview(Default.navBarSepratorLine)
        Default.navBarSepratorLine.anchor(view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0.5)
        
    }
}
