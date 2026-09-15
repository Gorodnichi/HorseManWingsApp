
import UIKit

final class AboutFarmVC: UIViewController {
    
    private enum Cells {
        case banner(AboutFarmBannerCell.Model)
        case aboutText(AboutFarmTextCell.Model)
    }
    
    private struct Section {
        let title: String?
        let cells: [Cells]
    }
    
    private lazy var collectionView: UICollectionView = {
       
        let collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: makeCollectionLayout()
        )
        collectionView.backgroundColor = .clear
        collectionView.dataSource = self
        collectionView.register(AboutFarmBannerCell.self, forCellWithReuseIdentifier: AboutFarmBannerCell.identifier)
        collectionView.register(AboutFarmTextCell.self, forCellWithReuseIdentifier: AboutFarmTextCell.identifier)
        collectionView.register(
            AboutFarmSectionHeaderView.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: AboutFarmSectionHeaderView.identifire
        )
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        return collectionView
    }()
    
    private var dataSourse: [Section] = [
        Section(
            title: nil,
            cells: [
                .banner(AboutFarmBannerCell.Model(
                    image: .horseBanner,
                    title: "Место где становятся ближе к природе",
                    subtitle: "Знакомим детей и взрослых с животными бережно и по-настоящему"
                ))
            ]
        ),
        
        Section(
            title: "НАША ИСТОРИЯ",
            cells: [
                .aboutText(AboutFarmTextCell.Model(
                    title: "О ферме",
                    badgeTitle: "8 лет вместе",
                    subtitle: "Мы создали Horse Man Wings, чтобы у каждого была возможность остановиться, выдохнуть и почувствовать живое общение с природой.",
                    quote: "<<Забота дает крылья>>"
                ))
            ]
        )
    ]
    
    private let stackView: UIStackView = {
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
        image.image = UIImage(named: "farmLogo")
        image.layer.cornerRadius = 15
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 10)
        label.text = "СЕМЕЙНАЯ ФЕРМА"
        label.textColor = UIColor(named: "farmColors")
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let farmNameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.font = UIFont.boldSystemFont(ofSize: 20)
        nameLabel.text = "Horse Man Wings"
        nameLabel.textColor = .black
        nameLabel.numberOfLines = 1
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return nameLabel
    }()
    
    private let notificationButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "bell"), for: .normal)
        button.tintColor = .black
        button.backgroundColor = .white
        button.layer.cornerRadius = 15
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupConstraint()
        view.backgroundColor = UIColor(named: "mainBackground")
    }
    
    private func makeCollectionLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { sectionIndex, _ in

            let itemSize = NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .estimated(390)
            )

            let item = NSCollectionLayoutItem(layoutSize: itemSize)

            let group = NSCollectionLayoutGroup.horizontal(
                layoutSize: itemSize,
                subitems: [item]
            )

            let section = NSCollectionLayoutSection(group: group)

            section.contentInsets = NSDirectionalEdgeInsets(
                top: 6,
                leading: 16,
                bottom: 0,
                trailing: 16
            )

            if sectionIndex > 0 {
                let headerSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .absolute(30)
                )

                let header = NSCollectionLayoutBoundarySupplementaryItem(
                    layoutSize: headerSize,
                    elementKind: UICollectionView.elementKindSectionHeader,
                    alignment: .top,
                    absoluteOffset: CGPoint(x: 0, y: 33)
                )
                section.boundarySupplementaryItems = [header]
            }

            return section
        }

        return layout
    }
    
    private func setupUI() {
        view.addSubview(collectionView)
        
        labelStackView.addArrangedSubview(titleLabel)
        labelStackView.addArrangedSubview(farmNameLabel)
        
        stackView.addArrangedSubview(logoImage)
        stackView.addArrangedSubview(labelStackView)
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: stackView)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: notificationButton)
    }
    
    private func setupConstraint() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            logoImage.heightAnchor.constraint(equalToConstant: 40),
            logoImage.widthAnchor.constraint(equalToConstant: 40),
            
            notificationButton.heightAnchor.constraint(equalToConstant: 40),
            notificationButton.widthAnchor.constraint(equalToConstant: 40),
        
        ])
    }
}

extension AboutFarmVC: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        dataSourse.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        dataSourse[section].cells.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = dataSourse[indexPath.section].cells[indexPath.item]
        
        switch item {
        case let .banner(model):
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier:AboutFarmBannerCell.identifier, for: indexPath) as! AboutFarmBannerCell
            cell.configure(model: model)
            
            return cell
            
        case let .aboutText(model):
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier:AboutFarmTextCell.identifier, for: indexPath) as! AboutFarmTextCell
            cell.configure(model: model)
            
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard kind == UICollectionView.elementKindSectionHeader else {
            return UICollectionReusableView()
        }
        
        let header = collectionView.dequeueReusableSupplementaryView(
            ofKind: kind,
            withReuseIdentifier: AboutFarmSectionHeaderView.identifire,
            for: indexPath
        ) as! AboutFarmSectionHeaderView
        
        if let title = dataSourse[indexPath.section].title {
                header.configure(title: title)
        }
        return header
    }
    
    private final class AboutFarmSectionHeaderView: UICollectionReusableView {
        
        static let identifire = String(describing: AboutFarmSectionHeaderView.self)
        
        private let titleLabel: UILabel = {
            
            let label = UILabel()
            
            label.textColor = .farmColors
            label.font = .systemFont(ofSize: 10, weight: .regular)
            label.numberOfLines = 0
            label.translatesAutoresizingMaskIntoConstraints = false
            
            return label
        }()
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            
            addSubview(titleLabel)
            
            NSLayoutConstraint.activate([
                titleLabel.topAnchor.constraint(equalTo: topAnchor),
                titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
                titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
                titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
            ])
        }
        
        required init?(coder: NSCoder) {
            fatalError()
        }
        
        func configure(title: String) {
            titleLabel.text = title
        }
    }
}
