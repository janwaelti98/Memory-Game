import SwiftUI

struct CardView: View {
    
    var card: MemoryGameModel<String>.Card
    
    var body: some View{
        GeometryReader{geometry in
            self.body(for: geometry.size)
        }
    }
    
    @ViewBuilder // kann auch Empty Views zurückgeben
    private func body(for size: CGSize)-> some View{
        if (card.isFaceUp || !card.isMatched) { //--> gibt Empty View zurück falls im else Block
            ZStack{
                Pie(startAngle: Angle(degrees: 0-90), endAngle: Angle(degrees: 110-90),clockwise: true) // - 90, da Startpunkt 0,0 an rechte Seite ist
                    .padding(5)
                    .opacity(opacity)
                Text(card.content)
                    .font(Font.system(size: fontSize(for: size)))
            }
            .cardify(isFaceUp: card.isFaceUp)
        }
    }
    
    // MARK: - Drawing Constants
    private let opacity = Double(0.4)
    private let edgeLineWidth = CGFloat(3)
    private func fontSize(for size: CGSize)->CGFloat{
        min(size.width, size.height) * 0.6
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGameViewModel()
        game.choose(card: game.cards[0])
        return CardView(card: game.cards[0])
    }
}
