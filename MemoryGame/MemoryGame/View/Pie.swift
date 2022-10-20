import SwiftUI

struct Pie: Shape {
    
    var startAngle: Angle
    var endAngle: Angle
    var clockwise = false // In welche Richtung Pie gezeichnet wird
    
    // rect --> rechteckige "Zeichenfläche"
    func path(in rect: CGRect) -> Path {
        
        let center = CGPoint(x: rect.midX, y: rect.midY)
        var p = Path() // Variable mit der gezeichnet wird
    
        p.move(to: center) // Startpunkt ins Zentrum setzen
        
        let radius = min(rect.width, rect.height) / 2
        // Oberer Startpunkt des Pies (Punkt oben Mitte)
        let start = CGPoint(x: center.x + radius * cos(CGFloat(startAngle.radians)),
                            y: center.y + radius * sin(CGFloat(startAngle.radians)))
        p.addLine(to: start) // Zeichne Linie von Center zu Start
        p.addArc(center: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: clockwise)
        p.addLine(to: center) // Zeichne Line von Enpunkt des Radius wieder ins Zentrum
        
        return p
    }
}



struct Pie_Previews: PreviewProvider {
    static var previews: some View {
        Pie(startAngle: Angle(degrees: 0-90),
            endAngle: Angle(degrees: 110-90))
            .foregroundColor(.red)
    }
}
