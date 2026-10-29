import UIKit

class AppTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabs()
        tabBar.tintColor = .accent
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
}
