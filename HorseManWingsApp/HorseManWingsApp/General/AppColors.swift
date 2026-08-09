
import UIKit

enum AppColors {
    static let mainBackground = UIColor(hex: 0xF5F0E7)
    
    static let farmColors = UIColor(hex: 0x2F6247)
}

private extension UIColor {
    convenience init(hex: UInt32) {
        let red = CGFloat((hex >> 16) & 0xFF) / 255
        let green = CGFloat((hex >> 8) & 0xFF) / 255
        let blue = CGFloat(hex & 0xFF) / 255
        self.init(red: red, green: green, blue: blue, alpha: 1)
    }
}

