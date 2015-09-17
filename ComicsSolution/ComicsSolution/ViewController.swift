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
    var audioPlayer3 = AVAudioPlayer()


    var sound = Sound()
    var swipe = loadSwipe()
    var cont = Int()
    var verificador1 = Int()
    var verificador2 = Int()
    var verificador3 = Int()
    var instaceAllComics: AllComics?
    var vetorComics = ["0","1","2"]
    var vetorStrings = ["pagina01", "pagina02"]

    var vetorStringAudio = ["dinastia-p2-q1","dinastia-p2-q2"]
    var vetorStringFala = ["estranho", "audio-p2-q2"]
    var doubleTap = true
    var location = CGPoint()
    
    var playerQueue : AVQueuePlayer = {
        
        var url1 = NSBundle.mainBundle().URLForResource("dinastia-p2-q1", withExtension: "mp3")
        var url2 = NSBundle.mainBundle().URLForResource("Estranho", withExtension: "mp3")
        
        let item1 = AVPlayerItem(URL: url1!)
        let item2 = AVPlayerItem(URL: url2!)
        
        let queue = AVQueuePlayer(items: [item1, item2])
        return queue
        
    }()
    override func viewDidLoad()
    {
        super.viewDidLoad()
        swipe.loadSwipe(self.view!,ob: self)
        loadTapGesture()
        instaceAllComics = AllComics()
        vetorStrings = instaceAllComics!.vetorComics(2) // Pegar INDEX AQUI!!!!
        vetorStringAudio = instaceAllComics!.vetorAudio(2) // Pegar INDEX AQUI!!!!
        vetorStringFala = instaceAllComics!.vetorFala(2)  //Pegar INDEX AQUI!!!!
        
        loadImage(vetorStrings) // Pegar INDEX AQUI!!!!
        
        vetorComics = (instaceAllComics?.current())!
            
        self.scrollView.minimumZoomScale = 1.0;
        self.scrollView.maximumZoomScale = 6.0;
        playerQueue.play()
    }
    
    override func didReceiveMemoryWarning(){
        super.didReceiveMemoryWarning()
    }
    
    func loadImage(vetor: [String]) {
        comicImage.image = UIImage(named: vetor[cont]) // carregar imagem na tela
        if verificador1 == 1{
            vetorComics = (instaceAllComics?.current())!
            audioPlayer2 = sound.setupAudioPlayerWithFile(vetorComics[1])
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
            self.scrollView.zoomToRect(CGRect(x: gesture.locationOfTouch(0, inView: scrollView.viewForBaselineLayout()).x, y: gesture.locationOfTouch(0, inView: scrollView.viewForBaselineLayout()).y, width: 2, height: 2), animated: true)
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
                
                vetorComics = instaceAllComics!.previous()
                
                if(vetorComics[0] != "end"){
                    audioPlayer = sound.setupAudioPlayerWithFile("Pagina 1")
                    audioPlayer.play()
                    if verificador1 == 1{
                        audioPlayer2 = sound.setupAudioPlayerWithFile(vetorComics[1])
                        audioPlayer2.play()
                    }
                    if verificador2 == 1 {
                        audioPlayer3 = sound.setupAudioPlayerWithFile(vetorComics[2])
                        audioPlayer3.playAtTime(0.20)
                    }
                    comicImage.image = UIImage(named: vetorComics[0])
                }
                
                return
                
            case UISwipeGestureRecognizerDirection.Left:
                
                print("left")
                
                let vetorComics = instaceAllComics!.next()
                
                if(vetorComics[0] != "end"){
                    audioPlayer = sound.setupAudioPlayerWithFile("Pagina 1")
                    audioPlayer.play()
                    if verificador1 == 1{
                        audioPlayer2 = sound.setupAudioPlayerWithFile(vetorComics[1])
                        audioPlayer2.play()
                    }
                    if verificador2 == 1 {
                        audioPlayer3 = sound.setupAudioPlayerWithFile(vetorComics[2])
                        audioPlayer3.playAtTime(35)
                    }
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
        
        if(vetorComics[0] != "end"){
            audioPlayer = sound.setupAudioPlayerWithFile("Pagina 1")
            audioPlayer.play()
            if verificador1 == 1{
                audioPlayer2 = sound.setupAudioPlayerWithFile(vetorComics[1])
                audioPlayer2.play()
            }
            if verificador2 == 2 {
                audioPlayer3 = sound.setupAudioPlayerWithFile(vetorComics[2])
                audioPlayer3.play()
            }
            comicImage.image = UIImage(named: vetorComics[0])
        }
        
        
        
    }
    
    @IBAction func next(sender: AnyObject)
    {
        let vetorComics = instaceAllComics!.next()
        
        if(vetorComics[0] != "end"){
            audioPlayer = sound.setupAudioPlayerWithFile("Pagina 1")
            audioPlayer.play()
            if verificador1 == 1{
                audioPlayer2 = sound.setupAudioPlayerWithFile(vetorComics[1])
                audioPlayer2.play()
            }
            if verificador2 == 2 {
                audioPlayer3 = sound.setupAudioPlayerWithFile(vetorComics[2])
                audioPlayer3.play()
            }
            comicImage.image = UIImage(named: vetorComics[0])
        }
        

    }
    
    @IBAction func menu1(sender: AnyObject) {
        print("Verificador1: ",verificador1)
        print("audioPlayer : ",vetorComics[1])
        print("      ibagem: ",vetorComics[0])
        if verificador1 == 0 {
            verificador1 = 1
            vetorComics = (instaceAllComics?.current())!
            audioPlayer2 = sound.setupAudioPlayerWithFile(vetorComics[1])
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
            vetorComics = (instaceAllComics?.current())!
            print(vetorComics[2])
            audioPlayer3 = sound.setupAudioPlayerWithFile(vetorComics[2])
            audioPlayer3.play()
            
        }else{
            verificador2 = 0
            audioPlayer3.stop()
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

