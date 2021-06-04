//
//  MemorizeApp.swift
//  Memorize
//
//  Created by H Hugo Falkman on 29/05/2021.
//

import SwiftUI

@main
struct MemorizeApp: App {
    private let game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(game: game)
        }
    }
}
