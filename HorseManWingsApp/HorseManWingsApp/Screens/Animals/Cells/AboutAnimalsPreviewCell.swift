import UIKit

final class AboutAnimalsPreviewCell: UICollectionViewCell {
    
    struct Model {
        let title: String
        let badgeTitle: String
        let subtitle: String
    }
    
    static let identifier = "AboutAnimalsPreviewCell"
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .accent
        label.font = .systemFont(ofSize: 10, weight: .bold)
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let badgeTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 36, weight: .medium)
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private var subtitleLabel:  UILabel = {
        let label = UILabel()
        label.textColor = .greenGray
        label.font = .systemFont(ofSize: 13, weight: .regular)
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var stackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [titleLabel, badgeTitleLabel, subtitleLabel])
        stack.axis = .vertical
        stack.spacing = 8
        stack.alignment = .leading
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
        contentView.addSubview(stackView)
    }
    
    private func setupConstraint() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }
    
    func configure(model: Model) {
        titleLabel.text = model.title
        badgeTitleLabel.text = model.badgeTitle
        subtitleLabel.text = model.subtitle
    }
}
