import SwiftUI

struct Cardify: ViewModifier{
    
    var isFaceUp: Bool
    func body(content: Content) -> some View {
        ZStack {
            if isFaceUp {
                RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white)
                RoundedRectangle(cornerRadius: cornerRadius).strokeBorder(lineWidth: edgeLineWidth)
                content // Element welche man "Cardifyen" möchte (als Karte darstellen)
            }
            else {
                RoundedRectangle(cornerRadius: cornerRadius)
            }
        }
    }
    
    // MARK: - Drawing Constants
    private let cornerRadius = CGFloat(10)
    private let edgeLineWidth = CGFloat(3)
}


// Extended View, damit man ohne Modifier Keyword Cardify auf einer View aufrufen kann
extension View{
    
    func cardify(isFaceUp: Bool)-> some View{
        return self.modifier(Cardify(isFaceUp: isFaceUp))
    }
}
