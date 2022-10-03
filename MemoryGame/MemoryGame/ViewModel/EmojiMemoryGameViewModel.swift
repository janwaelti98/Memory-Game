import Foundation

class EmojiMemoryGameViewModel {
    
    init() {
        model = EmojiMemoryGameViewModel.createMemoryGame()
    }
    
    private var model: MemoryGame<String>
    
    static func createMemoryGame() -> MemoryGame<String> {
        let emojiis: Array<String> = ["🙈", "🙉", "🙊"]
        return  MemoryGame<String>(numberOfPairsOfCards: emojiis.count, cardContentFactory: { pairIndex in
            return emojiis[pairIndex]
        })
    }
    
    // MARK: - Access to the Model
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    // MARK: - Intents
    func choose(card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
    
}
