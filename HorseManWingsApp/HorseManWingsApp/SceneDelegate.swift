

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let scene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: scene)
        
        if #available(iOS 26.0, *) {
            window.rootViewController = AppTabBarController()
        } else {
            window.rootViewController = AppTabBarControllerLegacy()
        }
        self.window = window
        window.makeKeyAndVisible()
    }
}
