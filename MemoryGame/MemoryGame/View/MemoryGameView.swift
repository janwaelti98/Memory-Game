import SwiftUI

struct MemoryGameView: View {
    
    @ObservedObject
    var viewModel: EmojiMemoryGameViewModel
    
    @State
    private var showingSheet = true
    
    
    var body: some View {
        Text("Score: \(viewModel.currentScore)")
        VStack{
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: minimumColumnWidth))]) {
                    ForEach(viewModel.cards){ card in
                        CardView(card: card)
                            .aspectRatio(cardAspectRatio, contentMode: .fit)
                            .onTapGesture {
                                withAnimation(.linear(duration: rotationDuration)) {
                                    self.viewModel.choose(card: card)
                                }
                        }
                    }
                }.foregroundColor(Color.blue)
            }.padding(.horizontal)
        }
        Button("New Game") {
                    showingSheet.toggle()
                }
                .sheet(isPresented: $showingSheet) {
                    SheetView(viewModel: viewModel)
                }
    }
    // MARK: - Drawing Constants
    private let minimumColumnWidth = Double(65)
    private let rotationDuration = Double(0.75)
    private let cardAspectRatio = CGFloat(0.7)
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGameViewModel()
        game.choose(card: game.cards[0])
        return MemoryGameView(viewModel: game)
    }
}
