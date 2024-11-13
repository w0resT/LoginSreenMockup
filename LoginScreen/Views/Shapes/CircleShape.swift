import UIKit

final class CircleShape: CAShapeLayer, ShapeLayerProtocol {
    // MARK: - Initializers
    required init(rect: CGRect, color: CGColor, fillColor: CGColor?, lineWidth: CGFloat = 10) {
        super.init()
        
        self.path = getPath(rect: rect).cgPath
        self.lineWidth = lineWidth
        self.strokeColor = color
        self.fillColor = fillColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    private func getPath(rect: CGRect) -> UIBezierPath {
        let radius = ([rect.width, rect.height].min() ?? 0) / 2
        let center = CGPoint(x: rect.minX + rect.width / 2, y: rect.minY + rect.height / 2)
        
        let path = UIBezierPath()
        path.addArc(withCenter: center, radius: radius, startAngle: 0, endAngle: .pi * 2, clockwise: true)
        path.close()
        return path
    }
}
