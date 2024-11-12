import UIKit

class KeyholeShape: CAShapeLayer, ShapeLayerProtocol {
    // MARK: - Initializers
    required init(rect: CGRect, color: CGColor, fillColor: CGColor?, lineWidth: CGFloat = 10) {
        super.init()
        
        self.path = getPath(rect: rect, lineWidth: lineWidth).cgPath
        self.lineWidth = lineWidth
        self.strokeColor = color
        self.fillColor = fillColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    private func getPath(rect: CGRect, lineWidth: CGFloat) -> UIBezierPath {
        let path = UIBezierPath()
        
        // Размер круга = 1/2 общей ширины
        let circleSize = CGSize(width: rect.width / 2, height: rect.width / 2)
        let diameter = circleSize.width
        let radius = diameter / 2
        let circleCenter = CGPoint(x: rect.minX + rect.width / 2, y: rect.minY + circleSize.height / 2)
        let margin = lineWidth / 2

        // Круг
        path.addArc(withCenter: circleCenter, radius: radius, startAngle: 0, endAngle: .pi * 2, clockwise: true)
        path.close()
        
        // Ключ
        path.move(to: CGPoint(x: circleCenter.x, y: rect.minY + diameter + margin))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: circleCenter.x, y: rect.minY + diameter + margin))

        return path
    }
}
