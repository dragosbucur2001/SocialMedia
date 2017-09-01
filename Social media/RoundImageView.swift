//
//  RoundImageView.swift
//  Social media
//
//  Created by Ionut-Daniel Ciubotariu on 31/08/2017.
//  Copyright © 2017 Bucur Dragos. All rights reserved.
//

import UIKit

class RoundImageView: UIImageView {


    override func layoutSubviews() {        
        layer.cornerRadius = self.frame.width / 2
    }
    
}
