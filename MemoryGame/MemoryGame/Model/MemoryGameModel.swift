import Foundation

struct MemoryGameModel<CardContent> where CardContent: Equatable {
    
    var cards: Array<Card>
    //var chosenCardDeck: MemoryGameFactory.CardDeck
    
    private var indexOfFaceUpCard: Int? {
        get{
            cards.indices.filter { cards[$0].isFaceUp }.only // $0 -> erstes Paramter von .filter - Funktion
                // .only -> Extenion Funktion von Array
        }
        set {
            for index in cards.indices {
                cards[index].isFaceUp = (index == newValue)
            }
        }
    }
    
    mutating func choose(card: Card){
        print("card chosen: \(card)")
        
        if let chosenIndex = cards.firstIndex(matching: card),
           !cards[chosenIndex].isFaceUp,
           !cards[chosenIndex].isMatched
        { // alle Bedingungen true für if - Block (Karte darf nicht faceUp & matched sein
            if let potentialMatchIndex = indexOfFaceUpCard {
                // Match?
                if cards[chosenIndex].content == cards[potentialMatchIndex].content { // Card content muss vergleichbar sein -> CardContent: Equatable
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                }
                self.cards[chosenIndex].isFaceUp = true
            }
            // kein Match
            else {
                indexOfFaceUpCard = chosenIndex
            }
        }
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
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
        var id: Int
    }
}
