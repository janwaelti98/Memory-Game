import SwiftUI

struct SheetView: View {
    var viewModel: EmojiMemoryGameViewModel
    
    @Environment(\.dismiss) var dismiss
    @State var chosenLevel : Level = .medium
    
    @Environment(\.horizontalSizeClass) var sizeClass
    @Environment(\.dynamicTypeSize) var typeSize
    
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
                Spacer(minLength: verticalSpace)
                
                VStack(){
                    SubTitle(title: "Card Deck")
                    List {
                        CardDeckMenuItem(name: "Food", icon: "🍉").onTapGesture {
                            withAnimation(.easeInOut(duration: 0.6).delay(0.1)) {
                                viewModel.startEmoijGame(chosenCardDeck: CardDeck.food, chosenLevel: chosenLevel)
                            }
                            dismiss()
                        }
                        CardDeckMenuItem(name: "Animals", icon: "🐱").onTapGesture {
                            withAnimation(.easeInOut.delay(0.1)) {
                                viewModel.startEmoijGame(chosenCardDeck: CardDeck.animal, chosenLevel: chosenLevel)
                            }
                            dismiss()
                        }
                        CardDeckMenuItem(name: "Shapes", icon: "🔺").onTapGesture {
                            // TODO:
                        }
                    }
                }
                Spacer(minLength: verticalSpace)
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
    
    var body: some View {
            HStack() {
                    Text(icon).font(.system(size: iconSize))
                    Text(name).font(.system(.title2)).padding()
            }
            .frame(  maxWidth: .infinity)
            .contentShape(Rectangle())
            .alignmentGuide(
                            .listRowSeparatorLeading
                        ) { dimensions in
                            dimensions[.leading]
                        }
            .alignmentGuide(
                            .listRowSeparatorTrailing
                        ) { dimensions in
                            dimensions[.trailing]
                        }
            .padding(10)
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
let iconSize = CGFloat(50)
let edgeLineWidth = CGFloat(1)
let verticalSpace = CGFloat(40)
