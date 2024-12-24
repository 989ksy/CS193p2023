//
//  ContentView.swift
//  CS193Assingment1
//
//  Created by Seungyeon Kim on 12/1/24.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel: EmojiGameViewModel
    
    var body: some View {
        
        VStack {
            
            HStack(spacing: 12) {
                themeTitle
                Text("|")
                score
            }
            .padding()

            
            ScrollView {
                cards
                    .animation(.default, value: viewModel.cards)
            }
            .scrollIndicators(.hidden)
            
            Spacer()
            
            newGameButton
            
        } // v
        
    } // body
    
    var themeTitle: some View {
        Text("Theme: \(viewModel.currentTheme.themeName)")
            .font(.headline)
    }
    
    var score: some View {
        Text("score: \(viewModel.score)")
            .font(.headline)
    }
    
    var cards: some View {
        
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 85), spacing: 0)], spacing: 0) {
            ForEach(viewModel.cards) { card in
                CardView(card: card)
                    .aspectRatio(2/3, contentMode: .fit)
                    .padding(4)
                    .onTapGesture {
                        viewModel.choose(card)
                    }
            }
            .foregroundStyle(viewModel.currentTheme.Color)
        }
        .padding(.horizontal)
        
    }
    
    var newGameButton: some View {
        ZStack {
            Button {
                viewModel.newGame()
                print("new Game")
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 8)
                        .fill(.clear)
                        .stroke(.orange)
                    
                    Text("New Game")
                        .foregroundStyle(.orange)
                        .fontWeight(.bold)
                }
                .frame(height: 50)
                .padding()
            }

        }
        
    }
    
}

// MARK: - CardView
struct CardView: View {

    let card: MemoryGame<String>.Card
    
    init(card: MemoryGame<String>.Card) {
        self.card = card
    }
    
    var body: some View {
        ZStack {
            let base: RoundedRectangle = RoundedRectangle(cornerRadius: 12)
            
            Group {
                base
                    .fill(.white)
                base
                    .strokeBorder(lineWidth: 2)
                Text(card.content)
                    .font(.system(size: 150))
                    .minimumScaleFactor(0.01)
                    .aspectRatio(contentMode: .fit)
            }
            .opacity(card.isFaceUp ? 1: 0)
            
            base.fill()
                .opacity(card.isFaceUp ? 0 : 1)
        }
        
        .opacity(card.isFaceUp || !card.isMatched ? 1 : 0)
    }
}

#Preview {
    ContentView(viewModel: EmojiGameViewModel())
}
