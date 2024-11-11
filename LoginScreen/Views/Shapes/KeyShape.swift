import UIKit

class KeyShape: CAShapeLayer, ShapeLayerProtocol {
    // MARK: - Initializers
    required init(size: CGSize, fillColor: CGColor, lineWidth: CGFloat = 10) {
        super.init()
        
        self.path = getPath(size: size, lineWidth: lineWidth).cgPath
        self.lineCap = .round
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
        
        // Параметры для круга
        // Размер круга = ширины фигуры
        let circleSize = CGSize(width: size.width, height: size.width)
        let diameter = ([circleSize.width, circleSize.height].min() ?? 0)
        let radius = diameter / 2
        let circleCenter = CGPoint(x: size.width / 2, y: circleSize.height / 2)
        
        // Параметры ключа
        let margin = lineWidth / 2
        let lineOffset = size.height / 12
        let lineSpacing = lineOffset + margin
        let lineWidthOffset = size.width / 6

        // Круг
        path.addArc(withCenter: circleCenter, radius: radius, startAngle: 0, endAngle: .pi * 2, clockwise: true)
        path.close()
        
        // Ключ
        path.move(to: CGPoint(x: circleCenter.x, y: diameter))
        path.addLine(to: CGPoint(x: circleCenter.x, y: size.height))
        path.move(to: CGPoint(x: circleCenter.x, y: size.height - lineOffset))
        path.addLine(to: CGPoint(x: size.width, y: size.height - lineOffset))
        path.move(to: CGPoint(x: circleCenter.x, y: size.height - lineOffset - lineSpacing))
        path.addLine(to: CGPoint(x: size.width - lineWidthOffset, y: size.height - lineOffset - lineSpacing))

        return path
    }
}
