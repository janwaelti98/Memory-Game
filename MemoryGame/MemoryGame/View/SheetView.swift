import SwiftUI

struct SheetView: View {
    var viewModel: EmojiMemoryGameViewModel
    
    @Environment(\.dismiss) var dismiss
    @State var segmentationSelection : Level = .easy
    
    var body: some View {
        NavigationView {
            Group {
                VStack() {
                    SubTitle(title: "Level")
                    Picker("", selection: $segmentationSelection) {
                        ForEach(Level.allCases, id: \.self) { option in
                            Text(option.rawValue)
                        }
                    }.pickerStyle(SegmentedPickerStyle()).padding()
                }
                Spacer(minLength: 50)
                
                VStack(){
                    SubTitle(title: "Card Deck")
                
                    CardDeckMenuItem(name: "Food", icon: "🍉", color: Color.green).onTapGesture {
                        viewModel.startGame(chosenCardDeck: CardDeck.food, chosenLevel: segmentationSelection)
                        dismiss()
                    }
                    CardDeckMenuItem(name: "Animals", icon: "🐱", color: Color.blue).onTapGesture {
                        viewModel.startGame(chosenCardDeck: CardDeck.animal, chosenLevel: segmentationSelection)
                        dismiss()
                    }
                    CardDeckMenuItem(name: "Shapes", icon: "🔺", color: Color.red).onTapGesture {
                        //viewModel.startGame(chosenCardDeck: CardDeck.animal, chosenLevel: segmentationSelection))
                    }
                }
            }
               .navigationBarTitle(Text("Start new game"), displayMode: .inline)
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
