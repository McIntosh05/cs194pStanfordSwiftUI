//
//  ContentView.swift
//  MemorizeApp
//
//  Created by Oleksii Adakh on 23.09.2023.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var emojiMemoryGame: EmojiMemoryGame
    
    var body: some View {
        VStack {
            title
            ScrollView {
                cards
                    .animation(.default, value: emojiMemoryGame.cards)
            }
            Button("Shuffle") {
                emojiMemoryGame.shuffle()
            }
            .padding()
        }
    }
    
    var title: some View {
        Text("Memorize!")
            .bold()
            .font(.title)
    }
    
    var cards: some View {
         return LazyVGrid(columns: [GridItem(.adaptive(minimum: 85), spacing: 0)], spacing: 0) {
             ForEach(emojiMemoryGame.cards) { card in
                 CardView(card)
                     .aspectRatio(2/3, contentMode: .fill)
                     .padding(4)
            }
        }
         .foregroundStyle(.orange)
    }
    
}

struct CardView: View {
    var card: MemoryGame<String>.Card
    
    init(_ card: MemoryGame<String>.Card) {
        self.card = card
    }
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(card.content)
                    .font(.system(size: 200))
                    .minimumScaleFactor(0.01)
                    .aspectRatio(1, contentMode: .fit)
            }
                .opacity(card.isFaceUp ? 1 : 0)
            base.fill()
                .opacity(card.isFaceUp ? 0 : 1)
            
        }
    }
}

#Preview {
    EmojiMemoryGameView(emojiMemoryGame: EmojiMemoryGame())
}
