import UIKit

final class FilterButton: UIButton {
	override func layoutSubviews() {
		super.layoutSubviews()
		layer.cornerRadius = bounds.height / 2
	}
}
