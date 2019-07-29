//
//  ResultOfSection.swift
//  MatchDay
//
//  Created by Abdallah on 7/10/19.
//  Copyright © 2019 Abdallah Eldesoky. All rights reserved.
//

import Foundation
import SwiftyJSON

struct ResultOFSection: DictDecodable {
    var homeTeam: Int?
    var awayTeam: Int?
    
    init(dict: [String: JSON]) {
        
        homeTeam = dict["homeTeam"]?.toInt
        awayTeam = dict["awayTeam"]?.toInt
        
    }
}
