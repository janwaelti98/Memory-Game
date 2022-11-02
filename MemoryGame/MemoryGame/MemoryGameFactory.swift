import Foundation

enum CardDeck {
    case animal
    case food
}

enum Level : String, CaseIterable {
    case easy = "easy"
    case medium = "medium"
    case hard = "hard"
}

class MemoryGameFactory {
    
    init() {}
    
    
    let animals: Array<String> = ["🙈", "🙉", "🙊", "🦁", "🐮", "🐷",
                                  "🐸", "🐒", "🐔", "🐧", "🐦", "🐤",
                                  "🦆", "🦅", "🦉", "🦇", "🐺", "🐗",
                                  "🐴", "🦄", "🐝", "🪱", "🐛", "🦋",
                                  "🐌", "🐞", "🐜", "🪰", "🪲", "🪳",
                                  "🦟", "🦗", "🕷", "🦂", "🐢", "🐍",
                                  "🦎", "🦖"]
    
    let food: Array<String> = ["🍏", "🍎", "🍐", "🍊", "🍋", "🍌",
                               "🍉", "🍇", "🍓", "🫐", "🍈", "🍒",
                               "🍑", "🥭", "🍍", "🥥", "🥝", "🍅",
                               "🍆", "🥑", "🥦", "🥬", "🥒", "🌶",
                               "🫑", "🌽", "🥕", "🫒", "🧄", "🧅",
                               "🥔", "🍠", "🫑", "🌽"]
     
    func createMemoryGame(chosenCardDeck: CardDeck, chosenLevel: Level) -> MemoryGameModel<String> {
        switch chosenCardDeck {
        case .animal:
            return createEmoijMemoryGame(chosenLevel: chosenLevel, emoijSet: animals)
        case .food:
            return createEmoijMemoryGame(chosenLevel: chosenLevel, emoijSet: food)
        }
    }
    
    func createEmoijMemoryGame<T>(chosenLevel: Level, emoijSet: Array<T>) -> MemoryGameModel<T> {
        let cardPairs = getAmountOfPairs(chosenLevel: chosenLevel, cardCount: emoijSet.count)
        
        return MemoryGameModel<T>(numberOfPairsOfCards: cardPairs, cardContentFactory: { pairIndex in
            return emoijSet[pairIndex]
        })
    }

    func getAmountOfPairs(chosenLevel: Level, cardCount: Int) -> Int {
        switch chosenLevel {
        case .easy:
            return cardCount - 30
        case .medium:
            return cardCount - 20
        case .hard:
            return cardCount - 10
        }
    }
}
