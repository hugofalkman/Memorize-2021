//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by H Hugo Falkman on 31/05/2021.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    static let emojis = ["🚲", "🚂", "🚁", "🚜", "🚕", "🏎", "🚑", "🚓", "🚒", "✈️", "🚀", "⛵️", "🛸", "🛶", "🚌", "🏍", "🛺", "🚠", "🛵", "🚗", "🚚", "🚇", "🛻", "🚝"]
    
    typealias Game = MemoryGame<String>
    static func createMemoryGame() -> Game {
        Game(numberOfPairsOfCards: 4) {pairIndex in
            emojis[pairIndex]
        }
    }
    
    @Published private var model = createMemoryGame()
    var cards: [Game.Card] { model.cards }
    
    // MARK: - Intents
    
    func choose(_ card: Game.Card) {
        model.choose(card)
    }
}
