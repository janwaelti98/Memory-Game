import Foundation
import SwiftUI

enum CardDeck {
    case animal
    case food
    case shape
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
    
    
    func createShapes() -> Array<any Shape> {
        let randomColor = [Color.yellow, Color.green, Color.red, Color.blue, Color.orange].randomElement()!
        let randomNumberOfSites = Int.random(in: 1...6)
        let randomLineThickness = Int.random(in: 1...6)
        
        let shapes: Array<any Shape> = [CircleShape(fillColor: randomColor, lineThickness: randomLineThickness), RegularPolygonShape(sides: randomNumberOfSites, fillColor: randomColor, lineThickness: randomLineThickness), HeartShape(fillColor: randomColor, lineThickness: randomLineThickness)]
        
        return shapes
    }
    
    
    func createEmoijMemoryGame(chosenCardDeck: CardDeck, chosenLevel: Level, deviceHeight: CGFloat) -> MemoryGameModel<String> {
        if(chosenCardDeck == .animal) {
            let cardPairs = getAmountOfPairs(chosenLevel: chosenLevel, cardCount: animals.count, deviceHeight: deviceHeight)
            
            return MemoryGameModel<String>(numberOfPairsOfCards: cardPairs, cardContentFactory: { pairIndex in
                return animals[pairIndex]
            })
        }
        else {
            let cardPairs = getAmountOfPairs(chosenLevel: chosenLevel, cardCount: food.count, deviceHeight: deviceHeight)
                        
            return MemoryGameModel<String>(numberOfPairsOfCards: cardPairs, cardContentFactory: { pairIndex in
                return food[pairIndex]
            })
        }
    }
    
    /*
    func createShapeMemoryGame(chosenCardDeck: CardDeck, chosenLevel: Level, deviceHeight: CGFloat) -> MemoryGameModel<Shape> {
        if(chosenCardDeck == .shape) {
            let cardPairs = getAmountOfPairs(chosenLevel: chosenLevel, cardCount: createShapes().count, deviceHeight: deviceHeight)
            
            return MemoryGameModel<Shape>(numberOfPairsOfCards: cardPairs, cardContentFactory: { pairIndex in
                return createShapes()[pairIndex]
            })
        }
    }
     */
    
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
