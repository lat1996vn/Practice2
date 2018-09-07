//
//  DetailVC.swift
//  Practice2
//
//  Created by LTT on 9/7/18.
//  Copyright © 2018 LTT. All rights reserved.
//

import UIKit

class DetailVC: UIViewController {
    
    private var _recipe: Recipe!
    var recipe: Recipe {
        get {
            return _recipe
        } set {
            _recipe = newValue
        }
    }
    @IBOutlet weak var btnLike: UIButton!
    @IBOutlet weak var imgRecipe: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadAndSetData(recipe: recipe)
    }
    
//    @IBAction func btnBackPressed(_ sender: UIButton) {
//        self.dismiss(animated: true, completion: nil)
//    }
    
    @IBAction func btnLikePressed(_ sender: UIButton) {
        if sender.isSelected == false {
            _recipe.likeCount += 1
            _recipe.likeStatus = true
            sender.isSelected = true
        } else {
            _recipe.likeCount -= 1
            _recipe.likeStatus = false
            sender.isSelected = false
        }
    }
    
    func loadAndSetData(recipe: Recipe) {
        _recipe = recipe
        imgRecipe.image = UIImage(named: recipe.recipeImage)
        lblTitle.text = recipe.recipeTitle
        btnLike.isSelected = recipe.likeStatus
        lblDescription.text = recipe.recipeDescription
    }
    
}
