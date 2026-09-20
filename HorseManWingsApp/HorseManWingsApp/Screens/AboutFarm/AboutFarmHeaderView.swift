import UIKit

final class AboutFarmHeaderView: UIView {

    struct Model {
        let title: String
        let farmName: String
        let logo: UIImage?
    }

     let stackView: UIStackView = {
        let stack = UIStackView()
        stack.spacing = 8
        stack.axis = .horizontal
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    private let labelStackView: UIStackView = {
        let stack = UIStackView()
        stack.spacing = 2
        stack.axis = .vertical
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    private let logoImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.layer.cornerRadius = 10
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 10)
        label.textColor = AppColors.farmColors
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let farmNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .black
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

     let notificationButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "bell"), for: .normal)
        button.tintColor = .black
        button.backgroundColor = .white
        button.layer.cornerRadius = 15
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupUI()
        setupConstraints()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupUI() {
        labelStackView.addArrangedSubview(titleLabel)
        labelStackView.addArrangedSubview(farmNameLabel)

        stackView.addArrangedSubview(logoImage)
        stackView.addArrangedSubview(labelStackView)

        addSubview(stackView)
        addSubview(notificationButton)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor),

            logoImage.widthAnchor.constraint(equalToConstant: 40),
            logoImage.heightAnchor.constraint(equalToConstant: 40),

            notificationButton.trailingAnchor.constraint(equalTo: trailingAnchor),
            notificationButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            notificationButton.widthAnchor.constraint(equalToConstant: 40),
            notificationButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    func configure(model: Model) {
        logoImage.image = model.logo
        titleLabel.text = model.title
        farmNameLabel.text = model.farmName
    }
    
    func makeLeftBarButtonItem() -> UIBarButtonItem {
        UIBarButtonItem(customView: stackView)
    }

    func makeRightBarButtonItem() -> UIBarButtonItem {
        UIBarButtonItem(customView: notificationButton)
    }
}
