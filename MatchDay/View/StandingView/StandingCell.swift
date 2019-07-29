//
//  StandingCell.swift
//  MatchDay
//
//  Created by Abdallah on 7/9/19.
//  Copyright © 2019 Abdallah Eldesoky. All rights reserved.
//

import LBTAComponents
import UIKit

class StandingCell: DatasourceCell {
    
    var teamNoLabel: UILabel = {
        return Default.setupLabel(textAlignment: .center,fontSize: 16, type: TypeOfFont.system)
    }()
    
    let teamProfileImage: CachedImageView = {
        let imageView = CachedImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 5
        imageView.clipsToBounds = true
        return imageView
    }()
    
    var teamNamelabel: UILabel = {
        return Default.setupLabel(textAlignment: .center, fontSize: 14, type: TypeOfFont.system)
    }()
    
    var fixturesPlayedLabel: UILabel = {
        return Default.setupLabel(textAlignment: .center, fontSize: 14, type: .system)
    }()
    
    var goalDiffLabel: UILabel = {
        return Default.setupLabel(textAlignment: .center, fontSize: 14, type: TypeOfFont.system)
    }()
    
    var pointsLabel: UILabel = {
        return Default.setupLabel(textAlignment: .center, fontSize: 14, type: TypeOfFont.bold)
    }()
    
    override var datasourceItem: Any? {
        didSet {
            guard let standing = datasourceItem as? Standing else { return }
            configueView(standing)
        }
    }
    
    override func setupViews() {
        super.setupViews()
        
        backgroundColor = .white
        separatorLineView.isHidden = false
        separatorLineView.backgroundColor = Default.sepratorColor
        addSubviews()
    }
    
    private func addSubviews() {
        
        addSubview(teamNoLabel)
        addSubview(teamProfileImage)
        addSubview(teamNamelabel)
        addSubview(fixturesPlayedLabel)
        addSubview(goalDiffLabel)
        addSubview(pointsLabel)
        
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        setNeedsLayout()
    }
    
    override func layoutSubviews() {
        
        //        var widthForLabels = ( bounds.width - 60) / 7
        //        var widthOfTeamNameLabel = (widthForLabels * 2) + 20
        
        teamNoLabel.translatesAutoresizingMaskIntoConstraints = false
        teamProfileImage.translatesAutoresizingMaskIntoConstraints = false
        teamNamelabel.translatesAutoresizingMaskIntoConstraints = false
        fixturesPlayedLabel.translatesAutoresizingMaskIntoConstraints = false
        goalDiffLabel.translatesAutoresizingMaskIntoConstraints = false
        pointsLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            teamNamelabel.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.8),
            teamNoLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.12),
            teamNoLabel.leftAnchor.constraint(equalTo: safeLeftAnchor),
            teamNoLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            teamProfileImage.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.8),
            teamProfileImage.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.3),
            teamProfileImage.leftAnchor.constraint(equalTo: teamNoLabel.safeRightAnchor),
            teamProfileImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            teamNamelabel.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.8),
            teamNamelabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.2),
            teamNamelabel.leftAnchor.constraint(equalTo: teamProfileImage.safeRightAnchor),
            teamNamelabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            
           
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
            fixturesPlayedLabel.leftAnchor.constraint(equalTo: teamNamelabel.safeRightAnchor, constant: 10),
            fixturesPlayedLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
            
            
            ])
        
    }
    
    private func configueView (_ standing: Standing) {
        
        if let teamLogoUrl = standing.team.logoUrl {
            teamProfileImage.downloaded(from: teamLogoUrl)
        }else {
            teamProfileImage.image = Default.image
        }
        
        teamNoLabel.text = String(standing.position)
        teamNamelabel.text = standing.team.name
        fixturesPlayedLabel.text = String(standing.playedGame)
        goalDiffLabel.text = String(standing.goalDiffrence)
        pointsLabel.text = String(standing.points)
        
    }
    
    
}


