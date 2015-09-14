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
    var contAudio = Int()
    var instaceAllComics: AllComics?
    var vetorStrings = ["nada","nada"]
    var vetorStringAudio = ["nada", "nada"]
    var doubleTap = true
    var location = CGPoint()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        swipe.loadSwipe(self.view!,ob: self)
        loadTapGesture()
        instaceAllComics = AllComics()
        vetorStrings = instaceAllComics!.vetorComics(1) // Pegar INDEX AQUI!!!!
        vetorStringAudio = instaceAllComics!.vetorAudio(1) // Pegar INDEX AQUI!!!!
        
        loadImage(vetorStrings) // Pegar INDEX AQUI!!!!
        
        self.scrollView.minimumZoomScale = 1.0;
        self.scrollView.maximumZoomScale = 6.0;
        
    }
    
    override func didReceiveMemoryWarning(){
        super.didReceiveMemoryWarning()
    }
    
    func loadImage(vetor: [String]) {
        comicImage.image = UIImage(named: vetor[cont]) // carregar imagem na tela
        if(vetorStringAudio[cont] != "HQNaoEncontrada"){
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
                
                let vetorComics = instaceAllComics!.next()
                
                if(vetorComics[0] == "end"){
                    audioPlayer = sound.setupAudioPlayerWithFile("Pagina 1")
                    audioPlayer.play()
                    
                    audioPlayer2 = sound.setupAudioPlayerWithFile(vetorComics[1])
                    audioPlayer2.play()
                    
                    comicImage.image = UIImage(named: vetorComics[0])

                }
                
                return
                
            case UISwipeGestureRecognizerDirection.Left:
                
                print("left")
                
                let vetorComics = instaceAllComics!.previous()
                
                if(vetorComics[0] == "end"){
                    audioPlayer = sound.setupAudioPlayerWithFile("Pagina 1")
                    audioPlayer.play()
                    
                    audioPlayer2 = sound.setupAudioPlayerWithFile(vetorComics[1])
                    audioPlayer2.play()
                    
                    comicImage.image = UIImage(named: vetorComics[0])
                    
                }

                
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
        let vetorComics = instaceAllComics!.previous()
        
        if(vetorComics[0] == "end"){
            audioPlayer = sound.setupAudioPlayerWithFile("Pagina 1")
            audioPlayer.play()
            
            audioPlayer2 = sound.setupAudioPlayerWithFile(vetorComics[1])
            audioPlayer2.play()
            
            comicImage.image = UIImage(named: vetorComics[0])
            
        }
        
        
        
    }
    
    @IBAction func next(sender: AnyObject)
    {
        let vetorComics = instaceAllComics!.next()
        
        if(vetorComics[0] == "end"){
            audioPlayer = sound.setupAudioPlayerWithFile("Pagina 1")
            audioPlayer.play()
            
            audioPlayer2 = sound.setupAudioPlayerWithFile(vetorComics[1])
            audioPlayer2.play()
            
            comicImage.image = UIImage(named: vetorComics[0])
            
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

