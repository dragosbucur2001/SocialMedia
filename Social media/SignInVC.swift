//
//  ViewController.swift
//  Social media
//
//  Created by Ionut-Daniel Ciubotariu on 30/08/2017.
//  Copyright © 2017 Bucur Dragos. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import FBSDKCoreKit
import Firebase
import SwiftKeychainWrapper

class SignInVC: UIViewController {

    
    
    @IBOutlet weak var passwordField: TextFieldWitUsualEffects!
    @IBOutlet weak var emailField: TextFieldWitUsualEffects!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        if let _ = KeychainWrapper.standard.string(forKey: KEY_UID) {
            performSegue(withIdentifier: "goToFeed", sender: nil)
        }
        
    }

    @IBAction func facebookBtnPressed(_ sender: Any) {
        
        let facebookLogin = FBSDKLoginManager()
        facebookLogin.logIn(withReadPermissions: ["email"], from: self) { (result, error) in
            if error != nil {
                print("JESS: Unable to authenticate with Facebook - \(String(describing: error))")
            } else if result?.isCancelled == true {
                print("JESS: User cancelled user authentification")
            } else {
                print ("JESS: Succesfully authentificated with Facebook")
                let credential = FacebookAuthProvider.credential(withAccessToken: FBSDKAccessToken.current().tokenString)
                self.firebaseAuth(credential)
            }
        }
    }
    
    func firebaseAuth(_ credential: AuthCredential) {
        Auth.auth().signIn(with: credential) { (user, error) in
            if error != nil {
                print("JESS: Unable to authentificate with Firbase - \(String(describing: error))")
            } else {
                print("JESS: Successfully authentificated with Firebase")
                
                if let user = user {
                    let userData = ["provider": credential.provider]
                    self.completeSignIn(id: user.uid, userData: userData)
                }
            }
        }
    }

    @IBAction func signInBtnPressed(_ sender: Any) {
        
        if let email = emailField.text, let password = passwordField.text {
            Auth.auth().signIn(withEmail: email, password: password, completion: { (user, error) in
                if error == nil {
                    print("JESS: Email user authentificated with Firebase")
                    if let user = user {
                        let userData = ["provider": user.providerID]
                        self.completeSignIn(id: user.uid, userData: userData)
                    }
                } else {
                    Auth.auth().createUser(withEmail: email, password: password, completion: { (user, error) in
                        if error != nil {
                            print("JESS: Unable to authentificate with Firebase using email")
                        } else {
                            print("JESS: Succesfully authentificated with Firebase using email")
                            if let user = user {
                                
                                let userData = ["provider": user.providerID]
                                self.completeSignIn(id: user.uid, userData: userData)
                            }
                        }
                    })
                }
            })
        }
        
    }

    
    func completeSignIn(id: String, userData: Dictionary<String, String> ) {
        DataService.ds.createFireDBUser(uid: id, userData: userData)
        let keychainResult = KeychainWrapper.standard.set(id, forKey: KEY_UID)
        performSegue(withIdentifier: "goToFeed", sender: nil)
        print("JESS: Data saved to keychain \(keychainResult)")
    }
    
}

