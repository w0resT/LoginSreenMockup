import UIKit

final class KeyShape: CAShapeLayer, ShapeLayerProtocol {
    // MARK: - Initializers
    required init(rect: CGRect, color: CGColor, fillColor: CGColor?, lineWidth: CGFloat = 10) {
        super.init()
        
        self.path = getPath(rect: rect, lineWidth: lineWidth).cgPath
        self.lineCap = .round
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
        
        // Параметры для круга
        // Размер круга = ширины фигуры
        let circleSize = CGSize(width: rect.width, height: rect.width)
        let diameter = circleSize.width
        let radius = diameter / 2
        let circleCenter = CGPoint(x: rect.minX + rect.width / 2, y: rect.minY + circleSize.height / 2)
        
        // Параметры ключа
        let margin = lineWidth / 2
        let lineOffset = rect.height / 12
        let lineSpacing = lineOffset + margin
        let lineWidthOffset = rect.width / 6

        // Круг
        path.addArc(withCenter: circleCenter, radius: radius, startAngle: 0, endAngle: .pi * 2, clockwise: true)
        path.close()
        
        // Ключ
        path.move(to: CGPoint(x: circleCenter.x, y: rect.minY + diameter))
        path.addLine(to: CGPoint(x: circleCenter.x, y: rect.maxY))
        path.move(to: CGPoint(x: circleCenter.x, y: rect.maxY - lineOffset))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY - lineOffset))
        path.move(to: CGPoint(x: circleCenter.x, y: rect.maxY - lineOffset - lineSpacing))
        path.addLine(to: CGPoint(x: rect.maxX - lineWidthOffset, y: rect.maxY - lineOffset - lineSpacing))

        return path
    }
}
