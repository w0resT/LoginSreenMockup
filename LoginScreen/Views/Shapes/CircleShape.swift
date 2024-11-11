import UIKit

class CircleShape: CAShapeLayer, ShapeLayerProtocol {
    // MARK: - Initializers
    required init(size: CGSize, fillColor: CGColor, lineWidth: CGFloat = 10) {
        super.init()
        
        self.path = getPath(size: size).cgPath
        self.lineWidth = lineWidth
        self.strokeColor = fillColor
        self.fillColor = nil
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    private func getPath(size: CGSize) -> UIBezierPath {
        let radius = ([size.width, size.height].min() ?? 0) / 2
        let center = CGPoint(x: size.width / 2, y: size.height / 2)
        
        let path = UIBezierPath()
        path.addArc(withCenter: center, radius: radius, startAngle: 0, endAngle: .pi * 2, clockwise: true)
        path.close()
        return path
    }
}
