//
//  ChooseComicCollectionViewController.swift
//  ComicsSolution
//
//  Created by Rodrigo Machado on 9/14/15.
//  Copyright © 2015 Rodrigo DAngelo Silva Machado. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class ChooseComicCollectionViewController: UICollectionViewController
{

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
