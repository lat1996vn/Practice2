//
//  Recipe.swift
//  Practice2
//
//  Created by LTT on 9/7/18.
//  Copyright © 2018 LTT. All rights reserved.
//

import Foundation
class Recipe {
    private var _recipeImage: String!
    private var _recipeTitle: String!
    private var _recipeDescription: String!
    private var _likeCount: Int!
    private var _likeStatus = false
    
    var recipeImage: String {
        return _recipeImage
    }
    
    var recipeTitle: String {
        get {
            return _recipeTitle
        } set {
            _recipeTitle = newValue
        }
    }
    
    var recipeDescription: String {
        get {
            return _recipeDescription
        } set {
            _recipeDescription = newValue
        }
    }
    
    var likeCount: Int {
        get {
            return _likeCount
        } set {
            _likeCount = newValue
        }
    }
    var likeStatus: Bool {
        get {
            return _likeStatus
        } set {
            _likeStatus = newValue
        }
    }
    
    
    init(recipeImage: String, recipeTitle: String, recipeDescription: String, likeCount: Int) {
        
        _recipeImage = recipeImage
        _recipeTitle = recipeTitle
        _recipeDescription = recipeDescription
        _likeCount = likeCount
    }
}

