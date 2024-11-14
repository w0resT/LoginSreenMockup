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

    private var titleLabel: UILabel!
    private var countLabel: UILabel!
    private var trustLabel: UILabel!
    private var alreadySignLabel: UILabel!
    private var loginLabel: UILabel!
    
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
        btn.addTarget(self, action: #selector(signupAction), for: .touchUpInside)
        return btn
    }()
    
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
        // Setup
        infoStack = manager.getStack()
        peopleTrustStack = manager.getStack(axis: .horizontal, alignment: .leading, spacing: 6)
        titleLabel = manager.getLabel(text: NSLocalizedString("title-label", comment: ""),
                                      font: Fonts.title,
                                      spacing: 4,
                                      numberOfLines: 0)
        countLabel = manager.getLabel(text: "230,100,04")
        countLabel.setContentHuggingPriority(.init(251), for: .horizontal)
        trustLabel = manager.getLabel(text: NSLocalizedString("trust-label", comment: ""), font: Fonts.regular)
        
        // Layout
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
        // Setup
        textFieldStack = manager.getStack(spacing: 0)
        emailField = manager.getTextField(placeholder: NSLocalizedString("email-placeholder", comment: ""),
                                          maskedCorners: [.layerMinXMinYCorner, .layerMaxXMinYCorner])
        passField = manager.getTextField(placeholder: NSLocalizedString("password-placeholder", comment: ""),
                                         maskedCorners: [.layerMinXMaxYCorner, .layerMaxXMaxYCorner],
                                         isSecureTextEntry: true)
        
        // Layout
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
        // Setup
        authStack = manager.getStack()
        loginStack = manager.getStack(axis: .horizontal, alignment: .leading, spacing: 6)
        
        alreadySignLabel = manager.getLabel(text: NSLocalizedString("alr-signup-label", comment: ""),
                                            font: Fonts.regular13,
                                            textColor: Colors.black,
                                            spacing: 2)
        alreadySignLabel.setContentHuggingPriority(.init(251), for: .horizontal)
        loginLabel = manager.getLabel(text: NSLocalizedString("login-btn", comment: ""), textColor: Colors.secondary)
        loginLabel.isUserInteractionEnabled = true
        
        let tapGuesture = UITapGestureRecognizer(target: self, action: #selector(loginAction))
        loginLabel.addGestureRecognizer(tapGuesture)
        
        // Layout
        view.addSubview(authStack)
        
        authStack.addArrangedSubview(signupButton)
        authStack.addArrangedSubview(loginStack)
        loginStack.addArrangedSubview(alreadySignLabel)
        loginStack.addArrangedSubview(loginLabel)
        
        NSLayoutConstraint.activate([
            authStack.topAnchor.constraint(equalTo: textFieldStack.bottomAnchor, constant: 30),
            authStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 64),
            authStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -64)
        ])
    }
}

// MARK: - Actions
private extension ViewController {
    @objc func signupAction(_ sender: Any) {
        print("SignUp Action")
    }
    
    @objc  func loginAction(_ sender: Any) {
        print("Login Action")
    }
}
