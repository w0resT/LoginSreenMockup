import UIKit

class LineShape: CAShapeLayer, ShapeLayerProtocol {
    // MARK: - Initializers
    required init(size: CGSize, fillColor: CGColor, lineWidth: CGFloat = 10) {
        super.init()
        
        self.path = getPath(size: size).cgPath
        self.lineWidth = lineWidth
        self.strokeColor = fillColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    private func getPath(size: CGSize) -> UIBezierPath {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: size.width, y: size.height))
        return path
    }
}
