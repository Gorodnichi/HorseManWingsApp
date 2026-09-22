import UIKit

final class AboutFarmCardsCell: UICollectionViewCell {
    
    struct Model {
        let titleCare: String
        let subtitleCare: String
        let titleImpressions: String
        let subtitleImpressions: String
    }
    
    static let identifier = "AboutFarmCardsCell"
    
    private let careCardView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 30
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private let careImageView: UIImageView = {
        let image = UIImageView()
		image.image = .care
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    private let careTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textColor = UIColor.black
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let careSubtitleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .regular)
        label.textColor = .subtitle
        label.numberOfLines = 3
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var careStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [careImageView, careTitleLabel, careSubtitleLabel])
        stack.axis = .vertical
        stack.spacing = 10
        stack.alignment = .leading
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        return stack
    }()
    
    private let impressionsCardView: UIView = {
        let view = UIView()
        view.backgroundColor = .impressions
        view.layer.cornerRadius = 30
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private let impressionsImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "impressionsImage")
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    private let impressionsTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textColor = UIColor.black
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let impressionsSubtitleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .regular)
        label.textColor = .subtitle
        label.numberOfLines = 3
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var impressionsStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [impressionsImageView, impressionsTitleLabel, impressionsSubtitleLabel])
        stack.axis = .vertical
        stack.spacing = 10
        stack.alignment = .leading
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        return stack
    }()
    
    private lazy var cardStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [careCardView, impressionsCardView])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.spacing = 20
        stack.distribution = .fillEqually
        stack.alignment = .leading
        return stack
    }()
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        setupUI()
        setupConstraint()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        contentView.addSubview(cardStackView)
        careCardView.addSubview(careStackView)
        impressionsCardView.addSubview(impressionsStackView)
    }
    
    private func setupConstraint() {
        NSLayoutConstraint.activate([
            cardStackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            cardStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            cardStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            cardStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
          
            careStackView.topAnchor.constraint(equalTo: careCardView.topAnchor, constant: 10),
            careStackView.leadingAnchor.constraint(equalTo: careCardView.leadingAnchor, constant: 10),
            careStackView.trailingAnchor.constraint(equalTo: careCardView.trailingAnchor, constant: -10),
            careStackView.bottomAnchor.constraint(equalTo: careCardView.bottomAnchor, constant: -10),
            
            impressionsStackView.topAnchor.constraint(equalTo: impressionsCardView.topAnchor, constant: 10),
            impressionsStackView.leadingAnchor.constraint(equalTo: impressionsCardView.leadingAnchor, constant: 10),
            impressionsStackView.trailingAnchor.constraint(equalTo: impressionsCardView.trailingAnchor, constant: -10),
            impressionsStackView.bottomAnchor.constraint(equalTo: impressionsCardView.bottomAnchor, constant: -10),
        ])
    }
    
    func  configure(model: Model) {
        careTitleLabel.text = model.titleCare
        careSubtitleLabel.text = model.subtitleCare
        
        impressionsTitleLabel.text = model.titleImpressions
        impressionsSubtitleLabel.text = model.subtitleImpressions
    }
}


