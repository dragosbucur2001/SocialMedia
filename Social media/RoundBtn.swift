//
//  RoundBtn.swift
//  Social media
//
//  Created by Ionut-Daniel Ciubotariu on 30/08/2017.
//  Copyright © 2017 Bucur Dragos. All rights reserved.
//

import UIKit

class RoundBtn: UIButton {

    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.shadowColor = UIColor(red: SHADOW_GRAY, green: SHADOW_GRAY, blue: SHADOW_GRAY, alpha: 0.6).cgColor
        layer.shadowOpacity = 0.8
        layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        layer.shadowRadius = 5
        
        imageView?.contentMode = .scaleAspectFit
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layer.cornerRadius = self.frame.width / 2
    }
    
    
    
}
