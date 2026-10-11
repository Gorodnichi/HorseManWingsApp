import UIKit

final class AppTabBarController: UITabBarController {
    
    private let selectedIndicator: UIView = {
        let view = UIView()
        view.backgroundColor = .caramel
        view.layer.cornerRadius = 2
        
        return view
    }()
    
    private let tabBarHeight: CGFloat = 76
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabs()
        setupAperance()
    }
    
    override func viewDidLayoutSubviews() {
           super.viewDidLayoutSubviews()

           tabBar.frame = CGRect(
               x: 16,
               y: view.bounds.height - tabBarHeight - 20,
               width: view.bounds.width - 32,
               height: tabBarHeight
           )

           tabBar.layer.cornerRadius = 30
           tabBar.clipsToBounds = true

           updateIndicator()
       }
    
    private func setupTabs() {
        let aboutFarm = UINavigationController(rootViewController: AboutFarmVC())
        
        aboutFarm.tabBarItem = UITabBarItem(
            title: "О ферме",
            image: UIImage(named: "icHome"),
            selectedImage: UIImage(named: "icHomeFill")
        )
        
        let animal = UINavigationController(rootViewController: AnimalsVC())
        
        animal.tabBarItem = UITabBarItem(
            title: "Животные",
            image: UIImage(named: "icAnimal"),
            selectedImage: UIImage(named: "icAnimalFill")
        )
        
        let services = UINavigationController(rootViewController: ServicesVC())
        
        services.tabBarItem = UITabBarItem(
            title: "Услуги",
            image: UIImage(named: "icServices"),
            selectedImage: UIImage(named: "icServicesFill")
        )
        
        let profile = UINavigationController(rootViewController: ProfileVC())
        
        profile.tabBarItem = UITabBarItem(
            title: "Профиль",
            image: UIImage(named: "icProfile"),
            selectedImage: UIImage(named: "icProfileFill")
        )
        
        viewControllers = [
            aboutFarm,
            animal,
            services,
            profile
        ]
    }
    
    private func setupAperance() {
        
        let apperance = UITabBarAppearance()
        apperance.configureWithTransparentBackground()
        
        apperance.backgroundColor = UIColor(
            red: 1.0,
            green: 0.99,
            blue: 0.96,
            alpha: 0.94
        )
        
        apperance.shadowColor = .clear
        
        apperance.stackedLayoutAppearance.normal.titleTextAttributes = [ .foregroundColor: UIColor.systemGray]
        apperance.stackedLayoutAppearance.selected.titleTextAttributes = [ .foregroundColor: UIColor(named: "accentColor") ?? UIColor.systemGreen]
        
        tabBar.standardAppearance = apperance
        tabBar.scrollEdgeAppearance = apperance
        tabBar.tintColor = .systemGreen
        tabBar.unselectedItemTintColor = .systemGray
        tabBar.isTranslucent = true
        tabBar.addSubview(selectedIndicator)
    }
    private func updateIndicator() {
        guard let items = tabBar.items, !items.isEmpty else {
            return
        }
        
        let itemWidth = tabBar.bounds.width / CGFloat(items.count)
        
        selectedIndicator.frame = CGRect(
            x: itemWidth * CGFloat(selectedIndex) + (itemWidth - 24) / 2,
            y: 4,
            width: 24,
            height: 4
        )
    }
    
    override func tabBar(
        _ tabBar: UITabBar,
        didSelect item: UITabBarItem
    ) {
        updateIndicator()
    }
}


