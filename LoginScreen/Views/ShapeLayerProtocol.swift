import CoreGraphics

protocol ShapeLayerProtocol {
    init(size: CGSize, fillColor: CGColor, lineWidth: CGFloat)
}

extension ShapeLayerProtocol {
    init() {
        fatalError("init() cannot be used")
    }
}
