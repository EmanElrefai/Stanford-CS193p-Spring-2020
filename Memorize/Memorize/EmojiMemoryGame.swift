//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Eman on 8/23/20.
//  Copyright © 2020 CS193p Stanford 2020. All rights reserved.
//

import SwiftUI


class EmojiMemoryGame : ObservableObject{
   
    
    @Published private var model:MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    
    private static func createMemoryGame()->MemoryGame<String>{
         let emojis=["👻","🎃","🕷","🧞‍♀️","☘️","🐬","🦸‍♀️","🧚","🎀","🦋"]
        
        
        return MemoryGame<String>(numberOfPairsOfCards: emojis.count) { pairIndex in return emojis[pairIndex]}
    }
    
    // MARK: - Access to the model
    
    var cards: Array<MemoryGame<String>.Card>{
        model.cards
    }
    
    // MARK: - Intent
    
    func choose(card: MemoryGame<String>.Card){
          model.choose(card: card)
    }
    
    func resetGame() {
        model = EmojiMemoryGame.createMemoryGame()
    }
}
