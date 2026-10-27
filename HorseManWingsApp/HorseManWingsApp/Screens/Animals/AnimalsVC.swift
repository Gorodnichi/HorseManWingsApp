import UIKit

final class AnimalsVC: UIViewController {
    
    private enum Cells {
        case preview(AboutAnimalsPreviewCell.Model)
        case search
        case filter(AboutAnimalFilterCell.Model)

    }
    
    private struct Section {
        let title: String?
        let cells: [Cells]
    }
    
    private lazy var collectionView: UICollectionView = {
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: makeCollectionLayout()
        )
        collectionView.dataSource = self
        collectionView.register(AboutAnimalsPreviewCell.self, forCellWithReuseIdentifier: AboutAnimalsPreviewCell.identifier)
        collectionView.register(AboutAnimalSearchCell.self, forCellWithReuseIdentifier: AboutAnimalSearchCell.identifier)
        collectionView.register(AboutAnimalFilterCell.self, forCellWithReuseIdentifier: AboutAnimalFilterCell.identifier)
        collectionView.backgroundColor = .clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    private var searchText = ""
    
    private var dataSource: [Section] = [
        Section(
            title: "НАШИ ЖИТЕЛИ",
            cells: [
                .preview(AboutAnimalsPreviewCell.Model(
                    title: "НАШИ ЖИТЕЛИ",
                    badgeTitle: "Животные",
                    subtitle: "Познакомьтесь с теми, ради кого всё началось"
                )),
                
            ]
        ),
        Section(
            title: nil,
            cells: [
                .search
            ]
        ),
        
        Section(title: nil,
                cells: [.filter(AboutAnimalFilterCell.Model(
                    all: "Все",
                    horses: "Лошади",
                    birds: "Птицы",
                    farm: "Ферма")
                )
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
        image.image = .icLogo
        image.layer.cornerRadius = 15
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 10)
        label.text = "СЕМЕЙНАЯ ФЕРМА"
        label.textColor = .accent
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
    }
    
    private func setupUI() {
        view.backgroundColor = .mainBackground
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
    
    private func makeCollectionLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { sectionIndex, _ in
            
            if sectionIndex == 1 {
                let itemSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .absolute(46)
                )

                let item = NSCollectionLayoutItem(layoutSize: itemSize)

                let group = NSCollectionLayoutGroup.horizontal(
                    layoutSize: itemSize,
                    subitems: [item]
                )

                let section = NSCollectionLayoutSection(group: group)

                section.contentInsets = NSDirectionalEdgeInsets(
                    top: 20,
                    leading: 16,
                    bottom: 0,
                    trailing: 16
                )

                return section
            }
            
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
                top: 12,
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
}

extension AnimalsVC: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        dataSource[section].cells.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = dataSource[indexPath.section].cells[indexPath.item]
        
        switch item {
            
        case let .preview(model):
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AboutAnimalsPreviewCell.identifier, for: indexPath) as! AboutAnimalsPreviewCell
            cell.configure(model: model)
            
            return cell
            
        case .search:
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: AboutAnimalSearchCell.identifier,
                for: indexPath
            ) as! AboutAnimalSearchCell
            
            cell.onSearchTextChanged = { [weak self] text in
                self?.searchText = text
            }
            
            return cell

        case let .filter(model):
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AboutAnimalFilterCell.identifier, for: indexPath) as! AboutAnimalFilterCell
            
            cell.configure(model: model)
            
            return cell
        }
    }
}

