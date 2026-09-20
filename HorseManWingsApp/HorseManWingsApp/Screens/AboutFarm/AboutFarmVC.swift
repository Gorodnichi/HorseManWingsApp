
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
    
    private let headerView = AboutFarmHeaderView()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupConstraint()
        view.backgroundColor = AppColors.mainBackground
    }
    
    private func setupUI() {
        view.addSubview(collectionView)
        
        headerView.configure(
            model: AboutFarmHeaderView.Model(
                title: "СЕМЕЙНАЯ ФЕРМА",
                farmName: "Horse Man Wings",
                logo: UIImage(named: "farmLogo")
            )
        )
        
        navigationItem.leftBarButtonItem = headerView.makeLeftBarButtonItem()

        navigationItem.rightBarButtonItem = headerView.makeRightBarButtonItem()
    }
        func setupConstraint() {
            NSLayoutConstraint.activate([
                collectionView.topAnchor.constraint(equalTo: view.topAnchor),
                collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
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

