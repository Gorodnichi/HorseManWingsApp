import UIKit

final class AboutFarmTextCell: UICollectionViewCell {
    
    static let identifier = "AboutFarmTextCell"
    
    struct Model {
        let title: String
        let badgeTitle: String
        let subtitle: String
        let quote: String 
    }
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 28, weight: .regular)
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let badgeTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .farmColors
        label.font = .systemFont(ofSize: 11, weight: .regular)
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private var subtitleLabel:  UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 15, weight: .regular)
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let quoteLabel: UILabel = {
        let label = UILabel()
        label.textColor = .farmColors // поменять цвет
        label.font = .systemFont(ofSize: 21, weight: .regular)
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var mainStackView: UIStackView = {
           let stack = UIStackView(arrangedSubviews: [titleRow, subtitleLabel, quoteLabel])
           stack.axis = .vertical
           stack.alignment = .leading
           stack.translatesAutoresizingMaskIntoConstraints = false
           
           return stack
    }()
    
    private lazy var titleRow: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [titleLabel, badgeTitleLabel])
        stack.axis = .horizontal
        stack.distribution = .equalSpacing
        stack.alignment = .center
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        return stack
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        constraintUI()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        contentView.addSubview(mainStackView)
    }
    
    private func constraintUI() {
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            mainStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            mainStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
        ])
    }
    
    func configure(model: Model) {
        titleLabel.text = model.title
        badgeTitleLabel.text = model.badgeTitle
        subtitleLabel.text = model.subtitle
        quoteLabel.text = model.quote
    }
}

