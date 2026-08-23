import UIKit

final class AboutFarmBannerCell: UICollectionViewCell {
    
    struct Model {
       let image: UIImage
       let title: String
       let subtitle: String
    }
    
    static let identifier = "AboutFarmBannerCell"
    
    private let backgroundImageView: UIImageView = {
        let image = UIImageView()
		image.contentMode = .scaleToFill
        image.layer.cornerRadius = 30
        image.clipsToBounds = true
        image.layer.masksToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    private let badgeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "С 2017 года"
        label.font = .systemFont(ofSize: 12, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let bannerBackground: UIVisualEffectView = {
        let blur = UIBlurEffect(style: .systemMaterialDark)
        let view = UIVisualEffectView(effect: blur)
        
        view.layer.cornerRadius = 22
        view.layer.cornerCurve = .continuous
        view.clipsToBounds = true
        
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.white.withAlphaComponent(0.4).cgColor
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 30, weight: .medium)
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let subtitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var contentSteck: UIStackView = {
        let content = UIStackView(arrangedSubviews: [titleLabel, subtitleLabel])
        content.axis = .vertical
        content.spacing = 10
        content.alignment = .leading
        content.translatesAutoresizingMaskIntoConstraints = false
      
        return content
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        contentView.addSubview(backgroundImageView)
        contentView.addSubview(bannerBackground)
        bannerBackground.contentView.addSubview(badgeLabel)
        
        contentView.layer.cornerRadius = 30
        contentView.clipsToBounds = true
        
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            backgroundImageView.heightAnchor.constraint(equalToConstant: 390),
        ])
        
        NSLayoutConstraint.activate([
            bannerBackground.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 40),
            bannerBackground.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 210),
            bannerBackground.widthAnchor.constraint(equalToConstant: 110),
            bannerBackground.heightAnchor.constraint(equalToConstant: 40),
            
            badgeLabel.topAnchor.constraint(equalTo: bannerBackground.contentView.topAnchor,constant: 8),
            badgeLabel.bottomAnchor.constraint(equalTo: bannerBackground.contentView.bottomAnchor,constant: -8),
            badgeLabel.leadingAnchor.constraint(equalTo: bannerBackground.contentView.leadingAnchor,constant: 16),
            badgeLabel.trailingAnchor.constraint(equalTo: bannerBackground.contentView.trailingAnchor,constant: -16)
        ])
        
        contentView.addSubview(contentSteck)
        
        NSLayoutConstraint.activate([
            contentSteck.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -22),
            contentSteck.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 40),
            contentSteck.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -35),
        ])
        
        
    }
    func configure(model: Model) { // удалил badgeTitlt: String
        backgroundImageView.image = model.image
        titleLabel.text = model.title
        subtitleLabel.text = model.subtitle
    }
    
}
