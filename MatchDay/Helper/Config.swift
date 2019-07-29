//
//  Config.swift
//  MatchDay
//
//  Created by Abdallah on 7/9/19.
//  Copyright © 2019 Abdallah Eldesoky. All rights reserved.
//

import UIKit


struct URls {
    
    static let mainURL = "https://api.football-data.org/v2/"
    static let dailyFixtures = "matches"
    static let competionURL = mainURL + "competitions/"
    static let PLStandings = competionURL+"PL/standings"
    static let BLStandings = competionURL + "BL1/standings"
    static let SAStandings = competionURL + "SA/standings"
    static let LALigaStandings = competionURL + ""
    static let playerDetails = mainURL + "players/"
    static let teamsURL = mainURL + "teams/"
    static let matchesDetails = "/matches"
    static let scorerDetails = "/scorers"
}

struct Default {

    
    static let image: UIImage = #imageLiteral(resourceName: "defaultImage_icon")
   
    static let grayBackgroundColor =  UIColor(r: 230, g: 236, b: 241)
    static let sepratorColor = UIColor(r: 230, g: 230, b: 230)
    
    static let apiToken = "e350632246834fd5adbfdb21e8d16ee1"
    static let leagues = ["Premier League", "Serie A", "Bundesliga", "La Liga"]
    static let dailyMatchesParameters = [ "dateFrom": "2018-01-01", "dateTo": "2018-01-10", "status": "FINISHED"]
    
    static let navBarSepratorLine: UIView = {
        let view = UIView()
        view.backgroundColor = Default.sepratorColor
        return view
    }()
    
    
    static func setupLabel(text: String = "", textAlignment: NSTextAlignment = .left , color: UIColor = .clear , fontSize: CGFloat, type: TypeOfFont) -> UILabel{
        let font: UIFont
        switch type {
        case .bold:
            font = UIFont.boldSystemFont(ofSize: fontSize)
        default:
            font = UIFont.systemFont(ofSize: fontSize)
        }
        let label = UILabel()
        label.font = font
        label.text = text
        label.textAlignment = textAlignment
        label.numberOfLines = 0
        label.backgroundColor = color
        return label
    }
    
    
}
