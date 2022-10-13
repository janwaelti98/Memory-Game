import Foundation

class EmojiMemoryGameViewModel: ObservableObject {
    
    init() {
        model = EmojiMemoryGameViewModel.createMemoryGame()
    }
    
    
    @Published private var model: MemoryGameModel<String>
    
    static func createMemoryGame()->MemoryGameModel<String>{
        let emojiis: Array<String> = ["🙈", "🙉", "🙊", "🦁", "🐮", "🐷", "🐸", "🐒", "🐔", "🐧", "🐦", "🐤", "🦆", "🦅", "🦉", "🦇", "🐺", "🐗", "🐴", "🦄", "🐝", "🪱", "🐛", "🦋", "🐌", "🐞", "🐜", "🪰", "🪲", "🪳", "🦟", "🦗", "🕷", "🦂", "🐢", "🐍", "🦎", "🦖"]
        return  MemoryGameModel<String>(numberOfPairsOfCards: emojiis.count, cardContentFactory: { pairIndex in
            return emojiis[pairIndex]
        })
    }
    
    // MARK: - Access to the Model
    var cards: Array<MemoryGameModel<String>.Card> {
        return model.cards
    }
    
    // MARK: - Intents
    func choose(card: MemoryGameModel<String>.Card) {
        model.choose(card: card)
    }
}
