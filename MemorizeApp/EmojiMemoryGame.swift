//
//  EmojiMemoryGame.swift
//  MemorizeApp
//
//  Created by Oleksii Adakh on 23.09.2023.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    private static let theme1 = ["👻", "🎃", "🕷️", "🦃", "🚕", "🐶", "🦔", "🐞", "🚔"]
    
    @Published private var memoryGame = MemoryGame(numberOfPairsOfCards: 9) { pairIndex in
        if theme1.indices.contains(pairIndex) {
            return theme1[pairIndex]
        } else {
            return "⁉️"
        }
    }
    
    var score: Int {
        memoryGame.score
    }
    
    var theme = Theme(name: "Theme1", emoji: theme1, numberOfPairs: 9, color: .green)
    
    private func fillMemoryGame(by theme: Theme) {
        memoryGame = MemoryGame(numberOfPairsOfCards: theme.numberOfPairs) { pairIndex in
            if theme.emoji.indices.contains(pairIndex) {
                return theme.emoji[pairIndex]
            } else {
                return "⁉️"
            }
        }
    }
    
    func changeTheme(to theme: Theme) {
        fillMemoryGame(by: theme)
    }
    
    var cards: Array<MemoryGame<String>.Card> {
        return memoryGame.cards
    }
    
    // MARK: - Intends
    func shuffle() {
        memoryGame.shuffle()
    }
    
    func choose(_ card: MemoryGame<String>.Card) {
        print(score)
        memoryGame.choose(card)
    }
    
}

