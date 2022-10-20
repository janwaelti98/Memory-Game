import SwiftUI

struct SheetView: View {
    @Environment(\.dismiss) var dismiss

    var body: some View {
        NavigationView {
            VStack(spacing: 20){
                CardDeck(name: "Nature", icon: "🍃", color: Color.green)
                CardDeck(name: "Animals", icon: "🐱", color: Color.blue)
                CardDeck(name: "Shapes", icon: "🔺", color: Color.red)
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

struct CardDeck: View {
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
        }.padding(.horizontal)
    }
}



// MARK: - Drawing Constants
let cornerRadius = 25
let edgeLineWidth = CGFloat(1)
