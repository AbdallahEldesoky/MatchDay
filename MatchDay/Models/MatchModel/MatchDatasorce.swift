//
//  MatchDatasorce.swift
//  MatchDay
//
//  Created by Abdallah on 7/11/19.
//  Copyright © 2019 Abdallah Eldesoky. All rights reserved.
//

import LBTAComponents
import TRON
import SwiftyJSON


class MatchDatasorce: Datasource, JSONDecodable {
  
    var matches: [Match?]
    
    required init(json: JSON) throws {
        var fixtures: [Match?]
        guard let matchArr = json ["matches"].array else {
            throw NSError(domain: URls.mainURL, code: 1, userInfo: [NSLocalizedDescriptionKey:
                "parsing json not invald"
                ])
        }
        
        fixtures = matchArr.map({ (fixture) -> Match? in
           
            if let fixtureDict = fixture.dictionary {
                return Match.init(dict: fixtureDict)
            }
            return nil
            
            
        })
        
        
        self.matches = fixtures
        
    }

    override func numberOfItems(_ section: Int) -> Int {
        return matches.count
    }
    
    override func numberOfSections() -> Int {
        return 2
    }
    override func item(_ indexPath: IndexPath) -> Any? {
        return matches[indexPath.item]
    }
    
    override func cellClasses() -> [DatasourceCell.Type] {
        return [MatchCell.self]
    }

    
}
