//
//  UIImage+Extenision.swift
//  MatchDay
//
//  Created by Abdallah on 7/10/19.
//  Copyright © 2019 Abdallah Eldesoky. All rights reserved.
//

import UIKit
import SVGKit

extension UIImageView {
    
    
    func download(from url: URL, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        
        contentMode = mode
        Service.sharedInstance.getImage(from: url) { (data, response, error) in
            
            guard let httpURLResponse = response as? HTTPURLResponse,
                httpURLResponse.statusCode == 200,
                let data = data, error == nil,
             let image = UIImage(data: data) ?? SVGKImage(data: data)?.uiImage 
                else {
                    print("error")
                    return
            }
            
            DispatchQueue.main.async() {
                print("succes")
                self.image = SVGKImage(data: data)?.uiImage
                
            }
        }
        
    }
    func downloaded(from link: String, contentMode mode: UIView.ContentMode = .scaleAspectFit) {  // for swift 4.2 syntax just use ===> mode: UIView.ContentMode
        guard let url = URL(string: link) else {
            self.image = Default.image
            return }
        download(from: url, contentMode: mode)
    }
    
    
}

