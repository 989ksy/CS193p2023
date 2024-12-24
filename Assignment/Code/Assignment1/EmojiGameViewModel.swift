//
//  EmojiGameViewModel.swift
//  CS193Assingment1
//
//  Created by Seungyeon Kim on 12/22/24.
//

import SwiftUI

class EmojiGameViewModel: ObservableObject {
    private static let emojis = ["🍐", "🍆", "🍞", "🥚", "🍝", "🍵","🥘","🍖","🥒","🍒","🥭"]
    
    private static let themes: [MemoryGame<String>.Theme] = [
        MemoryGame.Theme(themeName: "Vehicles", emojis: ["✈️", "🚀", "🚗", "🛵", "🚌", "🚜", "🚲", "🚕"], numberOfParis: 2, Color: .red),
        MemoryGame.Theme(themeName: "Food", emojis: ["🥬", "🥒", "🫑", "🌽", "🥕", "🍋‍🟩", "🍅", "🍠", "🫐"], numberOfParis: 2, Color: .green),
        MemoryGame.Theme(themeName: "Jobs", emojis: ["👮‍♀️", "👷‍♀️", "👩🏻‍💻", "👩🏻‍🏫", "👩‍🍳"], numberOfParis: 8, Color: .blue),
        MemoryGame.Theme(themeName: "Sports", emojis: ["⚽️", "🏀", "🏈", "🎾", "🏓"], numberOfParis: 12, Color: .orange),
        MemoryGame.Theme(themeName: "Animals", emojis: ["🐶", "🐱", "🐭", "🐰", "🦊"], numberOfParis: 16, Color: .brown),
        MemoryGame.Theme(themeName: "Weather", emojis: ["☀️", "🌧", "🌩", "❄️", "🌈"], numberOfParis: 8, Color: .yellow)
    ]
    
    private static func creatememoryGame(theme: MemoryGame<String>.Theme) -> MemoryGame<String> {
        let emojis = theme.emojis.shuffled()
        
        return MemoryGame(numberOfParisCards: theme.numberOfParis) { pairIndex in
            emojis.indices.contains(pairIndex) ? emojis[pairIndex] : "⁉️"
        }
    }
    
    @Published private var model = creatememoryGame(theme: themes.randomElement() ?? themes.first!)
    private(set) var currentTheme: MemoryGame<String>.Theme
    
    // 기본 초기화
    init() {
        let theme = EmojiGameViewModel.themes.randomElement()!
        self.currentTheme = theme
        self.model = EmojiGameViewModel.creatememoryGame(theme: theme)
    }
    
    // 프리뷰용 초기화
    init(model: MemoryGame<String>, currentTheme: MemoryGame<String>.Theme) {
        self.model = model
        self.currentTheme = currentTheme
    }
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    var score: Int {
        model.score
    }
    
    func shuffle() {
        model.shuffle()
    }
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
    
    func newGame() {
        let newTheme = EmojiGameViewModel.themes.randomElement()!
        currentTheme = newTheme
        model = EmojiGameViewModel.creatememoryGame(theme: newTheme)
        
    }
    
}
