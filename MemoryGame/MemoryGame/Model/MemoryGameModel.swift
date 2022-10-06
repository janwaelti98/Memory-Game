import Foundation

struct MemoryGameModel<CardContent> {
    
    var cards: Array<Card>
    
    mutating func choose(card: Card){
        if let chosenIndex = index(of: card) {
            cards[chosenIndex].isFaceUp = !card.isFaceUp
        }
        print("card chosen: \(card)")
    }
    
    private func index(of card: Card) -> Int?{
           for index in 0..<cards.count {
               if self.cards[index].id ==
                   card.id {
                   return index
               }
           }
           return nil // --> 'null'
       }
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = Array<Card>()
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2+1))
        }
        cards.shuffle()
    }
    
    struct Card: Identifiable { // implementieret Identifiable protocol, damit durch Cards iterieret werden kann
        var isFaceUp: Bool = true
        var isMatched: Bool = false
        var content: CardContent
        var id: Int
    }
}

