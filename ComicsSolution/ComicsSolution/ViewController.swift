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
    var instaceAllComics: AllComics?
    var vetorComics = ["0","1"]
    var vetorStrings = ["pagina01", "pagina02"]

    var vetorStringAudio = ["dinastia-p2-q1","dinastia-p2-q2"]
    var doubleTap = true
    var location = CGPoint()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        swipe.loadSwipe(self.view!,ob: self)
        loadTapGesture()
        instaceAllComics = AllComics()
        vetorStrings = instaceAllComics!.vetorComics(2) // Pegar INDEX AQUI!!!!
        vetorStringAudio = instaceAllComics!.vetorAudio(2) // Pegar INDEX AQUI!!!!
        
        loadImage(vetorStrings) // Pegar INDEX AQUI!!!!
        
        vetorComics = (instaceAllComics?.current())!
            
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
                
                vetorComics = instaceAllComics!.previous()
                
                if(vetorComics[0] != "end"){
                    audioPlayer = sound.setupAudioPlayerWithFile("Pagina 1")
                    audioPlayer.play()
                    if verificador1 == 1{
                        audioPlayer2 = sound.setupAudioPlayerWithFile(vetorComics[1])
                        audioPlayer2.play()
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
            comicImage.image = UIImage(named: vetorComics[0])
        }
        

    }
    
    @IBAction func menu1(sender: AnyObject) {
        print("Verificador1: ",verificador1)
        print("audioPlayer : ",vetorComics[1])
        print("      ibagem: ",vetorComics[0])
        if verificador1 == 0 {
            verificador1 = 1
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
    
    // função a fazer
    @IBAction func info(sender: AnyObject)
    {
        print("Clicou na info!")
    }
    
    @IBAction func animation(sender: AnyObject)
    {
        for i in 0...5
        {
            view.addSubview(comicImage)
            
            let randomYOffset = CGFloat(arc4random_uniform(150))
            let path = UIBezierPath()
            path.moveToPoint(CGPoint(x: 16, y: 239 + randomYOffset))
            path.addCurveToPoint(CGPoint(x: 301, y: 239 + randomYOffset), controlPoint1: CGPoint(x: 136, y: 373 + randomYOffset), controlPoint2: CGPoint(x: 178, y: 110 + randomYOffset))
            
            let anim = CAKeyframeAnimation(keyPath: "position")
            anim.path = path.CGPath
            anim.rotationMode = kCAAnimationRotateAuto
            anim.repeatCount = Float.infinity
            anim.duration = 5.0
            
            // add the animation
            comicImage.layer.addAnimation(anim, forKey: "animate position along path")
        
        }
    }
}

