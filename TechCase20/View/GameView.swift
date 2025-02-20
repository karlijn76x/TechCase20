//
//  GameView.swift
//  TechCase20
//
//  Created by Karlijn van den Herik on 20/02/2025.
//

import SwiftUI

struct GameView: UIViewControllerRepresentable {
    @ObservedObject var game: ReactionGame
    
    func makeUIViewController(context: Context) -> GameViewController {
        let vc = GameViewController()
        vc.game = game
        return vc
    }
    
    func updateUIViewController(_ uiViewController: GameViewController, context: Context) {
    
    }
}

