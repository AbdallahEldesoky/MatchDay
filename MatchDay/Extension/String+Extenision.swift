//
//  String+Extenision.swift
//  MatchDay
//
//  Created by Abdallah on 7/10/19.
//  Copyright © 2019 Abdallah Eldesoky. All rights reserved.
//

import Foundation

extension String {
    
    var removeHttpWord: String {
        return self.replacingOccurrences(of: "http://", with: "")
    }
}
