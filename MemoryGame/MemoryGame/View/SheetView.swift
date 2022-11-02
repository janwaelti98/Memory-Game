import SwiftUI

struct SheetView: View {
    var viewModel: EmojiMemoryGameViewModel
    
    @Environment(\.dismiss) var dismiss
    @State var chosenLevel : Level = .medium
    
    var body: some View {
        NavigationView {
            Group {
                VStack() {
                    SubTitle(title: "Level")
                    Picker("", selection: $chosenLevel) {
                        ForEach(Level.allCases, id: \.self) { option in
                            Text(option.rawValue)
                        }
                    }.pickerStyle(SegmentedPickerStyle()).padding()
                }
                Spacer(minLength: 50)
                
                VStack(){
                    SubTitle(title: "Card Deck")
                
                    CardDeckMenuItem(name: "Food", icon: "🍉", color: Color.green).onTapGesture {
                        withAnimation(.easeInOut(duration: 0.6).delay(0.1)) {
                            viewModel.startGame(chosenCardDeck: CardDeck.food, chosenLevel: chosenLevel)
                        }
                        dismiss()
                    }
                    CardDeckMenuItem(name: "Animals", icon: "🐱", color: Color.blue).onTapGesture {
                        withAnimation(.easeInOut.delay(0.1)) {
                            viewModel.startGame(chosenCardDeck: CardDeck.animal, chosenLevel: chosenLevel)
                        }
                        dismiss()
                    }
                    CardDeckMenuItem(name: "Shapes", icon: "🔺", color: Color.red).onTapGesture {
                        // TODO:
                    }
                }
            }
               .navigationBarTitle(Text("New game"), displayMode: .inline)
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

struct SubTitle: View {
  let title: String

  var body: some View {
    Text(title)
      .font(.title)
      .fontWeight(.bold)
      .padding()
      .frame(maxWidth: .infinity, alignment: .leading)
  }
}



// MARK: - Drawing Constants
let cornerRadius = 25
let edgeLineWidth = CGFloat(1)
