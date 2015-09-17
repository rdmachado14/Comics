//
//  AllComics.swift
//  ComicsSolution
//
//  Created by Carlos Amadheus Souza Araujo on 14/09/15.
//  Copyright © 2015 Rodrigo DAngelo Silva Machado. All rights reserved.
//

import UIKit

class AllComics {
     var cont = Int()
     var Index = Int()
     var vetorComic = [String]()
     var vetorSound = [String]()
     var vetorFala = [String]()
    
    func vetorComics(index: Int) -> [String]{
        cont = 0
        Index=index
        switch index{
        case 1:
            vetorComic = ["SnS1","SnS2","SnS3","SnS4","SnS5","SnS6"]
            return vetorComic
        case 2:
            vetorComic = ["DM03","DM04"]
            return vetorComic
        default:
            vetorComic = ["HQNaoEncontrada"]
            return vetorComic
        }
    }
    
    func vetorAudio(Index: Int) -> [String]{
        switch Index{
        case 2:
            vetorSound = ["dinastia-p2-q1","dinastia-p2-q2"]
            return vetorSound
        default:
            vetorSound = ["HQNaoEncontrada"]
            return vetorSound
        }
    }
    
    func vetorFala(Index: Int) -> [String]{
        switch Index{
        case 2:
            vetorFala = ["Estranho", "audio-p2-q2"]
            return vetorFala
        default:
            vetorFala = ["HQNaoEncontrada"]
            return vetorFala
        }
    }
    
    func next() -> [String] {
        if (cont < vetorComic.count-1){
            cont++
            print(cont)
            return [vetorComic[cont],vetorSound[cont], vetorFala[cont]]
        }else{
            return ["end"]
        }
    
    }
    
    func previous() -> [String] {
        if (cont > 0){
            cont--
            print(cont)
            return [vetorComic[cont],vetorSound[cont], vetorFala[cont]]
        }else{
            return ["end"]
        }
    }
    
    func current() -> [String] {
        return [vetorComic[cont],vetorSound[cont],vetorFala[cont]]
    }
}
