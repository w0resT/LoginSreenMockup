import UIKit

struct ShapeColors {
    static let primaryClr = UIColor(hex: "#7668dd").cgColor
    static let secondaryClr = UIColor(hex: "#e0daf8").cgColor
    static let gradientClr = ["#18069a", "#8271f0"]
}

final class BackgroundView: UIView {
    
    // MARK: - Private Properties
    private let factory = ShapeLayerFactory()
    
    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .white
        
        setupLayers()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Setup Layers
private extension BackgroundView {
    func setupLayers() {
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let window = windowScene.windows.first
        else { return }
        
        setupBackgroundLayer(frame: window.bounds)
        setupKeyholeLayer(frame: window.bounds)
        setupKeysLayer()
        setupCirclesLayer(frame: window.bounds)
        setupLinesLayer(frame: window.bounds)
        
        self.clipsToBounds = true
    }
    
    func setupBackgroundLayer(frame: CGRect) {
        let rect = CGRect( x: -Int(frame.midX),
                                   y: -Int(frame.height / 4),
                                   width: Int(frame.width * 2),
                                   height: Int(frame.width * 2))
        
        let circle = factory.get(shape: .circle,
                                 rect: rect,
                                 color: UIColor.black.cgColor,
                                 fillColor: UIColor.black.cgColor) as! CAShapeLayer
        let gradient = getGradient(colors: ShapeColors.gradientClr, frame: frame)
        gradient.mask = circle
        
        self.layer.insertSublayer(gradient, at: 1)
    }
    
    func setupKeyholeLayer(frame: CGRect) {
        let rect = CGRect(x: 80, y: Int(frame.maxY - 360), width: 85, height: 280)
        let keyhole = factory.get(shape: .keyhole,
                                  rect: rect,
                                  color: ShapeColors.secondaryClr,
                                  fillColor: nil,
                                  lineWidth: 70) as! CAShapeLayer
        
        self.layer.insertSublayer(keyhole, at: 0)
    }
    
    func setupKeysLayer() {
        let rect1 = CGRect(x: -35, y: 150, width: 80, height: 210)
        let rect2 = CGRect(x: 50, y: 240, width: 40, height: 100)
        
        let key1 = factory.get(shape: .key,
                               rect: rect1,
                               color: ShapeColors.primaryClr,
                               fillColor: nil,
                               lineWidth: 20) as! CAShapeLayer
        let key2 = factory.get(shape: .key,
                               rect: rect2,
                               color: ShapeColors.primaryClr,
                               fillColor: nil,
                               lineWidth: 12) as! CAShapeLayer
        key2.transform = CATransform3DMakeRotation(-.pi/4, 0, 0, 1)
        
        self.layer.addSublayer(key1)
        self.layer.addSublayer(key2)
    }
    
    func setupCirclesLayer(frame: CGRect) {
        let rect1 = CGRect(x: Int(frame.midX + 70), y: -15, width: 30, height: 30)
        let rect2 = CGRect(x: Int(frame.maxX - 150), y: Int(frame.maxY - 240), width: 120, height: 120)
        
        let circles = [
            factory.get(shape: .circle,
                        rect: rect1,
                        color: ShapeColors.primaryClr,
                        fillColor: nil,
                        lineWidth: 16) as! CAShapeLayer,
            factory.get(shape: .circle,
                        rect: rect2,
                        color: ShapeColors.secondaryClr,
                        fillColor: nil,
                        lineWidth: 35) as! CAShapeLayer
        ]
        
        circles.forEach { self.layer.addSublayer($0) }
    }
    
    func setupLinesLayer(frame: CGRect) {
        let rect1 = CGRect(x: 15, y: 15, width: 25, height: 50)
        let rect2 = CGRect(x: frame.maxX - 60, y: frame.midY, width: 50, height: 60)
        let rect3 = CGRect(x: frame.maxX - 30, y: 100, width: 60, height: 0)
        let rect4 = CGRect(x: frame.maxX - 40, y: frame.maxY - 60, width: 45, height: 30)
        let rect5 = CGRect(x: -10, y: frame.maxY - 300, width: 45, height: 70)
        
        let lines = [
            factory.get(shape: .line,
                        rect: rect1,
                        color: ShapeColors.primaryClr,
                        fillColor: nil,
                        lineWidth: 15) as! CAShapeLayer,
            factory.get(shape: .line,
                        rect: rect2,
                        color: ShapeColors.primaryClr,
                        fillColor: nil,
                        lineWidth: 15) as! CAShapeLayer,
            factory.get(shape: .line,
                        rect: rect3,
                        color: ShapeColors.primaryClr,
                        fillColor: nil,
                        lineWidth: 15) as! CAShapeLayer,
            factory.get(shape: .line,
                        rect: rect4,
                        color: ShapeColors.secondaryClr,
                        fillColor: nil,
                        lineWidth: 15) as! CAShapeLayer,
            factory.get(shape: .line,
                        rect: rect5,
                        color: ShapeColors.secondaryClr,
                        fillColor: nil,
                        lineWidth: 15) as! CAShapeLayer
        ]
        
        lines.forEach { self.layer.addSublayer($0) }
    }
}

// MARK: - Helpers
private extension BackgroundView {
    func getGradient(colors: [String], frame: CGRect) -> CAGradientLayer {
        let layer = CAGradientLayer()
        layer.frame = frame
        layer.colors = colors.map{ UIColor(hex: $0).cgColor }
        layer.locations = [0, 1]
        return layer
    }
}
