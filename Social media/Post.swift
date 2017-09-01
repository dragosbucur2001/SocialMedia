//
//  Post.swift
//  Social media
//
//  Created by Ionut-Daniel Ciubotariu on 01/09/2017.
//  Copyright © 2017 Bucur Dragos. All rights reserved.
//

import Foundation

class Post {
    private var _caption: String!
    private var _imageUrl: String!
    private var _like: Int!
    private var _postKey: String!
    
    var caption: String {
        return _caption
    }
    
    var imageUrl: String {
        return _imageUrl
    }
    
    var like: Int {
        return _like
    }
    
    var postKey: String {
        return _postKey
    }
    
    init(caption: String, imageUrl: String, like: Int, postKey: String) {
        self._caption = caption
        self._imageUrl = imageUrl
        self._like = like
        self._postKey = postKey
    }
    
    init(postKey: String, postData: Dictionary<String, Any>) {
        self._postKey = postKey
        
        if let caption = postData["caption"] as? String {
            self._caption = caption
        }
        
        if let like = postData["likes"] as? Int{
            self._like = like
        }
        
        if let imageUrl = postData["imageUrl"] as? String {
            self._imageUrl = imageUrl
        }
    }
}
