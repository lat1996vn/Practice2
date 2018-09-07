//
//  ViewController.swift
//  Practice2
//
//  Created by LTT on 9/5/18.
//  Copyright © 2018 LTT. All rights reserved.
//

import UIKit

class MainVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var btnListView: UIButton!
    @IBOutlet weak var btnGridView: UIButton!
    var recipes: [Recipe] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadData()
        btnListView.isSelected = true
        collectionView.showsVerticalScrollIndicator = false
        collectionView.register(UINib(nibName: "ListItem", bundle: nil), forCellWithReuseIdentifier: "ListItem")
        collectionView.register(UINib(nibName: "GridItem", bundle: nil), forCellWithReuseIdentifier: "GridItem")
        // Do any additional setup after loading the view, typically from a nib.
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return recipes.count
    }
    func collectionView(_ collectionView: UICollectionView,		 cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if btnListView.isSelected {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ListItem", for: indexPath) as! ListItem
            cell.loadAndSetData(recipe: recipes[indexPath.row])
            return cell
        }
        else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GridItem", for: indexPath) as! GridItem
            cell.loadAndSetData(recipe: recipes[indexPath.row])
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if btnListView.isSelected {
            return CGSize(width: collectionView.frame.width, height: collectionView.frame.width/335*169)
        }
        else {
            return CGSize(width: 150, height: 160)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "MainToDetail", sender: recipes[indexPath.row])
    }
    
    @IBAction func btnListViewPressed(_ sender: UIButton) {
        if !btnListView.isSelected {
            btnListView.isSelected = true
            btnGridView.isSelected = false
            collectionView.reloadData()
        }
    }
    
    @IBAction func btnGridViewPressed(_ sender: UIButton) {
        if !btnGridView.isSelected {
            btnGridView.isSelected = true
            btnListView.isSelected = false
            collectionView.reloadData()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "MainToDetail" {
            if let destination = segue.destination as? DetailVC{
                if let recipe = sender as? Recipe {
                    destination.recipe = recipe
                }
            }
        }
    }
    
    @IBAction func unwindToMainVC(_ sender: UIStoryboardSegue) {
        // Use data from the view controller which initiated the unwind segue
        if sender.identifier == "DetailToMain" {
            collectionView.reloadData()
        }
    }
    
    func loadData() {
        if recipes.isEmpty {
            let r1 = Recipe(recipeImage: "Image1", recipeTitle: "Matcha Raspberry Macarons", recipeDescription: "Classic French macarons are given a modern twist with the addition of matcha.  Matcha (green tea) ganache and sweet raspberry fill the centers of these delicate pastries.", likeCount: 216)
            let r2 = Recipe(recipeImage: "Image2", recipeTitle: "Baileys Tiramisu", recipeDescription: "Classic French macarons are given a modern twist with the addition of matcha.  Matcha (green tea) ganache and sweet raspberry fill the centers of these delicate pastries.", likeCount: 324)
            let r3 = Recipe(recipeImage: "Image3", recipeTitle: "Cupcakes with Cream and Berries", recipeDescription: "Classic French macarons are given a modern twist with the addition of matcha.  Matcha (green tea) ganache and sweet raspberry fill the centers of these delicate pastries.", likeCount: 193)
            let r4 = Recipe(recipeImage: "Image4", recipeTitle: "Pistachio Macarons", recipeDescription: "Classic French macarons are given a modern twist with the addition of matcha.  Matcha (green tea) ganache and sweet raspberry fill the centers of these delicate pastries.", likeCount: 247)
            recipes.append(r1)
            recipes.append(r2)
            recipes.append(r3)
            recipes.append(r4)
        }
    }
    
}

