import SwiftUI

struct MemoryGameView: View {
    
    @ObservedObject var viewModel: EmojiMemoryGameViewModel
    
    @State private var showingSheet = false
    
    
    var body: some View {
        VStack{
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]){
                    ForEach(viewModel.cards){ card in
                        CardView(card: card)
                            .aspectRatio(2/3, contentMode: .fit)
                            .onTapGesture {
                            self.viewModel.choose(card: card)
                        }
                    }
                }.foregroundColor(Color.blue)
            }.padding(.horizontal)
        }
        Button("New Game") {
                    showingSheet.toggle()
                }
                .sheet(isPresented: $showingSheet) {
                    SheetView()
                }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        // eine Karte soll immer umgedreht sein, zu beginn (nur für Entwicklung)
        let game = EmojiMemoryGameViewModel()
        game.choose(card: game.cards[0])
        return MemoryGameView(viewModel: game)
    }
}
