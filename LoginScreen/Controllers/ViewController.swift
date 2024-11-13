import UIKit

class ViewController: UIViewController {
    // MARK: - Private Properties
    private let manager = ComponentManager.shared
    
    // MARK: - UI Elements
    private var infoStack: UIStackView!
    private var textFieldStack: UIStackView!
    private var authStack: UIStackView!
    
    private var peopleTrustStack: UIStackView!
    private var loginStack: UIStackView!
    
    private var emailField: UITextField!
    private var passField: UITextField!

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.title
        label.addCharactersSpacing(spacing: 4, text: NSLocalizedString("title-label", comment: ""))
        label.textColor = Colors.white
        label.textAlignment = .left
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var countLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.bold
        label.text = "230,100,04"
        label.textColor = Colors.white
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.setContentHuggingPriority(.init(251), for: .horizontal)
        return label
    }()
    
    private lazy var trustLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.regular
        label.text = NSLocalizedString("trust-label", comment: "")
        label.textColor = Colors.white
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var signupButton: UIButton = {
        let btn = UIButton()
        btn.titleLabel?.font = Fonts.bold
        btn.setTitle(NSLocalizedString("signup-btn", comment: ""), for: .normal)
        btn.setTitleColor(Colors.white, for: .normal)
        btn.setTitleColor(Colors.lightGray, for: .highlighted)
        btn.backgroundColor = Colors.primary
        btn.layer.masksToBounds = true
        btn.layer.cornerRadius = 5
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.heightAnchor.constraint(equalToConstant: 50).isActive = true
        btn.addAction(signupAction, for: .touchUpInside)
        return btn
    }()
    
    private lazy var alreadySignLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.regular13
        label.addCharactersSpacing(spacing: 2, text: NSLocalizedString("alr-signup-label", comment: ""))
        label.textColor = Colors.black
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.setContentHuggingPriority(.init(251), for: .horizontal)
        return label
    }()
    
    private lazy var loginLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.bold
        label.text = NSLocalizedString("login-btn", comment: "")
        label.textColor = Colors.secondary
        label.textAlignment = .left
        label.isUserInteractionEnabled = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - Actions
    private lazy var signupAction = UIAction { _ in
        print("SignUp Action")
    }
    
    @objc private func loginAction(_ sender: Any) {
        print("Login Action")
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    // MARK: - Public Methods
    func setCountLabel(text: String) {
        countLabel.text = text
    }
}

// MARK: - Setup UI
private extension ViewController {
    func setupUI() {
        self.view = BackgroundView()
        
        setupInfoStack()
        setupTextFieldStack()
        setupAuthStack()
    }
    
    func setupInfoStack() {
        infoStack = manager.getStack()
        peopleTrustStack = manager.getStack(axis: .horizontal, alignment: .leading, spacing: 6)
        
        view.addSubview(infoStack)
        
        infoStack.addArrangedSubview(titleLabel)
        infoStack.addArrangedSubview(peopleTrustStack)
        peopleTrustStack.addArrangedSubview(countLabel)
        peopleTrustStack.addArrangedSubview(trustLabel)
        
        NSLayoutConstraint.activate([
            infoStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 64),
            infoStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -64),
            infoStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 200)
        ])
    }
    
    func setupTextFieldStack() {
        textFieldStack = manager.getStack(spacing: 0)
        emailField = manager.getTextField(placeholder: NSLocalizedString("email-placeholder", comment: ""),
                                          maskedCorners: [.layerMinXMinYCorner, .layerMaxXMinYCorner])
        passField = manager.getTextField(placeholder: NSLocalizedString("password-placeholder", comment: ""),
                                         maskedCorners: [.layerMinXMaxYCorner, .layerMaxXMaxYCorner])
        
        view.addSubview(textFieldStack)
        
        textFieldStack.addArrangedSubview(emailField)
        textFieldStack.addArrangedSubview(passField)
        
        NSLayoutConstraint.activate([
            textFieldStack.topAnchor.constraint(equalTo: infoStack.bottomAnchor, constant: 50),
            textFieldStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 64),
            textFieldStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -64)
        ])
    }
    
    func setupAuthStack() {
        authStack = manager.getStack()
        loginStack = manager.getStack(axis: .horizontal, alignment: .leading, spacing: 6)
        
        view.addSubview(authStack)
        
        authStack.addArrangedSubview(signupButton)
        authStack.addArrangedSubview(loginStack)
        loginStack.addArrangedSubview(alreadySignLabel)
        loginStack.addArrangedSubview(loginLabel)
        
        let tapGuesture = UITapGestureRecognizer(target: self, action: #selector(loginAction))
        loginLabel.addGestureRecognizer(tapGuesture)
        
        NSLayoutConstraint.activate([
            authStack.topAnchor.constraint(equalTo: textFieldStack.bottomAnchor, constant: 30),
            authStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 64),
            authStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -64)
        ])
    }
}
