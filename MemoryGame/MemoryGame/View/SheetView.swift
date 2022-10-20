import SwiftUI

struct SheetView: View {
    @Environment(\.dismiss) var dismiss
    var viewModel: EmojiMemoryGameViewModel

    var body: some View {
        NavigationView {
            VStack(spacing: 20){
                CardDeckMenuItem(name: "Food", icon: "🍉", color: Color.green).onTapGesture {
                    viewModel.startGame(chosenCardDeck: CardDeck.food)
                    dismiss()
                }
                CardDeckMenuItem(name: "Animals", icon: "🐱", color: Color.blue).onTapGesture {
                    viewModel.startGame(chosenCardDeck: CardDeck.animal)
                    dismiss()
                }
                CardDeckMenuItem(name: "Shapes", icon: "🔺", color: Color.red).onTapGesture {
                    //viewModel.startGame(chosenCardDeck: CardDeck.animal)
                }
            }
               .navigationBarTitle(Text("Choose card deck"), displayMode: .inline)
                   .navigationBarItems(trailing: Button(action: {
                       dismiss()
                   }) {
                       Text("Done").bold()
                   })
           }
    }
}

struct CardDeckMenuItem: View {
    var name: String
    var icon: String
    var color: Color
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25, style: .continuous)
                .fill(color)
                
            HStack() {
                Text(icon)
                Text(name).font(.system(.title))
            }
            .padding()
            .multilineTextAlignment(.leading)
        }
        .padding(.horizontal)
        .aspectRatio(3/1, contentMode: .fit)
    }
}



// MARK: - Drawing Constants
let cornerRadius = 25
let edgeLineWidth = CGFloat(1)
