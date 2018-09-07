//
//  GridItem.swift
//  Practice2
//
//  Created by LTT on 9/5/18.
//  Copyright © 2018 LTT. All rights reserved.
//

import UIKit

class GridItem: UICollectionViewCell {
    
    private var _recipe: Recipe!
    @IBOutlet weak var imgRecipe: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblLikeCount: UILabel!
    @IBOutlet weak var btnLike: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBAction func btnLikePressed(_ sender: UIButton) {
        if sender.isSelected == false {
            _recipe.likeCount += 1
            _recipe.likeStatus = true
            sender.isSelected = true
            lblLikeCount.text = "\(_recipe.likeCount)"
        } else {
            _recipe.likeCount -= 1
            _recipe.likeStatus = false
            sender.isSelected = false
            lblLikeCount.text = "\(_recipe.likeCount)"
        }
    }
    
    func loadAndSetData(recipe: Recipe) {
        _recipe = recipe
        imgRecipe.image = UIImage(named: recipe.recipeImage)
        lblTitle.text = recipe.recipeTitle
        lblLikeCount.text = "\(recipe.likeCount)"
        btnLike.isSelected = recipe.likeStatus
    }
    
}
