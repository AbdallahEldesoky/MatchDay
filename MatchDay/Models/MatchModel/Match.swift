//
//  Match.swift
//  MatchDay
//
//  Created by Abdallah on 7/10/19.
//  Copyright © 2019 Abdallah Eldesoky. All rights reserved.
//


import Foundation
import SwiftyJSON

struct Match: DictDecodable {
    
    var id: Int
    var competition: Competition
    var status: String
    var score: Score
    var homeTeam: Team
    var awayTeam: Team
    
    init?(dict: [String: JSON]){
        guard let id = dict["id"]?.toInt, let competitionDict = dict["competition"]?.dictionary, let status = dict["status"]?.string, let scoreDict = dict["score"]?.dictionary, let homeTeamDict = dict["homeTeam"]?.dictionary, let awayTeamDict = dict["awayTeam"]?.dictionary, let homeTeam = Team.init(dict: homeTeamDict), let awayTeam = Team.init(dict: awayTeamDict), let competition = Competition.init(dict: competitionDict) ,let score = Score.init(dict: scoreDict) else {
            return nil}
        
        self.id = id
        self.competition = competition
        self.score = score
        self.status = status
        self.homeTeam = homeTeam
        self.awayTeam = awayTeam
        
        
    }
}
