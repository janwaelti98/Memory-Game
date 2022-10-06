import SwiftUI

struct MemoryGameView: View {
    
    @ObservedObject var viewModel: EmojiMemoryGameViewModel
    
    var body: some View {
        HStack{
            ForEach(viewModel.cards){ card in
                CardView(card: card).onTapGesture {
                    self.viewModel.choose(card: card)
                }
            }
        }.frame(height: 100, alignment: .center)
            .padding()
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
               if card.isFaceUp{
                   RoundedRectangle(cornerRadius: cornerRadius)
                       .fill(Color.white)
                   RoundedRectangle(cornerRadius: cornerRadius)
                       .stroke(lineWidth: 3)
                       .foregroundColor(.blue)
                   Text(card.content)
                       .font(Font.system(size: fontSize(for: size)))
               }
               else{
                   RoundedRectangle(cornerRadius: cornerRadius)
                       .fill(Color.blue)
               }
           }.aspectRatio(0.75, contentMode: .fit)
    }
    
    // Mark: - Drawing Constants
    let cornerRadius = CGFloat(10)
    let edgeLineWidth = CGFloat(3)
    func fontSize(for size: CGSize) -> CGFloat {
        return min(size.width, size.height) * 0.65
    }
}

struct MemoryGameView_Previews: PreviewProvider {
    static var previews: some View {
        MemoryGameView(viewModel: EmojiMemoryGameViewModel())
    }
}

