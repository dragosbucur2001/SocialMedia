//
//  SignInBtn.swift
//  Social media
//
//  Created by Ionut-Daniel Ciubotariu on 30/08/2017.
//  Copyright © 2017 Bucur Dragos. All rights reserved.
//

import UIKit

class SignInBtn: UIButton {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.shadowColor = UIColor(red: SHADOW_GRAY, green: SHADOW_GRAY, blue: SHADOW_GRAY, alpha: 0.6).cgColor
        layer.shadowOpacity = 0.8
        layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        layer.shadowRadius = 5
        layer.cornerRadius = 5.0

    }
    
}
