//
//  StandingHeader.swift
//  MatchDay
//
//  Created by Abdallah on 7/9/19.
//  Copyright © 2019 Abdallah Eldesoky. All rights reserved.
//

import LBTAComponents

class StandingHeaderCell: DatasourceCell {

    let teamLabel: UILabel = {
        return Default.setupLabel(text: "Team", textAlignment: .center,fontSize: 16, type: TypeOfFont.system)
    }()

    let positionLabel: UILabel = {
        return Default.setupLabel(text:"Pos", textAlignment: .center, fontSize: 14, type: TypeOfFont.system)
    }()

    let fixturesPlayedLabel: UILabel = {
        return Default.setupLabel(text: "p",textAlignment: .center, fontSize: 14, type: .system)
    }()

    let goalDiffLabel: UILabel = {
        return Default.setupLabel(text: "+/-", textAlignment: .center, fontSize: 14, type: TypeOfFont.system)
    }()

    let pointsLabel: UILabel = {
        return Default.setupLabel(text: "PTS", textAlignment: .center, fontSize: 14, type: TypeOfFont.system)
    }()


    override func setupViews() {
        super.setupViews()
        
        backgroundColor = .white
        separatorLineView.isHidden = false
        separatorLineView.backgroundColor = Default.sepratorColor
        
        addSubview(positionLabel)
        addSubview(teamLabel)
        addSubview(fixturesPlayedLabel)
        addSubview(goalDiffLabel)
        addSubview(pointsLabel)
    }
    
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        setNeedsLayout()
    }
   
  
    override func layoutSubviews() {
    
        
        positionLabel.translatesAutoresizingMaskIntoConstraints = false
        teamLabel.translatesAutoresizingMaskIntoConstraints = false
        fixturesPlayedLabel.translatesAutoresizingMaskIntoConstraints = false
        goalDiffLabel.translatesAutoresizingMaskIntoConstraints = false
        pointsLabel.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            
            positionLabel.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.8),
            positionLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.12),
            positionLabel.leftAnchor.constraint(equalTo: safeLeftAnchor),
            positionLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            teamLabel.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.8),
            teamLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5),
            teamLabel.leftAnchor.constraint(equalTo: positionLabel.safeRightAnchor),
            teamLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            pointsLabel.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.8),
            pointsLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.09),
            pointsLabel.rightAnchor.constraint(equalTo: safeRightAnchor),
            pointsLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            goalDiffLabel.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.8),
            goalDiffLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.09),
            goalDiffLabel.rightAnchor.constraint(equalTo: pointsLabel.safeLeftAnchor),
            goalDiffLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            fixturesPlayedLabel.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.8),
            fixturesPlayedLabel.rightAnchor.constraint(equalTo: goalDiffLabel.safeLeftAnchor),
            fixturesPlayedLabel.leftAnchor.constraint(equalTo: teamLabel.safeRightAnchor, constant: 10),
            fixturesPlayedLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
            
            ])

    }
    
}
