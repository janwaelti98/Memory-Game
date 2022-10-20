import Foundation

class EmojiMemoryGameViewModel: ObservableObject {
    
    @Published private var model: MemoryGameModel<String>
    private var factory = MemoryGameFactory()
    public var chosenCardDeck = CardDeck.food
    
    
    init() {
        model = factory.createMemoryGame(chosenCardDeck: chosenCardDeck)
    }
    
    // MARK: - Access to the Model
    var cards: Array<MemoryGameModel<String>.Card> {
        return model.cards
    }
    
    // MARK: - Intents
    func choose(card: MemoryGameModel<String>.Card) {
        model.choose(card: card)
    }
    
    func startGame(chosenCardDeck: CardDeck) {
        model = factory.createMemoryGame(chosenCardDeck: chosenCardDeck)
    }
}
