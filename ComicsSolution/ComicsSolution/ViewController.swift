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
    var audioPlayer2 = AVAudioPlayer()
    var sound = Sound()
    var swipe = loadSwipe()
    var cont = Int()
    var verificador1 = Int()
    var verificador2 = Int()
    var verificador3 = Int()
    var vetorStrings = ["pagina01","pagina02"]
    var vetorStringAudio = ["dinastia-p2-q1", "dinastia-p2-q2"]
    var doubleTap = true
    var location = CGPoint()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        loadImage(vetorStrings)
        swipe.loadSwipe(self.view!,ob: self)
        loadTapGesture()
        
        
        self.scrollView.minimumZoomScale = 1.0;
        self.scrollView.maximumZoomScale = 6.0;
        
    }

    override func didReceiveMemoryWarning(){
        super.didReceiveMemoryWarning()
    }
    
    func loadImage(vetor: [String]) {
        comicImage.image = UIImage(named: vetor[cont]) // carregar imagem na tela
        if verificador1 == 1{
            audioPlayer2 = sound.setupAudioPlayerWithFile(vetorStringAudio[cont])
            audioPlayer2.play()
        }
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
                    if verificador1 == 1{
                        audioPlayer2 = sound.setupAudioPlayerWithFile(vetorStringAudio[cont])
                    
                        audioPlayer2.play()
                    }
                }
                
                
                comicImage.image = UIImage(named: vetorStrings[cont])
                return
                
            case UISwipeGestureRecognizerDirection.Left:
                
                print("left")
                if cont > 0 {
                    cont--
                    audioPlayer = sound.setupAudioPlayerWithFile("Pagina 1")
                    audioPlayer.play()
                    if verificador1 == 1{
                        audioPlayer2 = sound.setupAudioPlayerWithFile(vetorStringAudio[cont])
                    
                        audioPlayer2.play()
                    }
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
            if verificador1 == 1{
                audioPlayer2 = sound.setupAudioPlayerWithFile(vetorStringAudio[cont])
                audioPlayer2.play()
            }
            comicImage.image = UIImage(named: vetorStrings[cont])
        }
        
        
        
    }
    
    @IBAction func next(sender: AnyObject)
    {
        if cont > 0 {
            cont--
            audioPlayer = sound.setupAudioPlayerWithFile("Pagina 1")
            audioPlayer.play()
            if verificador1 == 1{
                audioPlayer2 = sound.setupAudioPlayerWithFile(vetorStringAudio[cont])
                audioPlayer2.play()
            }
            comicImage.image = UIImage(named: vetorStrings[cont])
        }
        

    }
    
    @IBAction func menu1(sender: AnyObject) {
        if verificador1 == 0 {
            verificador1 = 1
            audioPlayer2 = sound.setupAudioPlayerWithFile(vetorStringAudio[cont])
            audioPlayer2.play()
        }else{
            verificador1 = 0
            audioPlayer2.stop()
        }
        
        print("clicou1\t\(verificador1)")
        
    }
    
    @IBAction func menu2(sender: AnyObject) {
        if verificador2 == 0 {
            verificador2 = 1
        }else{
            verificador2 = 0
        }
        print("clicou2\t\(verificador2)")

    }
    @IBAction func menu3(sender: AnyObject) {
        if verificador3 == 0 {
            verificador3 = 1
            
        }else{
            verificador3 = 0
        }
        print("clicou3\t\(verificador3)")

    }
}

