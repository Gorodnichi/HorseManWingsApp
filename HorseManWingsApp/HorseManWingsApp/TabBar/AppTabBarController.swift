import UIKit

final class AppTabBarController: UITabBarController {
    
    private let selectedIndicator: UIView = {
        let view = UIView()
        view.backgroundColor = .caramel
        view.layer.cornerRadius = 2
        
        return view
    }()
    
    private let tabBarHeight: CGFloat = 84
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabs()
        setupAppearance()
    }
    
    override func viewDidLayoutSubviews() {
           super.viewDidLayoutSubviews()

           tabBar.frame = CGRect(
               x: 16,
               y: view.bounds.height - tabBarHeight - 20,
               width: view.bounds.width - 32,
               height: tabBarHeight
           )

           tabBar.layer.cornerRadius = 26
           tabBar.clipsToBounds = true

           updateIndicator()
       }
    
    private func setupTabs() {
        let aboutFarm = UINavigationController(rootViewController: AboutFarmVC())
        aboutFarm.tabBarItem = AppTabBarItem.aboutFarm.tabBarItem
        
        let animal = UINavigationController(rootViewController: AnimalsVC())
        animal.tabBarItem = AppTabBarItem.animals.tabBarItem
        
        let services = UINavigationController(rootViewController: ServicesVC())
        services.tabBarItem = AppTabBarItem.services.tabBarItem
        
        let profile = UINavigationController(rootViewController: ProfileVC())
        profile.tabBarItem = AppTabBarItem.profile.tabBarItem
        
        viewControllers = [
            aboutFarm,
            animal,
            services,
            profile
        ]
    }
    
    private func setupAppearance() {
        
        let apperance = UITabBarAppearance()
        apperance.configureWithTransparentBackground()
        
        apperance.backgroundColor = .witeCream
        
        apperance.shadowColor = .clear
        
        apperance.stackedLayoutAppearance.normal.iconColor = .oliveGray
        apperance.stackedLayoutAppearance.selected.iconColor = .accent
        
        apperance.stackedLayoutAppearance.normal.titleTextAttributes = [ .foregroundColor: UIColor.oliveGray]
        apperance.stackedLayoutAppearance.selected.titleTextAttributes = [ .foregroundColor: UIColor.accent]
        
        
        tabBar.standardAppearance = apperance
        tabBar.scrollEdgeAppearance = apperance
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
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        updateIndicator()
    }
}


