//
//  FeedVC.swift
//  Social media
//
//  Created by Ionut-Daniel Ciubotariu on 31/08/2017.
//  Copyright © 2017 Bucur Dragos. All rights reserved.
//

import UIKit
import Firebase
import SwiftKeychainWrapper

class FeedVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func signOutBtnPressed(_ sender: Any) {
        
        let keychainResult = KeychainWrapper.standard.removeObject(forKey: KEY_UID)
        try! Auth.auth().signOut()
        
        dismiss(animated: true, completion: nil)
    }

}
