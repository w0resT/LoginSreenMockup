import UIKit

class ViewController: UIViewController {

    // MARK: - UI Elements
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 42, weight: .light)
        label.textColor = .white
        label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
}

// MARK: - Setup UI
private extension ViewController {
    func setupUI() {
        self.view = BackgroundView()
        
        setupTitleLabel(with: "PROTECT YOUR DATA WITH US")
    }
    
    func setupTitleLabel(with text: String) {
        if titleLabel.superview == nil {
            view.addSubview(titleLabel)
        }
        
        titleLabel.text = text
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 68),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -68),
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 200)
        ])
    }
}

