//import UIKit
//
//final class AboutFarmAboutCell: UICollectionViewCell {
//    
//    static let identifier = "AboutFarmAboutCell"
//    
//    struct Model {
//        let sectionTitle: String
//        let title: String
//        let badgeTitle: String
//        let subtitle: String
//        let quote: String // Цитата
//        
//        let careTitle: String // Заголовок заботы
//        let careDescription: String // 12
//        
//        let impressionsTitle: String // Заголовок Впечатления
//        let impressionsDescription: String
//    }
//    
//    private let sectionTitleLabel: UILabel = {
//        let label = UILabel()
//        label.textColor = .farmColors
//        label.font = .systemFont(ofSize: 10, weight: .regular)
//        label.numberOfLines = 2
//        label.translatesAutoresizingMaskIntoConstraints = false
//        
//        return label
//    }()
//    
//    private let titleLabel: UILabel = {
//        let label = UILabel()
//        label.textColor = .black
//        label.font = .systemFont(ofSize: 28, weight: .regular)
//        label.numberOfLines = 2
//        label.translatesAutoresizingMaskIntoConstraints = false
//        
//        return label
//    }()
//    
//    private let badgeTitleLabel: UILabel = {
//        let label = UILabel()
//        label.textColor = .farmColors
//        label.font = .systemFont(ofSize: 11, weight: .regular)
//        label.numberOfLines = 2
//        label.translatesAutoresizingMaskIntoConstraints = false
//        
//        return label
//    }()
//    
//    private var subtitleLabel:  UILabel = {
//        let label = UILabel()
//        label.textColor = .white
//        label.font = .systemFont(ofSize: 15, weight: .regular)
//        label.numberOfLines = 2
//        label.translatesAutoresizingMaskIntoConstraints = false
//        
//        return label
//    }()
//    
//    private let quoteLabel: UILabel = {
//        let label = UILabel()
//        label.textColor = .farmColors // поменять цвет
//        label.font = .systemFont(ofSize: 21, weight: .regular)
//        label.numberOfLines = 2
//        label.translatesAutoresizingMaskIntoConstraints = false
//        
//        return label
//    }()
//    
//    private let careTitleLabel: UILabel = {
//        let label = UILabel()
//        label.textColor = .black
//        label.font = .systemFont(ofSize: 16, weight: .regular)
//        label.numberOfLines = 2
//        label.translatesAutoresizingMaskIntoConstraints = false
//        
//        return label
//    }()
//    
//    private let careDescriptionLabel: UILabel = {
//        let label = UILabel()
//        label.textColor = .black // Поменять цвет
//        label.font = .systemFont(ofSize: 12, weight: .regular)
//        label.numberOfLines = 2
//        label.translatesAutoresizingMaskIntoConstraints = false
//        
//        return label
//    }()
//    
//    private let impressionsTitleLabel: UILabel = {
//        let label = UILabel()
//        label.textColor = .black
//        label.font = .systemFont(ofSize: 16, weight: .regular)
//        label.numberOfLines = 2
//        label.translatesAutoresizingMaskIntoConstraints = false
//        
//        return label
//    }()
//    
//    private let impressionsDescriptionLabel: UILabel = {
//        let label = UILabel()
//        label.textColor = .black // Поменять цвет
//        label.font = .systemFont(ofSize: 12, weight: .regular)
//        label.numberOfLines = 2
//        label.translatesAutoresizingMaskIntoConstraints = false
//        
//        return label
//    }()
//    
//    private let CareImage: UIImageView = {
//        let image = UIImageView()
//        image.contentMode = .scaleAspectFill
//        image.layer.cornerRadius = 15
//        image.clipsToBounds = true
//        image.translatesAutoresizingMaskIntoConstraints = false
//        
//        return image
//    }()
//    
//    private let impressionsImage: UIImageView = {
//        let image = UIImageView()
//        image.contentMode = .scaleAspectFill
//        image.layer.cornerRadius = 15
//        image.clipsToBounds = true
//        image.translatesAutoresizingMaskIntoConstraints = false
//        
//        return image
//    }()
//    
//    private let impressionsCard: UIView = {
//        let view = UIView()
//        view.layer.cornerRadius = 15
//        view.backgroundColor = .blue
//        view.clipsToBounds = true
//        view.translatesAutoresizingMaskIntoConstraints = false
//        
//        return view
//    }()
//    
//    private let careCard: UIView = {
//        let view = UIView()
//        view.backgroundColor = .blue
//        view.layer.cornerRadius = 15
//        view.clipsToBounds = true
//        view.translatesAutoresizingMaskIntoConstraints = false
//        
//        return view
//    }()
//    
//    private lazy var mainStackView: UIStackView = {
//           let stack = UIStackView(arrangedSubviews: [sectionTitleLabel, titleRow, subtitleLabel, quoteLabel])
//           stack.axis = .vertical
//           stack.alignment = .leading
//           stack.translatesAutoresizingMaskIntoConstraints = false
//           
//           return stack
//    }()
//    
//    private lazy var titleRow: UIStackView = {
//        let stack = UIStackView(arrangedSubviews: [titleLabel, badgeTitleLabel])
//        stack.axis = .horizontal
//        stack.distribution = .equalSpacing
//        stack.alignment = .center
//        stack.translatesAutoresizingMaskIntoConstraints = false
//        
//        return stack
//    }()
//    
//    private lazy var careStackView: UIStackView = {
//        let stack = UIStackView(arrangedSubviews: [CareImage, careTitleLabel, careDescriptionLabel])
//           stack.axis = .vertical
//           stack.alignment = .center
//           stack.translatesAutoresizingMaskIntoConstraints = false
//           
//           return stack
//    }()
//    
//    private lazy var impressionsStackView: UIStackView = {
//        let stack = UIStackView(arrangedSubviews: [impressionsImage, impressionsTitleLabel, impressionsDescriptionLabel])
//           stack.axis = .vertical
//           stack.alignment = .center
//           stack.translatesAutoresizingMaskIntoConstraints = false
//           
//           return stack
//    }()
//    
//    private lazy var cardsStackView: UIStackView = {
//        let stack = UIStackView(arrangedSubviews: [careCard, impressionsCard])
//        stack.axis = .horizontal
//        stack.spacing = 20
//        stack.distribution = .fillEqually // Разделить место поровну между свободными эллементами
//        stack.translatesAutoresizingMaskIntoConstraints = false
//        
//        return stack
//    }()
//    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        setupUI()
//        constraintUI()
//
//    }
//    
//    @available(*, unavailable)
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    private func setupUI() {
//        contentView.addSubview(mainStackView)
//        contentView.addSubview(cardsStackView)
//        careCard.addSubview(careStackView)
//        impressionsCard.addSubview(impressionsStackView)
//        
//    }
//    
//    private func constraintUI() {
//        NSLayoutConstraint.activate([
//            mainStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
//            mainStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
//            mainStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
//            
//            cardsStackView.topAnchor.constraint(equalTo: mainStackView.bottomAnchor, constant: 20),
//            cardsStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
//            cardsStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
//            cardsStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
//           // cardsStackView.heightAnchor.constraint(equalToConstant: 220),
//            
//            careStackView.topAnchor.constraint(equalTo: careCard.topAnchor, constant: 20),
//            careStackView.leadingAnchor.constraint(equalTo: careCard.leadingAnchor, constant: 20),
//            careStackView.trailingAnchor.constraint(equalTo: careCard.trailingAnchor, constant: -20),
//            careStackView.bottomAnchor.constraint(equalTo: careCard.bottomAnchor, constant: -20),
//            
//            impressionsStackView.topAnchor.constraint(equalTo: impressionsCard.topAnchor, constant: 20),
//            impressionsStackView.leadingAnchor.constraint(equalTo: impressionsCard.leadingAnchor, constant: 20),
//            impressionsStackView.trailingAnchor.constraint(equalTo: impressionsCard.trailingAnchor, constant: -20),
//            impressionsStackView.bottomAnchor.constraint(equalTo: impressionsCard.bottomAnchor, constant: -20),
//        ])
//    }
//    
//    func configure(model: Model) {
//        sectionTitleLabel.text = model.sectionTitle
//        titleLabel.text = model.title
//        badgeTitleLabel.text = model.badgeTitle
//        subtitleLabel.text = model.subtitle
//        quoteLabel.text = model.quote
//        careTitleLabel.text = model.careTitle
//        careDescriptionLabel.text = model.careDescription
//        impressionsTitleLabel.text = model.impressionsTitle
//        impressionsDescriptionLabel.text = model.impressionsDescription
//    }
//}
