//
//  CS193pClassCodeApp.swift
//  CS193pClassCode
//
//  Created by Seungyeon Kim on 12/6/24.
//

import SwiftUI

@main
struct CS193pClassCodeApp: App {
    @StateObject var game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(viewModel: game)
        }
    }
}
