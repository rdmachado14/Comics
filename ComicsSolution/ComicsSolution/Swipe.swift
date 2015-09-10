//
//  File.swift
//  ComicsSolution
//
//  Created by leonardo fernandes farias on 10/09/15.
//  Copyright © 2015 Rodrigo DAngelo Silva Machado. All rights reserved.
//

import Foundation
import UIKit

class Swipe {
    
    func loadSwipe( view: UIView) {
        let swipeRight = UISwipeGestureRecognizer(target: self, action: "respondToSwipeGesture:")
        swipeRight.direction = UISwipeGestureRecognizerDirection.Right
        view.addGestureRecognizer(swipeRight)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: "respondToSwipeGesture:")
        swipeLeft.direction = UISwipeGestureRecognizerDirection.Left
        view.addGestureRecognizer(swipeLeft)
        
        let swipeUp = UISwipeGestureRecognizer(target: self, action: "respondToSwipeGesture:")
        swipeUp.direction = UISwipeGestureRecognizerDirection.Up
        view.addGestureRecognizer(swipeUp)
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: "respondToSwipeGesture:")
        swipeDown.direction = UISwipeGestureRecognizerDirection.Down
        view.addGestureRecognizer(swipeDown)
        
        let swipeHorario=UIRotationGestureRecognizer(target: self, action: "respondToSwipeGesture:")
        view.addGestureRecognizer(swipeHorario)
    }
}