import UIKit

final class LineShape: CAShapeLayer, ShapeLayerProtocol {
    // MARK: - Initializers
    required init(rect: CGRect, color: CGColor, fillColor: CGColor?, lineWidth: CGFloat = 10) {
        super.init()
        
        self.path = getPath(rect: rect).cgPath
        self.lineWidth = lineWidth
        self.strokeColor = color
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    private func getPath(rect: CGRect) -> UIBezierPath {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: rect.minX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        return path
    }
}
