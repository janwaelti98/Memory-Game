import Foundation
import SwiftUI

class EmojiMemoryGameViewModel: ObservableObject {
    
    @Published private var model: MemoryGameModel<String>
    private var factory = MemoryGameFactory()

    init() {
        model = factory.createMemoryGame(chosenCardDeck: CardDeck.animal, chosenLevel: Level.easy, deviceHeight: UIScreen.main.bounds.width)
    }
    
    // MARK: - Access to the Model
    var cards: Array<MemoryGameModel<String>.Card> {
        return model.cards
    }
    
    // MARK: - Intents
    func choose(card: MemoryGameModel<String>.Card) {
        model.choose(card: card)
    }
    
    func startGame(chosenCardDeck: CardDeck, chosenLevel: Level) {
        model = factory.createMemoryGame(chosenCardDeck: chosenCardDeck, chosenLevel: chosenLevel, deviceHeight: UIScreen.main.bounds.height)
    }
}
