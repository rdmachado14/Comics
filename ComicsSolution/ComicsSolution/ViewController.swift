//
//  ViewController.swift
//  ComicsSolution
//
//  Created by Rodrigo Machado on 9/8/15.
//  Copyright © 2015 Rodrigo DAngelo Silva Machado. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{

    @IBOutlet weak var comicImage: UIImageView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        loadImage()
        
        
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
    func loadImage()
    {
        comicImage.image = UIImage(named: "s005") // carregar imagem na tela
    }


}

