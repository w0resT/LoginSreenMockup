import UIKit

final class ComponentManager {
    static let shared = ComponentManager()
    private init() {}
    
    func getStack(axis: NSLayoutConstraint.Axis = .vertical,
                  alignment: UIStackView.Alignment = .fill,
                  distribution: UIStackView.Distribution = .fill,
                  spacing: CGFloat = 16) -> UIStackView {
        let stack = UIStackView()
        stack.axis = axis
        stack.alignment = alignment
        stack.distribution = distribution
        stack.spacing = spacing
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }
    
    func getTextField(placeholder: String,
                      maskedCorners: CACornerMask,
                      isSecureTextEntry: Bool = false) -> UITextField {
        let field = {
            let field = UITextField()
            field.font = Fonts.semiBold
            field.textColor = Colors.primary
            field.placeholder = placeholder
            field.backgroundColor = Colors.white
            field.borderStyle = .none
            field.layer.cornerRadius = 5
            field.layer.borderWidth = 0.5
            field.layer.masksToBounds = true
            field.layer.maskedCorners = maskedCorners
            field.layer.borderColor = Colors.gray.cgColor
            field.autocapitalizationType = .none
            field.autocorrectionType = .no
            field.isSecureTextEntry = true
            field.translatesAutoresizingMaskIntoConstraints = false
            field.heightAnchor.constraint(equalToConstant: 50).isActive = true
            return field
        }()
        
        // Padding
        let viewPadding = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: field.frame.height))
        field.leftView = viewPadding
        field.rightView = viewPadding
        field.leftViewMode = .always
        field.rightViewMode = .always
        
        return field
    }
}
