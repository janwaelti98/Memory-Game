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
     
    func createMemoryGame(chosenCardDeck: CardDeck, chosenLevel: Level, deviceHeight: CGFloat) -> MemoryGameModel<String> {
        switch chosenCardDeck {
        case .animal:
            return createEmoijMemoryGame(chosenLevel: chosenLevel, emoijSet: animals, deviceHeight: deviceHeight)
        case .food:
            return createEmoijMemoryGame(chosenLevel: chosenLevel, emoijSet: food, deviceHeight: deviceHeight)
        }
    }
    
    func createEmoijMemoryGame<T>(chosenLevel: Level, emoijSet: Array<T>, deviceHeight: CGFloat) -> MemoryGameModel<T> {
        let cardPairs = getAmountOfPairs(chosenLevel: chosenLevel, cardCount: emoijSet.count, deviceHeight: deviceHeight)
        
        return MemoryGameModel<T>(numberOfPairsOfCards: cardPairs, cardContentFactory: { pairIndex in
            return emoijSet[pairIndex]
        })
    }

    func getAmountOfPairs(chosenLevel: Level, cardCount: Int, deviceHeight: CGFloat) -> Int {
        var pairs: Int
        let maxAmoutOfPairs = deviceHeight / 20
        
        switch chosenLevel {
        case .easy:
            pairs = Int(maxAmoutOfPairs / 4)
            return pairs
        case .medium:
            pairs = Int(maxAmoutOfPairs / 3)
            return pairs
        case .hard:
            pairs = Int(maxAmoutOfPairs / 2)
            return pairs
        }
    }
}
