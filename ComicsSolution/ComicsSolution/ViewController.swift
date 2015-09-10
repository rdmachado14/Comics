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

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var comicImage: UIImageView!
    var audioPlayer = AVAudioPlayer()
    var sound = Sound()
    var cont = Int()
    var vetorStrings = ["p1","p2","p3","p4"]
    var doubleTap = true
    var location = CGPoint()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        loadImage(vetorStrings)
        loadSwipe()
        loadTapGesture()
        
        
        self.scrollView.minimumZoomScale = 1.0;
        self.scrollView.maximumZoomScale = 6.0;
        
    }

    override func didReceiveMemoryWarning(){
        super.didReceiveMemoryWarning()
    }
    
    func loadImage(vetor: [String]) {
        comicImage.image = UIImage(named: vetor[cont]) // carregar imagem na tela
    }
    
    func loadSwipe() {
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
    
    func loadTapGesture(){
        let bSelector : Selector = "respondToTapGesture:"
        let doubleTapGesture = UITapGestureRecognizer(target: self, action: bSelector)
        doubleTapGesture.numberOfTapsRequired = 2
        self.view!.addGestureRecognizer(doubleTapGesture)
        
        //tapGesture.requireGestureRecognizerToFail(doubleTapGesture)
    }
    
    func respondToTapGesture(gesture: UITapGestureRecognizer){
        
        if(scrollView.zooming || doubleTap || scrollView.zoomScale == 6){
            scrollView.zoomToRect(CGRect(x: 0, y: 0, width: 1000, height: 1000), animated: true)
            doubleTap = false;
        }else{
            //let Touch = gesture.locationOfTouch(1, inView: scrollView)
            //print(Touch.x);
            //print(Touch.y);
            self.scrollView.zoomToRect(CGRect(x: gesture.locationOfTouch(0, inView: scrollView.viewForBaselineLayout()).x, y: gesture.locationOfTouch(0, inView: scrollView.viewForBaselineLayout() ).y, width: 2, height: 2), animated: true)
            print(scrollView.zoomScale)
            doubleTap = true;
            print(location);
        }
        
    }
    
    func respondToSwipeGesture(gesture: UIGestureRecognizer){
        if let swipeGesture = gesture as? UISwipeGestureRecognizer{
            switch swipeGesture.direction{
            case UISwipeGestureRecognizerDirection.Right:
                print("right")
                if cont < vetorStrings.count - 1 {
                    cont++
                    audioPlayer = sound.setupAudioPlayerWithFile("Pagina 1")
                    audioPlayer.play()
                }
                
                
                comicImage.image = UIImage(named: vetorStrings[cont])
                return
                
            case UISwipeGestureRecognizerDirection.Left:
                
                print("left")
                if cont > 0 {
                    cont--
                    audioPlayer = sound.setupAudioPlayerWithFile("Pagina 1")
                    audioPlayer.play()
                }
                
                comicImage.image = UIImage(named: vetorStrings[cont])

                
                return
                
            case UISwipeGestureRecognizerDirection.Up:
                print("up")
                
                return
                
            case UISwipeGestureRecognizerDirection.Down:
                print("down")
                return
                
            default:
                return
            }
        }
        
    }
    
    

    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView?
    {
        return self.comicImage
    }
    
    @IBAction func previous(gesture: AnyObject)
    {
        if cont < vetorStrings.count - 1 {
            cont++
            audioPlayer = sound.setupAudioPlayerWithFile("Pagina 1")
            audioPlayer.play()
            comicImage.image = UIImage(named: vetorStrings[cont])
        }
        
        
        
    }
    
    @IBAction func next(sender: AnyObject)
    {
        if cont > 0 {
            cont--
            audioPlayer = sound.setupAudioPlayerWithFile("Pagina 1")
            audioPlayer.play()
            comicImage.image = UIImage(named: vetorStrings[cont])
        }
        

    }
}

