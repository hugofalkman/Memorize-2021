//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by H Hugo Falkman on 29/05/2021.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var game: EmojiMemoryGame
    
    var body: some View {
        AspectVGrid(items: game.cards, aspectRatio: 2/3) {card in
            if card.isMatched && !card.isFaceUp {
                Rectangle().opacity(0)
            } else {
                CardView(card: card)
                    .padding(4)
                    .onTapGesture {
                        game.choose(card)
                    }
            }
        }
        .foregroundColor(.red)
        .padding(.horizontal)
    }
}

struct CardView: View {
    let card: EmojiMemoryGame.Card
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Pie(startAngle: Angle(degrees: 0 - 90), endAngle: Angle(degrees: 110 - 90))
                    .padding(Const.piePadding).opacity(Const.pieOpacity)
                Text(card.content)
                    .rotationEffect(Angle(degrees: card.isMatched ? 360 : 0))
                    .animation(.linear(duration: 1).repeatForever(autoreverses: false))
                    .font(.system(size: Const.fontSize))
                    .scaleEffect(scale(fitting: geometry.size))
            }
            .cardify(isFaceUp: card.isFaceUp)
        }
    }
    
    private func scale(fitting size: CGSize) -> CGFloat {
        min(size.width, size.height) / (Const.fontSize / Const.fontScale)
    }
    
    private struct Const {
        static let fontScale: CGFloat = 0.65
        static let fontSize: CGFloat = 32
        static let piePadding:CGFloat = 5
        static let pieOpacity = 0.5
    }
}















struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        game.choose(game.cards.first!)
        return EmojiMemoryGameView(game: game)
    }
}
