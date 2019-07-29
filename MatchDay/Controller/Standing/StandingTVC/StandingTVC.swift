//
//  LeagueTVC.swift
//  MatchDay
//
//  Created by Abdallah on 7/10/19.
//  Copyright © 2019 Abdallah Eldesoky. All rights reserved.
//

import UIKit

class StandTVC: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    
    private let leagueCell = "leagueCell"
    private let leagues: [String] = Default.leagues
    private var leagueTV: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let barHeight: CGFloat = UIApplication.shared.statusBarFrame.size.height
        let displayWidth: CGFloat = self.view.frame.width
        let displayHeight: CGFloat = self.view.frame.height
        
        leagueTV = UITableView(frame: CGRect(x: 0, y: barHeight, width: displayWidth, height: displayHeight - barHeight))
        leagueTV.register(UITableViewCell.self, forCellReuseIdentifier: leagueCell)
        leagueTV.dataSource = self
        leagueTV.delegate = self
        setupNavBarItem()
        self.view.addSubview(leagueTV)
        
    
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return leagues.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: leagueCell, for: indexPath as IndexPath )
        cell.textLabel?.text = leagues[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        let selectedLeague = leagues[indexPath.row]
        let standController = StandingDatasourceController()
        standController.selectedLeague = League.choseLeageu(selectedLeague)
        standController.leagueNavItem = selectedLeague
        navigationController?.pushViewController(standController, animated: true)

        
    }
    
}
