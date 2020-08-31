//
//  MemoryGame.swift
//  Memorize
//
//  Created by Eman on 8/23/20.
//  Copyright © 2020 CS193p Stanford 2020. All rights reserved.
//

import Foundation
struct MemoryGame<CardContent> where CardContent: Equatable {
   private (set) var cards: Array<Card>
    
   private var indexOfTheOneAndOnlyFacedUpCard: Int? {
        get {cards.indices.filter { cards[$0].isFaceUp }.only }
        set {
            for index in cards.indices {
            
                cards[index].isFaceUp = index == newValue
                
            }
            
        }
    }
    
   mutating func choose(card: Card){
       // print("card chosen: \(card)")
    if let chosenIndex: Int = cards.firstIndex(matching: card), !cards[chosenIndex].isFaceUp , !cards[chosenIndex].isMatched {
        if let potentialMatchIndex = indexOfTheOneAndOnlyFacedUpCard {
            if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                cards[chosenIndex].isMatched = true
                cards[potentialMatchIndex].isMatched=true
            }
             self.cards[chosenIndex].isFaceUp = true
        } else {
            
            indexOfTheOneAndOnlyFacedUpCard = chosenIndex
        }
       
    }
        
        
    }

    
    init(numberOfPairsOfCards: Int,cardContentFactory:(Int)->CardContent) {
        cards=Array<Card>()
        for pairIndex in 0..<numberOfPairsOfCards{
            let content = cardContentFactory(pairIndex)
            
            cards.append(Card( content: content,id:pairIndex*2))
            cards.append(Card( content: content,id: pairIndex*2+1))
        }
        cards.shuffle()
    }
    
    
    struct Card: Identifiable{
        var isFaceUp: Bool=false {
            didSet {
                if isFaceUp {
                    stopUsingBonusTime()
                } else {
                    stopUsingBonusTime()
                }
            }
        }
        
        
        var isMatched: Bool=false {
            didSet {
                stopUsingBonusTime()
            }
        }
        
        var content: CardContent
        var id :Int
        
    

        // MARK: - Bouns Time

            var bonusTimeLimit: TimeInterval = 6
            
            
            
        
            private var faceUpTime: TimeInterval {
                
                if let lastFaceUpDate = self.lastFaceUpDate {
                    return pastFaceUpTime + Date().timeIntervalSince(lastFaceUpDate)
                } else {
                    return pastFaceUpTime
                }
            }
        
           var lastFaceUpDate: Date?
           var pastFaceUpTime: TimeInterval = 0

            var bonusTimeRemaining: TimeInterval {
                max(0, bonusTimeLimit - faceUpTime)
            }


            var bonusRemaining: Double {
                (bonusTimeLimit > 0 && bonusTimeRemaining > 0) ? bonusTimeRemaining/bonusTimeLimit : 0
            }

            var hasEarnedBonus: Bool {
                isMatched && bonusTimeRemaining > 0
            }

            var isConsumingBonusTime: Bool {
                isFaceUp && !isMatched && bonusTimeRemaining > 0
            }

            private mutating func startUsingBonusTime() {
                if isConsumingBonusTime, lastFaceUpDate == nil {
                    lastFaceUpDate = Date()
                }
            }


            private mutating func stopUsingBonusTime() {
                pastFaceUpTime = faceUpTime
                self.lastFaceUpDate = nil
    }
  }
}
