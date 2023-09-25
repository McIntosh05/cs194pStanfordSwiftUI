//
//  EmojiMemoryGame.swift
//  MemorizeApp
//
//  Created by Oleksii Adakh on 23.09.2023.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    private static let emojis = ["👻", "🎃", "🕷️", "🦃", "🚕", "🐶", "🦔", "🐞", "🚔"]
    
    @Published private var memoryGame = MemoryGame(numberOfPairsOfCards: 4) { pairIndex in
        if emojis.indices.contains(pairIndex) {
            return emojis[pairIndex]
        } else {
            return "⁉️"
        }
    }
    
    var cards: Array<MemoryGame<String>.Card> {
        return memoryGame.cards
    }
    
    // MARK: - Intends
    func shuffle() {
        memoryGame.shuffle()
    }
    
    func choose(_ card: MemoryGame<String>.Card) {
        memoryGame.choose(card)
    }
}
