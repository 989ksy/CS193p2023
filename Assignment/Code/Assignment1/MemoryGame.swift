//
//  Theme.swift
//  CS193Assingment1
//
//  Created by Seungyeon Kim on 12/2/24.
//

import SwiftUI

struct MemoryGame<CardContent> where CardContent: Equatable {
    
    private(set) var cards: Array<Card>
    private(set) var score: Int = 0
    
    init(numberOfParisCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = []
        
        for pairIndex in 0..<max(4, numberOfParisCards) {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content, id: "\(pairIndex+1)a"))
            cards.append(Card(content: content, id: "\(pairIndex+1)b"))
        }
        
        cards.shuffle()
    }
    
    var indexOfTheOnlyFaceUpCard: Int? {
        get { cards.indices.filter { index in cards[index].isFaceUp }.only }
        set { cards.indices.forEach { cards[$0].isFaceUp = ( newValue == $0) } }
    }
    
    mutating func choose(_ card: Card) {
            if let chosenIndex = cards.firstIndex(where: { $0.id == card.id }),
               !cards[chosenIndex].isFaceUp,
               !cards[chosenIndex].isMatched {
                if let potentialMatchIndex = indexOfTheOnlyFaceUpCard {
                    if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                        cards[chosenIndex].isMatched = true
                        cards[potentialMatchIndex].isMatched = true
                        score += 2
                    } else {
                        score -= 1
                    }
                    cards[chosenIndex].isFaceUp = true
                } else {
                    indexOfTheOnlyFaceUpCard = chosenIndex
                }
            }
        }
    
    private func index(of card: Card) -> Int? {
        for index in cards.indices {
            if cards[index].id == card.id {
                return index
            }
        }
        return nil
    }
    
    mutating func shuffle() {
        cards.shuffle()
    }
    
    struct Card: Equatable, Identifiable {
        
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        let content: CardContent
        
        var id: String
        
    }
    
    /// 테마엔 이름, 사용할 이미지 세트, 카드 쌍의 수, 카드를 그릴 색상으로 구성할 것
    struct Theme {
        let themeName: String // 이름
        let emojis: [String] // 이미지
        let numberOfParis: Int
        let Color: Color
    }
    
    
}

extension Array {
    var only: Element? {
        count == 1 ? first : nil
    }
}
