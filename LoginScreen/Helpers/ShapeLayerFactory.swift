import UIKit

enum Shapes {
    case line
    case circle
    case key
    case keyhole
}

struct ShapeLayerFactory {
    func get(shape: Shapes, rect: CGRect, color: CGColor, fillColor: CGColor?, lineWidth: CGFloat = 10) -> ShapeLayerProtocol {
        switch shape {
        case .line:
            return LineShape(rect: rect, color: color, fillColor: fillColor, lineWidth: lineWidth)
        case .circle:
            return CircleShape(rect: rect, color: color, fillColor: fillColor, lineWidth: lineWidth)
        case .key:
            return KeyShape(rect: rect, color: color, fillColor: fillColor, lineWidth: lineWidth)
        case .keyhole:
            return KeyholeShape(rect: rect, color: color, fillColor: fillColor, lineWidth: lineWidth)
        }
    }
}
