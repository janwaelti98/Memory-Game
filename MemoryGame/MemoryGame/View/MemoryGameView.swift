import SwiftUI

struct MemoryGameView: View {
    
    var viewModel: EmojiMemoryGameViewModel
    
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
    
    var card: MemoryGame<String>.Card
    
    var body: some View{
        ZStack{
            if card.isFaceUp{
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.white)
                RoundedRectangle(cornerRadius: 10)
                    .stroke(lineWidth: 3)
                    .foregroundColor(.blue)
                Text(card.content)
                    .font(.largeTitle)
            }
            else{
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.blue)
            }
        }.aspectRatio(0.75, contentMode: .fit)
    }
}

struct MemoryGameView_Previews: PreviewProvider {
    static var previews: some View {
        MemoryGameView(viewModel: EmojiMemoryGameViewModel())
    }
}
