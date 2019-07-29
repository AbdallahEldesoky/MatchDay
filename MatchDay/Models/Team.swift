//
//  Team.swift
//  MatchDay
//
//  Created by Abdallah on 7/10/19.
//  Copyright © 2019 Abdallah Eldesoky. All rights reserved.
//

import UIKit
import SwiftyJSON

struct Team: DictDecodable {
    
    var id: Int!
    var name: String!
    var logoUrl: String?
    var shortName: String?
    var website: String?
    var founded: Int?
    var stadium: String?

    
    init?(dict: [String: JSON]){
        
        guard let id = dict["id"]?.toInt, let name = dict["name"]?.string else { return nil }
        self.id = id
        self.name = name
        logoUrl = dict["crestUrl"]?.string
        shortName = dict["shortName"]?.string
        website = dict["website"]?.string
        founded = dict["founded"]?.toInt
        stadium = dict["venue"]?.string
    }
    
 
}

