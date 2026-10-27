import UIKit

final class AboutAnimalFilterCell: UICollectionViewCell {
    
    static let identifier = "AboutAnimalFilterCell"
    
    struct Model {
        let all: String
        let horses: String
        let birds: String
        let farm: String
    }
    
    private var selectedFilter = 0
    
    private let allButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    private let horsesButton : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    private let birdsButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    private let farmButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    private lazy var stackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [allButton, horsesButton, birdsButton, farmButton])
        stack.axis = .horizontal
        stack.spacing = 8
        stack.alignment = .center
        stack.distribution = .fill
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        return stack
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupConstraint()
        setupAppearance()
        updateButtonStyles()
        setupButton()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        contentView.addSubview(stackView)
    }
    
    private func setupConstraint() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    private func setupAppearance() {
        let buttons = [
            allButton,
            horsesButton,
            birdsButton,
            farmButton
        ]

        buttons.forEach { button in
            button.titleLabel?.font = .systemFont(
                ofSize: 15,
                weight: .bold
            )

            button.layer.cornerRadius = 20
            button.clipsToBounds = true
            button.layer.borderWidth = 1
            button.layer.borderColor = UIColor.systemGray.cgColor

            button.contentEdgeInsets = UIEdgeInsets(
                top: 10,
                left: 10,
                bottom: 10,
                right: 10
            )

            button.setTitleColor( .oliveGray, for: .normal)
            button.backgroundColor = .white
            
            
        }

        updateButtonStyles()
    }
    
    private func updateButtonStyles() {
        let buttons = [
            allButton,
            horsesButton,
            birdsButton,
            farmButton
        ]

        for (index, button) in buttons.enumerated() {
            let isSelected = index == selectedFilter

            button.backgroundColor = isSelected ? .accent: .white

            button.setTitleColor(isSelected ? .white : .oliveGray, for: .normal
            )
        }
    }
    
    private func setupButton() {
        allButton.addTarget(self, action: #selector(filterButtonTapped), for: .touchUpInside)
        horsesButton.addTarget(self, action: #selector(filterButtonTapped), for: .touchUpInside)
        birdsButton.addTarget(self, action: #selector(filterButtonTapped), for: .touchUpInside)
        farmButton.addTarget(self, action: #selector(filterButtonTapped), for: .touchUpInside)
    }
    
    @objc private func filterButtonTapped(_ sender: UIButton) {
        let buttons = [
            allButton,
            horsesButton,
            birdsButton,
            farmButton
        ]

        guard let index = buttons.firstIndex(of: sender) else {
            return
        }

        selectedFilter = index
        updateButtonStyles()
    }
    
    func configure(model: Model) {
        allButton.setTitle(model.all, for: .normal)
        horsesButton.setTitle(model.horses, for: .normal)
        birdsButton.setTitle(model.birds, for: .normal)
        farmButton.setTitle(model.farm, for: .normal)
        
        updateButtonStyles()
    }
}
