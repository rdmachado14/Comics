//
//  Sounds.swift
//  ComicsSolution
//
//  Created by Rodrigo Machado on 9/9/15.
//  Copyright © 2015 Rodrigo DAngelo Silva Machado. All rights reserved.
//

import AVFoundation

class Sound {
    
    func setupAudioPlayerWithFile(file:NSString) -> AVAudioPlayer  {
        let path = NSBundle.mainBundle().pathForResource(file as String, ofType: "mp3")
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