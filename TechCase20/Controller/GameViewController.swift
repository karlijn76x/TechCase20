//
//  ViewController.swift
//  TechCase20
//
//  Created by Karlijn van den Herik on 20/02/2025.
//

import Foundation
import UIKit

class GameViewController: UIViewController {
    var game: ReactionGame?
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        game?.startGame()
    
    }
}
