import Foundation
import SwiftUI



struct HeartShape: Shape, Equatable {
    var fillColor: Color
    var lineThickness: Int
    
    func path(in rect: CGRect) -> Path {
        let size = min(rect.width, rect.height)
        let xOffset = (rect.width > rect.height) ? (rect.width - rect.height) / 2.0 : 0.0
        let yOffset = (rect.height > rect.width) ? (rect.height - rect.width) / 2.0 : 0.0

        func offsetPoint(p: CGPoint) -> CGPoint {
            return CGPoint(x: p.x + xOffset, y: p.y+yOffset)
        }
        var path = Path().strokedPath(StrokeStyle.init(lineWidth: CGFloat(lineThickness)))

        path.move(to: offsetPoint(p: (CGPoint(x: (size * 0.50), y: (size * 0.25)))))
        path.addCurve(to: offsetPoint(p: CGPoint(x: 0, y: (size * 0.25))),
                      control1: offsetPoint(p: CGPoint(x: (size * 0.50), y: (-size * 0.10))),
                      control2: offsetPoint(p: CGPoint(x: 0, y: 0)))
        path.addCurve(to: offsetPoint(p: CGPoint(x: (size * 0.50), y: size)),
                      control1: offsetPoint(p: CGPoint(x: 0, y: (size * 0.60))),
                      control2: offsetPoint(p: CGPoint(x: (size * 0.50), y: (size * 0.80))))
        path.addCurve(to: offsetPoint(p: CGPoint(x: size, y: (size * 0.25))),
                      control1: offsetPoint(p: CGPoint(x: (size * 0.50), y: (size * 0.80))),
                      control2: offsetPoint(p: CGPoint(x: size, y: (size * 0.60))))
        path.addCurve(to: offsetPoint(p: CGPoint(x: (size * 0.50), y: (size * 0.25))),
                      control1: offsetPoint(p: CGPoint(x: size, y: 0)),
                      control2: offsetPoint(p: CGPoint(x: (size * 0.50), y: (-size * 0.10))))
        
        return path.fill(fillColor) as! Path
    }
    
    static func == (lhs: HeartShape, rhs: HeartShape) -> Bool {
        return type(of: lhs) == type(of: rhs)
        }
}

struct RegularPolygonShape: Shape, Equatable {
    var sides:Int
    var fillColor: Color
    var lineThickness: Int

    func path(in rect: CGRect) -> Path {
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let r = Double(min(rect.width,rect.height)) / 2.0
        var vertices:[CGPoint] = []
        for i in 0...sides {
            let angle = (2.0 * Double.pi * Double(i)/Double(sides))
            let pt = Cartesian(length: r, angle: angle)
            // Move the point relative to the center of the rect and add to vertices
            vertices.append(CGPoint(x: pt.x + center.x, y: pt.y + center.y))
        }
        var path = Path().strokedPath(StrokeStyle.init(lineWidth: CGFloat(lineThickness)))
        
        for (n, pt) in vertices.enumerated() {
            print("\(n)   vertices.append(CGPoint(x: \(pt.x), y:\(pt.y)))")
            n == 0 ? path.move(to: pt) : path.addLine(to: pt)
        }
        path.closeSubpath()
        
        return path.fill(fillColor) as! Path
    }
    
    func Cartesian(length:Double, angle:Double) -> CGPoint {
        return CGPoint(x: length * cos(angle), y: length * sin(angle))
    }
    
    static func == (lhs: RegularPolygonShape, rhs: RegularPolygonShape) -> Bool {
        return (type(of: lhs) == type(of: rhs) && lhs.sides == rhs.sides)
    }
}

struct CircleShape: Shape, Equatable {
    var fillColor: Color
    var lineThickness: Int
    
    func path(in rect: CGRect) -> Path {
        
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let radius = min(rect.width, rect.height) / 2
        var path = Path().strokedPath(StrokeStyle.init(lineWidth: CGFloat(lineThickness)))
        
        path.addArc(center: center, radius: radius, startAngle: Angle(degrees: 0.0), endAngle: Angle(degrees: 360.0), clockwise: true)
        
        return path.fill(fillColor) as! Path
    }
    
    static func == (lhs: CircleShape, rhs: CircleShape) -> Bool {
        return type(of: lhs) == type(of: rhs)
    }
}

extension Shape where Self : Equatable {
    
    func isEqualTo(other: any Shape) -> Bool {
        if let o = other as? Self {
            return self == o
        }
        return false
    }
}

struct Shape_Previews: PreviewProvider {
    static var previews: some View {
        VStack() {
            HeartShape(fillColor: Color.red, lineThickness: 2)
            RegularPolygonShape(sides: 5, fillColor: Color.blue, lineThickness: 1)
            CircleShape(fillColor: Color.yellow, lineThickness: 3)
        }
    }
}
