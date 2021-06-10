//
//  Cardify.swift
//  Memorize
//
//  Created by H Hugo Falkman on 09/06/2021.
//

import SwiftUI

struct Cardify: ViewModifier{
    var isFaceUp: Bool
    
    func body(content: Content) -> some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: Const.cornerRadius)
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: Const.lineWidth)
            } else {
                shape.fill()
            }
            content.opacity(isFaceUp ? 1 : 0)
        }
    }
    
    private struct Const {
        static let cornerRadius: CGFloat = 10
        static let lineWidth: CGFloat = 3
    }
}

extension View {
    func cardify(isFaceUp: Bool) -> some View {
        self.modifier(Cardify(isFaceUp: isFaceUp))
    }
}

