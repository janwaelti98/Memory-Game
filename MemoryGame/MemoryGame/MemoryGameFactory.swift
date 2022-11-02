import Foundation

class MemoryGameFactory {
    
    init() {}
    
    func createMemoryGame(chosenCardDeck: CardDeck, chosenLevel: Level) -> MemoryGameModel<String> {
        switch chosenCardDeck {
        case .animal:
            return createAnimals(chosenLevel: chosenLevel)
        case .food:
            return createFood(chosenLevel: chosenLevel)
        }
    }
    
    func createAnimals(chosenLevel: Level) -> MemoryGameModel<String>{
        let animals: Array<String> = ["🙈", "🙉", "🙊", "🦁", "🐮", "🐷",
                                      "🐸", "🐒", "🐔", "🐧", "🐦", "🐤",
                                      "🦆", "🦅", "🦉", "🦇", "🐺", "🐗",
                                      "🐴", "🦄", "🐝", "🪱", "🐛", "🦋",
                                      "🐌", "🐞", "🐜", "🪰", "🪲", "🪳",
                                      "🦟", "🦗", "🕷", "🦂", "🐢", "🐍",
                                      "🦎", "🦖"]
        
        let cardPairs = getAmountOfPairs(chosenLevel: chosenLevel, cardCount: animals.count)
        
        return MemoryGameModel<String>(numberOfPairsOfCards: cardPairs, cardContentFactory: { pairIndex in
            return animals[pairIndex]
        })
    }
    
    func createFood(chosenLevel: Level) -> MemoryGameModel<String>{
        let food: Array<String> = ["🍏", "🍎", "🍐", "🍊", "🍋", "🍌",
                                   "🍉", "🍇", "🍓", "🫐", "🍈", "🍒",
                                   "🍑", "🥭", "🍍", "🥥", "🥝", "🍅",
                                   "🍆", "🥑", "🥦", "🥬", "🥒", "🌶",
                                   "🫑", "🌽", "🥕", "🫒", "🧄", "🧅",
                                   "🥔", "🍠", "🫑", "🌽"]
        
        let cardPairs = getAmountOfPairs(chosenLevel: chosenLevel, cardCount: food.count)
        
        return MemoryGameModel<String>(numberOfPairsOfCards: cardPairs, cardContentFactory: { pairIndex in
            return food[pairIndex]
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

enum CardDeck {
    case animal
    case food
}

enum Level : String, CaseIterable {
    case easy = "easy"
    case medium = "medium"
    case hard = "hard"
}
