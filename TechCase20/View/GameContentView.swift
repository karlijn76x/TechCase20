//
//  ContentView.swift
//  TechCase20
//
//  Created by Karlijn van den Herik on 20/02/2025.
//

import SwiftUI

struct GameContentView: View {
    @ObservedObject var game = ReactionGame()
    
    var body : some View {
        GameView(game: game )
        
    VStack {
        
        if game.gameState == .idle {
            Text("Shake your phone to start!")
                .font(.largeTitle)
        } else if game.gameState == .countdown{
            Text("Get ready...")
                .font(.largeTitle)
            Text("\(game.countdownTime)")
                .font(.largeTitle)
                .foregroundColor(.green)
        } else if game.gameState == .waitingForTap {
            Text("Tap Now!")
                .font(.largeTitle)
                .foregroundColor(.pink)
                .onTapGesture {
                    game.tapDetected()
                }
        } else if game.gameState == .finished {
            Text("Your reaction time is: \(game.reactionTime ?? 0) seconden" )
                .font(.largeTitle)
        }
        Spacer()
        }
    
    }
}

#Preview {
    GameContentView(game: ReactionGame())
}


