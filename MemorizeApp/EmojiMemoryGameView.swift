//
//  ContentView.swift
//  MemorizeApp
//
//  Created by Oleksii Adakh on 23.09.2023.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var emojiMemoryGame: EmojiMemoryGame
    
    @State var currTheme = Theme(name: "Theme1", emoji: ["👻", "🎃", "🕷️", "🦃", "🚕", "🐶", "🦔", "🐞", "🚔"], numberOfPairs: 9, color: .orange)
    
    var body: some View {
        VStack {
            title
            scoreBoard
            ScrollView {
                cards
                    .animation(.default, value: emojiMemoryGame.cards)
            }
            HStack {
                addNewGameButton
                Spacer()
                theme1
                theme2
                theme3
                Spacer()
                Button("Shuffle") {
                    emojiMemoryGame.shuffle()
                }
            }
            .padding()
        }
    }
    
    var scoreBoard: some View {
        Text("Score: \(emojiMemoryGame.score)")
    }
    
    var title: some View {
        Text("Memorize!")
            .bold()
            .font(.title)
    }
    
    var theme1: some View {
        Button(action: {
            currTheme = Theme(name: "Theme1", emoji: ["👻", "🎃", "🕷️", "🦃", "🚕", "🐶", "🦔", "🐞", "🚔"], numberOfPairs: 9, color: .orange)
            emojiMemoryGame.changeTheme(to: currTheme)
        }, label: {
            VStack {
                Image(systemName: "questionmark.circle")
                Text("Theme1")
            }
        })
    }
    
    var theme2: some View {
        Button(action: {
            currTheme = Theme(name: "Theme1", emoji: ["😀", "😃", "😍", "😇", "🤓", "😋", "🤪", "😌", "😎"], numberOfPairs: 7, color: .green)
            emojiMemoryGame.changeTheme(to: currTheme)
        }, label: {
            VStack {
                Image(systemName: "questionmark.circle")
                Text("Theme2")
            }
        })
    }
    
    var theme3: some View {
        Button(action: {
            currTheme = Theme(name: "Theme1", emoji: ["👿", "👹", "🤡", "💩", "💀", "☠️", "👾", "🤖", "👽"], numberOfPairs: 6, color: .blue)
            emojiMemoryGame.changeTheme(to: currTheme)
        }, label: {
            VStack {
                Image(systemName: "questionmark.circle")
                Text("Theme3")
            }
        })
    }
    
    var addNewGameButton: some View {
        Button(action: {
            emojiMemoryGame.changeTheme(to: currTheme)
        }, label: {
            VStack {
                Image(systemName: "plus.circle")
                Text("New Game")
            }
        })
    }
    
    var cards: some View {
         return LazyVGrid(columns: [GridItem(.adaptive(minimum: 85), spacing: 0)], spacing: 0) {
             ForEach(emojiMemoryGame.cards) { card in
                 CardView(card)
                     .aspectRatio(2/3, contentMode: .fill)
                     .padding(4)
                     .onTapGesture {
                         emojiMemoryGame.choose(card)
                     }
            }
        }
         .foregroundStyle(currTheme.color)
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
        .opacity(card.isFaceUp || !card.isMatched ? 1 : 0)
    }
}

#Preview {
    EmojiMemoryGameView(emojiMemoryGame: EmojiMemoryGame())
}
