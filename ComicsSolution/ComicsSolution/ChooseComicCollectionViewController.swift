//
//  ChooseComicCollectionViewController.swift
//  ComicsSolution
//
//  Created by Rodrigo Machado on 9/14/15.
//  Copyright © 2015 Rodrigo DAngelo Silva Machado. All rights reserved.
//

import UIKit



class ChooseComicCollectionViewController: UICollectionViewController
{
    //var array = [String]()
    let container = UIView()
    let redSquare = UIView()
    let blueSquare = UIView()
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
    // número de collections que serão retornadas
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return 3
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as UICollectionViewCell
        
        let buttonImage = cell.viewWithTag(1) as! UIImageView // criando uma tag para cada collection
        
        buttonImage.image = UIImage(named: "americaCapitain") // adicionando a imagem
        
        return cell
    }
    
    
}
