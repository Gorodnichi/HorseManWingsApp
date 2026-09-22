import UIKit

final class AboutFarmTextCell: UICollectionViewCell {

	private enum Constants {
		static let badgeHeight: CGFloat = 30
	}

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
        label.font = .systemFont(ofSize: 28, weight: .medium)
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let badgeTitleLabel: UILabel = {
        let label = UILabel()
		label.textColor = .accent
        label.font = .systemFont(ofSize: 13, weight: .bold)
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let badgeBackground: UIVisualEffectView = {
        let view = UIVisualEffectView()
        view.backgroundColor = UIColor(
            red: 0.86,
            green: 0.91,
            blue: 0.86,
            alpha: 1
        )
		view.layer.cornerRadius = Constants.badgeHeight / 2
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var subtitleLabel:  UILabel = {
        let label = UILabel()
		label.textColor = .greenGray
        label.font = .systemFont(ofSize: 15, weight: .regular)
        label.numberOfLines = 3
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let quoteLabel: UILabel = {
        let label = UILabel()
		label.textColor = .accent
        label.font = .systemFont(ofSize: 21, weight: .regular)
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let iconQuote: UIView = {
        let view = UIView()
        view.backgroundColor = .systemOrange
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var mainStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [titleRow, subtitleLabel, quoteStack])
        stack.axis = .vertical
        stack.spacing = 10
        stack.alignment = .leading
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        return stack
    }()
    
    private lazy var quoteStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [iconQuote, quoteLabel])
        stack.axis = .horizontal
        stack.spacing = 10
        stack.alignment = .leading
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        return stack
    }()
    
    private lazy var titleRow: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [titleLabel, badgeBackground])
        stack.axis = .horizontal
		stack.distribution = .equalSpacing
        stack.spacing = 12
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
        badgeBackground.contentView.addSubview(badgeTitleLabel)
        contentView.addSubview(mainStackView)
    }
    
    private func constraintUI() {
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            mainStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
            titleRow.trailingAnchor.constraint(equalTo: mainStackView.trailingAnchor),
            
			badgeBackground.heightAnchor.constraint(equalToConstant: Constants.badgeHeight),

            badgeTitleLabel.centerXAnchor.constraint(equalTo: badgeBackground.contentView.centerXAnchor),
            badgeTitleLabel.centerYAnchor.constraint(equalTo: badgeBackground.contentView.centerYAnchor),
            badgeTitleLabel.leadingAnchor.constraint(equalTo: badgeBackground.contentView.leadingAnchor, constant: 12),
            badgeTitleLabel.trailingAnchor.constraint(equalTo: badgeBackground.contentView.trailingAnchor, constant: -12),
            
            iconQuote.widthAnchor.constraint(equalToConstant: 4),
            iconQuote.heightAnchor.constraint(equalToConstant: 30),
        ])
    }
    
    func configure(model: Model) {
        titleLabel.text = model.title
        badgeTitleLabel.text = model.badgeTitle
        subtitleLabel.text = model.subtitle
        quoteLabel.text = model.quote
    }
}
