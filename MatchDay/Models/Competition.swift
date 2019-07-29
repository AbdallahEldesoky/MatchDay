//
//  Competition.swift
//  MatchDay
//
//  Created by Abdallah on 5/26/19.
//  Copyright © 2019 Abdallah Eldesoky. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Competition: DictDecodable{
    var id: Int
    var name: String
    
    init?(dict: [String: JSON]) {
       
        guard let id = dict["id"]?.toInt, let name = dict["name"]?.string else { return nil}
        self.id = id
        self.name = name
    }
}
