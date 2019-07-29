//
//  Service.swift
//  MatchDay
//
//  Created by Abdallah on 7/9/19.
//  Copyright © 2019 Abdallah Eldesoky. All rights reserved.
//

import UIKit
import SwiftyJSON
import TRON

struct Service {
    
    
    let tron = TRON(baseURL: URls.mainURL)
    static let sharedInstance = Service()
    static let headers = ["X-Auth-Token": Default.apiToken]
    static let statusCodeRange: Range = 200..<300
    
    func getImage(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
   
    
    func getStanding(leagueName: League, completion: @escaping (StandingDatasource?, Error?)-> Void) {
        
        let standingUrl = leagueName.getStandingUrl()
        let request: APIRequest<StandingDatasource, JsonError> = tron.swiftyJSON.request(standingUrl)
        request.method = .get
        request.headers = Service.headers
        
        request.perform(withSuccess: { (standingDatasource) in
            print("success  request!")
            completion(standingDatasource,nil)
            
        }) { (error) in
            print("failure request!")
            print(error)
            completion(nil, error)
            
        }
        
    }
    
    func getFixtures(parameters: [String: String] = Default.dailyMatchesParameters, completion: @escaping (MatchDatasorce?, Error?) -> Void  ) {
        
        let request: APIRequest<MatchDatasorce, JsonError> = tron.swiftyJSON.request(URls.dailyFixtures)
        request.headers = Service.headers
        request.parameters = parameters
        request.perform(withSuccess: { (matchDatasorce) in
            print("success  request!")
            completion(matchDatasorce,nil)
        
        }) { (error) in
            print("failure request!")
            print(error)
            completion(nil, error)
        }
        
    }
    
    class JsonError: JSONDecodable {
        required init(json: JSON) throws {
            print("error occured")
        }
    }
    
    //get today's or live's fixtures
//      func getFixtures(status: [String:String]? = nil ,completion: @escaping (_ errror: Error?, _ fixtures: [Match]?) -> Void ) {
//
//        let parameters = [ "dateFrom": "2018-01-01", "dateTo": "2018-01-10"]
//        let url = URls.dailyFixtures
//        Alamofire.request(url, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: Service.headers)
//            .validate(statusCode: Service.statusCodeRange)
//            .responseJSON { response in
//                switch response.result {
//                case .failure(let error):
//                    print("failure")
//                    completion(nil,nil)
//                case .success(let value):
//                    print("success")
//                    let resopnseJson = JSON(value)
//                    guard let fixtureArr = resopnseJson["matches"].array, let countOfFixtures = resopnseJson["count"].toInt, countOfFixtures == 0 else {
//                        completion(nil,nil)
//                        return
//                    }
//                    var fixtures = [Match]()
//                    for fixtureJson in fixtureArr {
//                        if let fixtureDict = fixtureJson.dictionary, let fixture = Match.init(dict: fixtureDict) {
//                            fixtures.append(fixture)
//                        }
//                    }
//                    completion(nil,fixtures)
//                }
//        }
//    }
//    //get details of certain Team
//     func getDetailsOfTeam(TeamID id: Int, completion: @escaping (_ error: Error?, _ Teams: Team?) -> Void) {
//
//        let url = URls.teamsURL + String(id)
//        Alamofire.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: Service.headers)
//            .validate(statusCode: Service.statusCodeRange)
//            .responseJSON { response in
//                switch response.result {
//                case .failure(let error):
//                    print("failure")
//                    completion(nil,nil)
//                case .success(let value):
//                    print("success")
//                    let responseJson = JSON(value)
//                    guard let TeamDict = responseJson.dictionary else {
//                        completion(nil, nil)
//                        return }
//                    let team = Team.init(dict: TeamDict)
//                    completion(nil,team)
//                }
//        }
//    }
//
//    //get details of player
//     func getDetailsOfPlayer(playerID id: Int, completion: @escaping (_ error: Error?, _ palyer: Member? ) -> Void ){
//
//        url = URls.playerDetails + String(id)
//        Alamofire.request(url!, method: .get, parameters: nil, encoding: URLEncoding.default, headers: headers)
//            .validate(statusCode: statusCodeRange)
//            .responseJSON { response in
//
//                switch response.result {
//                case .failure(let error):
//                    print("failure")
//                    completion(nil,nil)
//                case .success(let value):
//                    print("success")
//                    let responseJson = JSON(value)
//                    guard let PlayerDict = responseJson.dictionary else {
//                        completion(nil,nil)
//                        return
//                    }
//
//                    let player = Member.init(dict: PlayerDict)
//                    completion(nil,player)
//                }
//        }
//    }
//
//    //get all or upcoming or scheduled matches of certain team
//     func getMatchesOf(TeamId  id: Int,status: [String:String]? = nil , completion: @escaping (_ error: Error?, _ matches: [Match]?) -> Void){
//
//
//        url = URls.teamsURL + String(id) + URls.matchesDetails
//        Alamofire.request( url!, parameters: status , encoding: URLEncoding.default, headers: headers)
//            .validate(statusCode: statusCodeRange)
//            .responseJSON { response in
//
//                switch response.result {
//
//                case .failure(let error):
//
//                    print("failure")
//                    completion(nil,nil)
//
//                case .success(let value):
//
//                    print("success")
//
//                    let responseJson = JSON(value)
//                    guard let matchArr = responseJson["matches"].array else {
//                        completion(nil, nil)
//                        return
//                    }
//
//                    var matches = [Match]()
//                    for matchJson in matchArr {
//                        if let matchDict = matchJson.dictionary, let match = Match.init(dict: matchDict) {
//                            matches.append(match)
//                        }
//                    }
//                    completion(nil,matches)
//                }
//
//        }
//
//    }
    
    ///get standing of certain league
//     func getStandings(leagueStandingsURl: String, complietion: @escaping (_ error: Error?, _ Standings: [Standing]?)-> Void){
//
//
//        Alamofire.request(leagueStandingsURl, method: .get, parameters: nil, encoding: URLEncoding.default, headers: Service.headers)
//            .validate(statusCode: Service.statusCodeRange)
//            .responseJSON { response in
//
//                switch response.result {
//                case .failure(let error):
//                    print("failure")
//                    complietion(error, nil)
//
//                case .success(let value):
//                    print("success")
//                    let responseJson = JSON(value)
//                    guard let standingArr = responseJson["standings"][0]["table"].array else {
//                        let
//                        complietion(nil, nil)
//                        return
//                    }
//                    var standigs = [Standing]()
//                    for standJson in standingArr {
//                        if let standDict = standJson.dictionary, let stand = Standing.init(dict: standDict) {
//                            standigs.append(stand)
//                        }
//
//                    }
//
//                    complietion(nil, standigs)
//                }
//
//        }
//
//    }
    
//     func getScorerOf(CompetionID id: Int, completion: @escaping (_ error: Error?, _ scorers: [Scorer]? ) -> Void){
//
//        url = URls.competionURL + String(id) + URls.scorerDetails
//
//        Alamofire.request(url!, method: .get, parameters: nil, encoding: URLEncoding.default, headers: headers)
//            .validate(statusCode: statusCodeRange)
//            .responseJSON { response in
//
//                switch response.result {
//
//                case .failure(let error):
//                    print("failure")
//                    completion(nil,nil)
//
//                case .success(let value):
//                    print("success")
//
//                    let responseJson = JSON(value)
//                    guard let scorerArr = responseJson["scorers"].array else {
//                        completion(nil,nil)
//                        return
//                    }
//
//                    var scorers = [Scorer]()
//                    for scorerJson in scorerArr {
//                        if let scorerDict = scorerJson.dictionary, let scorer = Scorer.init(dict: scorerDict) {
//                            scorers.append(scorer)
//                        }
//                    }
//                    completion(nil, scorers)
//                }
//        }
//    }
    
    

    
    
}
