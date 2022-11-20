import Foundation
import SwiftUI

class EmojiMemoryGameViewModel: ObservableObject {
    
    @Published private var model: MemoryGameModel<String>
    
    var currentScore: Int { model.currentScore }
    var highScore: Int { model.highScore }
                                                            
    private var factory = MemoryGameFactory()

    init() {
        model = factory.createEmoijMemoryGame(chosenCardDeck: CardDeck.animal, chosenLevel: Level.easy, deviceHeight: UIScreen.main.bounds.width)
    }
    
    // MARK: - Access to the Model
    var cards: Array<MemoryGameModel<String>.Card> {
        return model.cards
    }
    
    // MARK: - Intents
    func choose(card: MemoryGameModel<String>.Card) {
        model.choose(card: card)
    }
    
    func startEmoijGame(chosenCardDeck: CardDeck, chosenLevel: Level) {
        model = factory.createEmoijMemoryGame(chosenCardDeck: chosenCardDeck, chosenLevel: chosenLevel, deviceHeight: UIScreen.main.bounds.height)
    }
}
