//
//  ViewController.swift
//  ComicsSolution
//
//  Created by Rodrigo Machado on 9/8/15.
//  Copyright © 2015 Rodrigo DAngelo Silva Machado. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController
{

    @IBOutlet weak var comicImage: UIImageView!
    var audioPlayer = AVAudioPlayer()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        loadImage()
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: "respondToSwipeGesture:")
        swipeRight.direction = UISwipeGestureRecognizerDirection.Right
        self.view!.addGestureRecognizer(swipeRight)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: "respondToSwipeGesture:")
        swipeLeft.direction = UISwipeGestureRecognizerDirection.Left
        self.view!.addGestureRecognizer(swipeLeft)
        
        let swipeUp = UISwipeGestureRecognizer(target: self, action: "respondToSwipeGesture:")
        swipeUp.direction = UISwipeGestureRecognizerDirection.Up
        self.view!.addGestureRecognizer(swipeUp)
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: "respondToSwipeGesture:")
        swipeDown.direction = UISwipeGestureRecognizerDirection.Down
        self.view!.addGestureRecognizer(swipeDown)
        
        let swipeHorario=UIRotationGestureRecognizer(target: self, action: "respondToSwipeGesture:")
        self.view!.addGestureRecognizer(swipeHorario)
        
        
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
    func loadImage()
    {
        comicImage.image = UIImage(named: "s005") // carregar imagem na tela
    }
    
    
    
    func respondToSwipeGesture(gesture: UIGestureRecognizer){
        if let swipeGesture = gesture as? UISwipeGestureRecognizer{
            switch swipeGesture.direction{
            case UISwipeGestureRecognizerDirection.Right:
                print("right")
                audioPlayer = setupAudioPlayerWithFile("Pagina 1", type: "mp3")
                audioPlayer.play()
                comicImage.image = UIImage(named: "s006")
                return
                
            case UISwipeGestureRecognizerDirection.Left:
                
                print("left")
                audioPlayer = setupAudioPlayerWithFile("Pagina 1", type: "mp3")
                audioPlayer.play()
                comicImage.image = UIImage(named: "s005")

                
                return
                
            case UISwipeGestureRecognizerDirection.Up:
                print("up")
                
                return
                
            case UISwipeGestureRecognizerDirection.Down:
                print("down")
                
                //                    audioPlayer.prepareToPlay()
                //                    audioPlayer.volume = 5.0
                //                    audioPlayer.numberOfLoops = 20
                
                return
                
            default:
                return
            }
        }
        
        print("rodou")
    }
    
    func setupAudioPlayerWithFile(file:NSString, type:NSString) -> AVAudioPlayer  {
        let path = NSBundle.mainBundle().pathForResource(file as String, ofType: type as String)
        let url = NSURL.fileURLWithPath(path!)
        var audioPlayer:AVAudioPlayer?
        
        do {
            try audioPlayer = AVAudioPlayer(contentsOfURL: url)
        } catch {
            print("NO AUDIO PLAYER")
        }
        
        return audioPlayer!
    }


}

