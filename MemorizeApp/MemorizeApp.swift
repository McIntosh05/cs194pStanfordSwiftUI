//
//  MemorizeAppApp.swift
//  MemorizeApp
//
//  Created by Oleksii Adakh on 23.09.2023.
//

import SwiftUI

@main
struct MemorizeApp: App {
    @StateObject var game = EmojiMemoryGame()
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(emojiMemoryGame: game)
        }
    }
}
