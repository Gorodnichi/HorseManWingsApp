import UIKit

final class AboutAnimalFilterCell: UICollectionViewCell {
    struct Model {
		let animals: [Animals]

		struct Animals {
			let title: String
		}
    }
    
    private var selectedFilter = 0
    
    private var buttons: [UIButton] = []

    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsHorizontalScrollIndicator = false
        return scrollView
    }()
    
    private lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 8
        stack.translatesAutoresizingMaskIntoConstraints = false

        return stack
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupConstraint()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    private func setupUI() {
        contentView.addSubview(scrollView)
        scrollView.addSubview(stackView)
    }
    
    private func setupConstraint() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: contentView.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),

            stackView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor),
            stackView.heightAnchor.constraint(equalTo: scrollView.frameLayoutGuide.heightAnchor)
        ])
    }
    
    private func setupAppearance(for button: UIButton) {
        button.titleLabel?.font = .systemFont(
            ofSize: 15,
            weight: .bold
        )

        button.clipsToBounds = true
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.systemGray.cgColor

        button.contentEdgeInsets = UIEdgeInsets(
            top: 8,
            left: 14,
            bottom: 8,
            right: 14
        )

        button.setTitleColor(.oliveGray, for: .normal)
        button.backgroundColor = .white
    }
    
    private func updateButtonStyles() {
        for (index, button) in buttons.enumerated() {
            let isSelected = index == selectedFilter

            button.backgroundColor = isSelected ? .accent: .white

            button.setTitleColor(isSelected ? .white : .oliveGray, for: .normal
            )
        }
    }
    
    @objc private func filterButtonTapped(_ sender: UIButton) {
        guard let index = buttons.firstIndex(of: sender) else {
            return
        }

        selectedFilter = index
        updateButtonStyles()
    }
    
    func configure(model: Model) {
        buttons.forEach { button in
            stackView.removeArrangedSubview(button)
            button.removeFromSuperview()
        }

        buttons = model.animals.map { animal in
            let button = FilterButton()
            button.translatesAutoresizingMaskIntoConstraints = false
            button.setTitle(animal.title, for: .normal)
            setupAppearance(for: button)
            button.addTarget(self, action: #selector(filterButtonTapped), for: .touchUpInside)
            stackView.addArrangedSubview(button)
            return button
        }

        if !buttons.indices.contains(selectedFilter) {
            selectedFilter = 0
        }
        
        updateButtonStyles()
    }
}
