//
//  CS193Assingment1App.swift
//  CS193Assingment1
//
//  Created by Seungyeon Kim on 12/1/24.
//

import SwiftUI

@main
struct CS193Assingment1App: App {
    
    @StateObject var game = EmojiGameViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
