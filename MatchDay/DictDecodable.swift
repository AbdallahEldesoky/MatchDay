//
//  JSONDecoder.swift
//  
//
//  Created by Abdallah on 7/10/19.
//

import Foundation
import SwiftyJSON

protocol DictDecodable {
     init?(dict: [String: JSON])

}
