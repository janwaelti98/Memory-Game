import SwiftUI

struct CardView: View{
    
    var card: MemoryGameModel<String>.Card
    
    var body: some View {
        GeometryReader { geometry in
            self.body(for: geometry.size)
        }
    }
    
    @State
    private var animatedBonusRemaining: Double = 0
    
    private func startBonusTimeAnimation() {
        animatedBonusRemaining = card.bonusRemaining
        print(animatedBonusRemaining)
        withAnimation(.linear(duration: card.bonusTimeRemaining)){
            animatedBonusRemaining = 0
        }
    }
    
    @ViewBuilder
    private func body(for size: CGSize)-> some View {
        if card.isFaceUp || !card.isMatched {
            ZStack{
                Group{
                    if card.isConsumingBonusTime {
                        Pie(startAngle: Angle(degrees: rotationStart + rotationOffset),
                            endAngle: Angle(degrees: -animatedBonusRemaining * rotationEnd + rotationOffset),clockwise: true)
                            .onAppear{
                                self.startBonusTimeAnimation()
                        }
                    }
                    else{
                        Pie(startAngle: Angle(degrees: rotationStart + rotationOffset),
                            endAngle: Angle(degrees: -card.bonusTimeRemaining * rotationEnd + rotationOffset ),clockwise: true)
                    }
                }.padding(5)
                    .opacity(opacity)
                Text(card.content)
                    .font(Font.system(size: fontSize(for: size)))
                    .rotationEffect(Angle(degrees: card.isMatched ? rotationEnd : rotationStart))
                    .animation(card.isMatched ? Animation.linear(duration: contentRotationDuration).repeatForever(autoreverses: false) : .default, value: card.isMatched)
            }
            .cardify(isFaceUp: card.isFaceUp)
            .transition(.scale)
        }
    }
    
    // MARK: - Drawing Constants
    private let opacity = Double(0.4)
    private let cornerRadius = CGFloat(10)
    private let edgeLineWidth = CGFloat(3)
    private func fontSize(for size: CGSize)->CGFloat{
        min(size.width, size.height) * 0.7
    }
    private let startAngleConstant = Double(0-90)
    private let endAngleConstant = Double(360 - 90)
    private let rotationOffset = Double(-90)
    private let rotationStart = Double.zero
    private let rotationEnd = Double(360)
    private let contentRotationDuration = Double(1)
    
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGameViewModel()
        game.choose(card: game.cards[0])
        return CardView(card: game.cards[0])
    }
}
