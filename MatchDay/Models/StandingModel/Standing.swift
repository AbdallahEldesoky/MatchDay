//
//  StandingsModel.swift
//  MatchDay
//
//  Created by Abdallah on 5/20/19.
//  Copyright © 2019 Abdallah Eldesoky. All rights reserved.
//

import UIKit
import SwiftyJSON

struct Standing: DictDecodable {
   
    var team: Team
    var position: Int
    var playedGame: Int
    var won: Int
    var draw: Int
    var lost: Int
    var points: Int
    var goalsFor: Int
    var goalsAgainst: Int
    var goalDiffrence: Int
    
    init?(dict: [String: JSON]) {

        
        guard let teamDict = dict["team"]?.dictionary,let team = Team.init(dict: teamDict), let position = dict["position"]?.toInt, let playedGame = dict["playedGames"]?.toInt, let won = dict["won"]?.toInt, let draw = dict["draw"]?.toInt, let lost = dict["lost"]?.toInt, let points = dict["points"]?.toInt, let goalsFor = dict["goalsFor"]?.toInt, let goalsAgainst = dict["goalsAgainst"]?.toInt, let goalDiffrence = dict["goalDifference"]?.toInt else { return nil }

        self.team = team
        self.position = position
        self.playedGame = playedGame
        self.won = won
        self.draw = draw
        self.lost = lost
        self.points = points
        self.goalsFor = goalsFor
        self.goalsAgainst = goalsAgainst
        self.goalDiffrence = goalDiffrence
    }
    
}

