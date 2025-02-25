//
//  ReactionGameModel.swift
//  TechCase20
//
//  Created by Karlijn van den Herik on 20/02/2025.
//

import Foundation

class ReactionGame : ObservableObject{
    @Published var gameState : GameState = .idle //start toestand (shake om te starten)
    @Published var reactionTime : Double? = nil
    @Published var highScore : Double? = nil
    @Published var countdownTime: Int = 3
    
    private var startTime: Date? //var to save the start time
    private var countdownTimer: Timer?
    
    enum GameState{
        case idle, countdown, waitingForTap, finished
        //4 states, idle (not started yet, wait for shake), in countdown (shake, game starts), waiting for tap (wait for tap! message), finished (tap time between message and tap mesured, game finished)
    }
    
    public func startGame(){
        gameState = .countdown
        startCountDown()
    }
    
    private func startCountDown() {
            countdownTime = 3 // reset countdown to 3 seconds
            countdownTimer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
                if self.countdownTime > 0 {
                    self.countdownTime -= 1
                } else {
                    timer.invalidate() // stop the timer
                    self.showTapMessage()
                }
            }
        }
    
    private func showTapMessage(){
        let randomDelay: TimeInterval = Double.random(in: 2.0...5.0) //delay between 2 and 5 seconds for message to show
        DispatchQueue.main.asyncAfter(deadline: .now() + randomDelay) {
            self.gameState = .waitingForTap
            self.startTime = Date() //save the starting time
        }
    }
    
    public func tapDetected(){
        guard let startTime = self.startTime else {return} //making sure there is a start time
        let elapsedTime = Date().timeIntervalSince(startTime) //calculating reactiontime
        reactionTime = elapsedTime
        print("Tapped! Reactiontime: \(elapsedTime) seconds")
        self.gameState = .finished
    }
}
