import SwiftUI

struct MemoryGameView: View {
    
    @ObservedObject var viewModel: EmojiMemoryGameViewModel
    
    var body: some View {
        VStack{
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]){ // Karte soll mindestens 65 Punkte breit sein
                    ForEach(viewModel.cards){ card in
                        CardView(card: card)
                            .aspectRatio(2/3, contentMode: .fit)
                            .onTapGesture {
                            self.viewModel.choose(card: card)
                        }
                    }
                }
            }.padding(.horizontal)
        }
    }
}

struct CardView: View{
    
    var card: MemoryGameModel<String>.Card
    
    var body: some View{
        GeometryReader{
            geometry in self.body(for: geometry.size)
        }
    }
    
    func body (for size: CGSize) -> some View{
        ZStack{
            if card.isFaceUp {
                RoundedRectangle(cornerRadius: cornerRadius)
                    .fill(Color.white)
                RoundedRectangle(cornerRadius: cornerRadius)
                    .strokeBorder(lineWidth: edgeLineWidth)
                    .foregroundColor(.blue)
                Text(card.content)
                    .font(Font.system(size: fontSize(for: size)))
            } else if card.isMatched {
                RoundedRectangle(cornerRadius: cornerRadius)
                    .opacity(0) // Rechteck wird mit Farbe Weiss aufgefüllt
            }
            else{
                RoundedRectangle(cornerRadius: cornerRadius)
                    .fill(Color.blue)
            }
        }
    }
    
    // MARK: - Drawing Constants
    let cornerRadius = CGFloat(10)
    let edgeLineWidth = CGFloat(3)
    let cardSizeRatio = 0.75
    func fontSize(for size: CGSize) -> CGFloat {
        return min(size.width, size.height) * 0.65
    }
}

struct MemoryGameView_Previews: PreviewProvider {
    static var previews: some View {
        MemoryGameView(viewModel: EmojiMemoryGameViewModel())
    }
}

