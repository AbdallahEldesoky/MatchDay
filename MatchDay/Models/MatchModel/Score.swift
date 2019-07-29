//
//  Score.swift
//  MatchDay
//
//  Created by Abdallah on 7/10/19.
//  Copyright © 2019 Abdallah Eldesoky. All rights reserved.
//


import Foundation
import SwiftyJSON

struct Score: DictDecodable {
    
    var winner: String?
    var duration: String
    var fullTime: ResultOFSection
    var halfTime: ResultOFSection
    var extraTime: ResultOFSection
    var penalties: ResultOFSection
    
    init?(dict: [String: JSON]) {
        guard let duration = dict["duration"]?.string, let fullTimeDict = dict["fullTime"]?.dictionary, let halfTimeDict = dict["halfTime"]?.dictionary, let extraTimeDict = dict["extraTime"]?.dictionary, let penaltiesDict = dict["penalties"]?.dictionary else { return nil}
        
        winner = dict["winner"]?.string
        self.duration = duration
        fullTime = ResultOFSection.init(dict: fullTimeDict)
        halfTime = ResultOFSection.init(dict: halfTimeDict)
        extraTime = ResultOFSection.init(dict: extraTimeDict)
        self.penalties = ResultOFSection.init(dict: penaltiesDict)
    }
}

