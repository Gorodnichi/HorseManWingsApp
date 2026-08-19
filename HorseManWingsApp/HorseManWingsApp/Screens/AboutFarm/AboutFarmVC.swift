
import UIKit

final class AboutFarmVC: UIViewController {
    
    private enum Cells {
        case banner(AboutFarmBannerCell.Model)
        case about(AboutFarmAboutCell.Model)
    }
    
    private lazy var collectionView: UICollectionView = {
       
        let collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: makeCollectionLayout()
        )
        collectionView.backgroundColor = .clear
        collectionView.dataSource = self
        collectionView.register(AboutFarmBannerCell.self, forCellWithReuseIdentifier: AboutFarmBannerCell.identifier)
        collectionView.register(AboutFarmAboutCell.self, forCellWithReuseIdentifier: AboutFarmAboutCell.identifier)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        return collectionView
    }()
    
    private var dataSourse: [Cells] = [
        .banner(AboutFarmBannerCell.Model(image: .horseBanner, title: "Место где становятся ближе к природе", subtitle: "Знакомим детей и взрослых с животными бережно и по-настоящему"
        )),
        .about(AboutFarmAboutCell.Model(text: "Мы создали Horse Man Wings, чтобы у каждого была возможность остановиться, выдохнуть и почувствовать живое общение с природой."
        ))
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
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(390))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: itemSize, subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 30 
        let layout = UICollectionViewCompositionalLayout(section: section)
        section.contentInsets = NSDirectionalEdgeInsets(
            top: 0,
            leading: 16,
            bottom: 0,
            trailing: 16)
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
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        dataSourse.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = dataSourse[indexPath.item]
        
        switch item {
        case let .banner(model):
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier:AboutFarmBannerCell.identifier, for: indexPath) as! AboutFarmBannerCell
            cell.configure(model: model)
            
        return cell
            
        case let .about(model):
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier:AboutFarmAboutCell.identifier, for: indexPath) as! AboutFarmAboutCell
            cell.configure(model: model)
            
        return cell
        }
    }
}

