
import UIKit

final class AboutFarmVC: UIViewController {
    
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: UICollectionViewFlowLayout()
        )
        collectionView.backgroundColor = .clear
        collectionView.dataSource = self
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "id")
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        return collectionView
    }()
    
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
        image.layer.cornerRadius = 10
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 10)
        label.text = "СЕМЕЙНАЯ ФЕРМА"
        label.textColor = AppColors.farmColors
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
        button.layer.cornerRadius = 20
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupConstraint()
        view.backgroundColor = AppColors.mainBackground
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
        3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        collectionView.dequeueReusableCell(withReuseIdentifier: "id", for: indexPath)
    }
}

