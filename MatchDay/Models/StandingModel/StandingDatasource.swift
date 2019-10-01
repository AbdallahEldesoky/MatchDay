//
//  StandingDatasource.swift
//  MatchDay
//
//  Created by Abdallah on 7/9/19.
//  Copyright © 2019 Abdallah Eldesoky. All rights reserved.
//

import LBTAComponents
import TRON
import SwiftyJSON


class StandingDatasource: Datasource, JSONDecodable {
    
    var standigns: [Standing?]
    
    required init(json: JSON) throws {
        
        var tabel: [Standing?]
        guard let standingArr = json["standings"][0]["table"].array else {
            throw NSError(domain: URls.mainURL, code: 1, userInfo: [NSLocalizedDescriptionKey:
                "parsing json not invald"
                ])
        }
        
        tabel = standingArr.map({ (stand) -> Standing? in
            if let newStand = stand.dictionary {
                return Standing.init(dict: newStand)
            }
            return nil
        })
        
        /*var standigs = [Standing]()
         for standJson in standingArr {
         if let standDict = standJson.dictionary, let stand = Standing.init(dict: standDict) {
         standigs.append(stand)
         }*/
        
        //do something to tabel or standing
        // tabel = try tabels["tabel"]?.decode()
        
        
        
        self.standigns = tabel
        //do something to tabel or standing
        
        //self.standigns = try tabel.decode()
    }
    
    
    override func numberOfItems(_ section: Int) -> Int {
        
        return standigns.count
        
    }
    
    override func item(_ indexPath: IndexPath) -> Any? {
        
        return standigns[indexPath.item]
    }
    
    override func cellClasses() -> [DatasourceCell.Type] {
        return [StandingCell.self]
    }
    
    override func headerClasses() -> [DatasourceCell.Type]? {
        return [StandingHeaderCell.self]
    }
    
}
