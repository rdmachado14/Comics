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
    
    private let reuseIdentifier = "cell"
    private let sectionsInsets = UIEdgeInsets(top: 50, left: 20, bottom: 50, right: 20)

    override func viewDidLoad()
    {
        super.viewDidLoad()

        self.collectionView!.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        
    }

}
