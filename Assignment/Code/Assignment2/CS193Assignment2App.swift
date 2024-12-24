//
//  CS193Assingment2App.swift
//  CS193Assingment2
//
//  Created by Seungyeon Kim on 12/1/24.
//

import SwiftUI

@main
struct CS193Assingment2App: App {
    
    @StateObject var game = EmojiGameViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}