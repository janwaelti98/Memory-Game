import SwiftUI

struct Cardify: AnimatableModifier { // damit Cardify animiert werden kann
    
    var isFaceUp: Bool {
        rotation < 90
    }
    
    var rotation: Double
    
    init(isFaceUp: Bool) {
        rotation = isFaceUp ? rotationUp : rotationDown
    }
    
    var animatableData: Double { // muss implementiert werden, wenn animiert werden soll
        get { rotation }
        set { rotation = newValue }
    }
    
    func body(content: Content) -> some View {
        ZStack {
            Group { // Fasst Code zuammen, erlaubt modifiers aufzurufen
                RoundedRectangle(cornerRadius: cornerRadius)
                    .fill(Color.white)
                RoundedRectangle(cornerRadius: cornerRadius)
                    .strokeBorder(lineWidth: edgeLineWidth)
                content
            }.opacity(isFaceUp ? opaque : transparent)
            RoundedRectangle(cornerRadius: cornerRadius).fill()
                .opacity(isFaceUp ? transparent : opaque)
        }
        .rotation3DEffect(Angle(degrees: rotation),
                          axis: (0,1,0))
    }
    
    // MARK: - Drawing Constants
    private let cornerRadius = CGFloat(10)
    private let edgeLineWidth: CGFloat = 3
    private let rotationUp = Double(0)
    private let rotationDown = Double(180)
    private let transparent = Double(0)
    private let opaque = Double(1)
}

extension View{
    
    func cardify(isFaceUp: Bool)-> some View{
        return self.modifier(Cardify(isFaceUp: isFaceUp))
    }
}
