import UIKit

final class AppTabBarControllerLegacy: AppTabBarController {

    private let selectedIndicator: UIView = {
        let view = UIView()
        view.backgroundColor = .caramel
        view.layer.cornerRadius = 2

        return view
    }()

    private let tabBarHeight: CGFloat = 84

    override func viewDidLoad() {
        super.viewDidLoad()
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

    private func setupAppearance() {
        let appearance = UITabBarAppearance()
        appearance.configureWithTransparentBackground()
        appearance.backgroundColor = .witeCream
        appearance.shadowColor = .clear

        appearance.stackedLayoutAppearance.normal.iconColor = .oliveGray
        appearance.stackedLayoutAppearance.selected.iconColor = .accent
        appearance.stackedLayoutAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.oliveGray]
        appearance.stackedLayoutAppearance.selected.titleTextAttributes = [.foregroundColor: UIColor.accent]

        tabBar.standardAppearance = appearance
        tabBar.scrollEdgeAppearance = appearance
        tabBar.isTranslucent = true
        tabBar.layer.borderWidth = 1
        tabBar.layer.borderColor = UIColor.oliveGray.withAlphaComponent(0.2).cgColor
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
