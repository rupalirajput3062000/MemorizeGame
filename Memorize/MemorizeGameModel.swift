//
//  MemorizeGameModel.swift
//  Memorize
//
//  Created by Rupali Rajput on 06/01/23.
//

import Foundation

struct MemorizeGame<CardContent> {
    
    private(set) var cards: [Card]
    
    init(numeberOfPairsOfCard: Int, createCardContent: (Int) -> CardContent) {
        cards = [Card]()
//        To be added
        for pairIdx in 0..<numeberOfPairsOfCard {
            let cardContent = createCardContent(pairIdx)
            cards.append(Card(content: cardContent))
        }
    }
    
    func choose() {
        
    }
    
    
    struct Card {
        var isFaceUp = false
        var isMatched = false
        var content: CardContent
    }
    
}
