import UIKit

enum AppTabBarItem: CaseIterable {
    case aboutFarm
    case animals
    case services
    case profile
    
    var tabBarItem: UITabBarItem {
        switch self {
        case .aboutFarm:
            return UITabBarItem(
                title: "О ферме",
                image: .icHome,
                selectedImage: nil
            )
            
        case .animals:
            return UITabBarItem(
                title: "Животные",
                image: .icAnimal,
                selectedImage: nil
            )
            
        case .services:
            return UITabBarItem(
                title: "Услуги",
                image: .icServices,
                selectedImage: nil
            )
            
        case .profile:
            return UITabBarItem(
                title: "Профиль",
                image: .icProfile,
                selectedImage: nil
            )
        }
    }
}
