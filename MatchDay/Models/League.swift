//
//  League.swift
//  MatchDay
//
//  Created by Abdallah on 7/10/19.
//  Copyright © 2019 Abdallah Eldesoky. All rights reserved.
//

import Foundation

enum League {
    
    case PL
    case LL
    case SA
    case BL
    
    static func choseLeageu(_ string: String) -> League {
        
        switch string {
        case "Serie A":
            return .SA
        case "Bundesliga":
            return .BL
        case "La Liga":
            return .LL
        default:
            return .PL
        }
        
    }
     func getStandingUrl () -> String {
        switch self {
        case .LL:
            return URls.LALigaStandings
        case .SA:
            return URls.SAStandings
        case .BL:
            return URls.BLStandings
        default:
            return URls.PLStandings
        }
    }
}
