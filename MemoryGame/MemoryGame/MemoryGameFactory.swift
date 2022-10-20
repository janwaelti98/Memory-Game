import Foundation

class MemoryGameFactory {
    
    //public var chosenCardDeck: CardDeck
    
    init() {
        // TODO ???
    }
    
    func createMemoryGame(chosenCardDeck: CardDeck) -> MemoryGameModel<String> {
        switch chosenCardDeck {
        case .animal:
            return createAnimals()
        case .food:
            return createFood()
        }
    }
    
    func createAnimals()->MemoryGameModel<String>{
        let animals: Array<String> = ["🙈", "🙉", "🙊", "🦁", "🐮", "🐷",
                                      "🐸", "🐒", "🐔", "🐧", "🐦", "🐤",
                                      "🦆", "🦅", "🦉", "🦇", "🐺", "🐗",
                                      "🐴", "🦄", "🐝", "🪱", "🐛", "🦋",
                                      "🐌", "🐞", "🐜", "🪰", "🪲", "🪳",
                                      "🦟", "🦗", "🕷", "🦂", "🐢", "🐍",
                                      "🦎", "🦖"]
        
        return MemoryGameModel<String>(numberOfPairsOfCards: animals.count, cardContentFactory: { pairIndex in
            return animals[pairIndex]
        })
    }
    
    func createFood()->MemoryGameModel<String>{
        let food: Array<String> = ["🍏", "🍎", "🍐", "🍊", "🍋", "🍌",
                                   "🍉", "🍇", "🍓", "🫐", "🍈", "🍒",
                                   "🍑", "🥭", "🍍", "🥥", "🥝", "🍅",
                                   "🍆", "🥑", "🥦", "🥬", "🥒", "🌶",
                                   "🫑", "🌽", "🥕", "🫒", "🧄", "🧅",
                                   "🥔", "🍠", "🫑", "🌽"]
        
        return MemoryGameModel<String>(numberOfPairsOfCards: food.count, cardContentFactory: { pairIndex in
            return food[pairIndex]
        })
    }

}


enum CardDeck {
    case animal
    case food
}
