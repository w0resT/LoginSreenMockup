import CoreGraphics

protocol ShapeLayerProtocol {
    init(rect: CGRect, color: CGColor, fillColor: CGColor?, lineWidth: CGFloat)
}

extension ShapeLayerProtocol {
    init() {
        fatalError("init() cannot be used")
    }
}
