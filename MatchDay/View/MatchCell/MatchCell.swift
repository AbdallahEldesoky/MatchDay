//
//  MatchCell.swift
//  MatchDay
//
//  Created by Abdallah on 7/11/19.
//  Copyright © 2019 Abdallah Eldesoky. All rights reserved.
//

import LBTAComponents


class MatchCell: DatasourceCell {
    
    
    let homeTeamName: UILabel = { return Default.setupLabel(textAlignment: .center, fontSize: 16, type: .system)} ()
    let homeTeamScore: UILabel = { return Default.setupLabel(textAlignment: .center, fontSize: 16, type: .system)} ()
    let dashLabel: UILabel = { Default.setupLabel(text: "-", textAlignment: .center, fontSize: 16, type: .bold) } ()
    let awayTeamName: UILabel = { return Default.setupLabel(textAlignment: .center, fontSize: 16, type: .system)} ()
    let awayTeamScore: UILabel = { return Default.setupLabel(textAlignment: .center, fontSize: 16, type: .system)} ()
    let leftSpace = UIView()
    let rightSpace = UIView()
    
    override var datasourceItem: Any? {
        didSet {
            guard let match = datasourceItem as? Match else { return }
            configureLabels(match)
        }
    }
    
    override func setupViews() {
        super.setupViews()
        
        backgroundColor = .white
        separatorLineView.isHidden = false
        separatorLineView.backgroundColor = Default.sepratorColor
        
        //
        //        leftSpace.backgroundColor = .red
        //        rightSpace.backgroundColor = .yellow
        
        addSubviews()
    }
    
    private func addSubviews() {
        
        addSubview(leftSpace)
        addSubview(homeTeamName)
        addSubview(homeTeamScore)
        addSubview(dashLabel)
        addSubview(awayTeamScore)
        addSubview(awayTeamName)
        addSubview(rightSpace)
        
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        setNeedsLayout()
    }
    
    override func layoutSubviews() {
        
        leftSpace.translatesAutoresizingMaskIntoConstraints = false
        rightSpace.translatesAutoresizingMaskIntoConstraints = false
        homeTeamName.translatesAutoresizingMaskIntoConstraints = false
        homeTeamScore.translatesAutoresizingMaskIntoConstraints = false
        dashLabel.translatesAutoresizingMaskIntoConstraints = false
        awayTeamScore.translatesAutoresizingMaskIntoConstraints = false
        awayTeamName.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            leftSpace.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.8),
            leftSpace.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.05),
            leftSpace.leftAnchor.constraint(equalTo: safeLeftAnchor),
            leftSpace.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            homeTeamName.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.8),
            homeTeamName.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.3),
            homeTeamName.leftAnchor.constraint(equalTo: leftSpace.safeRightAnchor),
            homeTeamName.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            homeTeamScore.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.8),
            homeTeamScore.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.1),
            homeTeamScore.leftAnchor.constraint(equalTo: homeTeamName.safeRightAnchor),
            homeTeamScore.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            dashLabel.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.8),
            dashLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.05),
            // dashLabel.leftAnchor.constraint(equalTo: homeTeamScore.safeRightAnchor),
            dashLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            dashLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            rightSpace.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.8),
            rightSpace.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.05),
            rightSpace.rightAnchor.constraint(equalTo: safeRightAnchor),
            rightSpace.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            awayTeamName.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.8),
            awayTeamName.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.3),
            awayTeamName.rightAnchor.constraint(equalTo: rightSpace.leftAnchor),
            awayTeamName.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            awayTeamScore.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.8),
            awayTeamScore.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.1),
            awayTeamScore.rightAnchor.constraint(equalTo: awayTeamName.leftAnchor),
            awayTeamScore.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            
            ])
        //
        //        let spacingFromEdges = ( bounds.width - 24) / 9.5
        //        let teamNameWidth = spacingFromEdges * 3
        //        let scoreAndDashWidth = spacingFromEdges / 2
        //
        //
        //        homeTeamName.anchor(topAnchor, left: leftAnchor, bottom: bottomAnchor, right: nil, topConstant: 4, leftConstant: spacingFromEdges, bottomConstant: 4, rightConstant: 0, widthConstant: teamNameWidth, heightConstant: 20)
        //
        //        homeTeamScore.anchor(topAnchor, left: homeTeamName.rightAnchor, bottom: bottomAnchor, right: nil, topConstant: 4, leftConstant: 8, bottomConstant: 4, rightConstant: 0, widthConstant: scoreAndDashWidth, heightConstant: 20)
        //
        //        dashLabel.anchor(topAnchor, left: homeTeamScore.rightAnchor, bottom: bottomAnchor, right: nil, topConstant: 4, leftConstant: 8, bottomConstant: 4, rightConstant: 0, widthConstant: scoreAndDashWidth, heightConstant: 20)
        //
        //        awayTeamScore.anchor(topAnchor, left: dashLabel.rightAnchor, bottom: bottomAnchor, right: nil, topConstant: 4, leftConstant: 8, bottomConstant: 4, rightConstant: 0, widthConstant: scoreAndDashWidth, heightConstant: 20)
        //
        //        awayTeamName.anchor(topAnchor, left: awayTeamScore.rightAnchor, bottom: bottomAnchor, right: nil, topConstant: 4, leftConstant: 8, bottomConstant: 4, rightConstant: spacingFromEdges, widthConstant: teamNameWidth, heightConstant: 0)
        //
        
    }
    
    
    private func configureLabels(_ match: Match) {
        
        if let homeScore = match.score.fullTime.homeTeam, let awayScore =  match.score.fullTime.awayTeam {
            
            homeTeamScore.text = String(homeScore)
            awayTeamScore.text = String(awayScore)
        }
        
        homeTeamName.text = match.homeTeam.name
        awayTeamName.text = match.awayTeam.name
        
        
    }
    
    
}




