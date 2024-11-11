import UIKit

class KeyholeShape: CAShapeLayer, ShapeLayerProtocol {
    // MARK: - Initializers
    required init(size: CGSize, fillColor: CGColor, lineWidth: CGFloat = 10) {
        super.init()
        
        self.path = getPath(size: size, lineWidth: lineWidth).cgPath
        self.lineWidth = lineWidth
        self.strokeColor = fillColor
        self.fillColor = nil
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    private func getPath(size: CGSize, lineWidth: CGFloat) -> UIBezierPath {
        let path = UIBezierPath()
        
        // Размер круга = 1/2 общей ширины
        let circleSize = CGSize(width: size.width / 2, height: size.width / 2)
        let diameter = ([circleSize.width, circleSize.height].min() ?? 0)
        let radius = diameter / 2
        let circleCenter = CGPoint(x: size.width / 2, y: circleSize.height / 2)
        let margin = lineWidth / 2

        // Круг
        path.addArc(withCenter: circleCenter, radius: radius, startAngle: 0, endAngle: .pi * 2, clockwise: true)
        path.close()
        
        // Ключ
        path.move(to: CGPoint(x: circleCenter.x, y: diameter + margin))
        path.addLine(to: CGPoint(x: size.width, y: size.height))
        path.addLine(to: CGPoint(x: 0, y: size.height))
        path.addLine(to: CGPoint(x: circleCenter.x, y: diameter + margin))

        return path
    }
}
