//
//  MemorizeGame.swift
//  CS193pClassCode
//
//  Created by Seungyeon Kim on 12/6/24.
//

import Foundation

struct MemoryGame<CardContent> {
    var cards: Array<Card>
    
    func choose(card: Card) {
        
    }
    
    struct Card {
        var isFaceUp: Bool
        var isMatched: Bool
        var content: CardContent
    }
    
}
