import UIKit

final class AboutFarmSectionHeaderView: UICollectionReusableView {

	static let identifire = String(describing: AboutFarmSectionHeaderView.self)

	private let titleLabel: UILabel = {

		let label = UILabel()

		label.textColor = .accent
		label.font = .systemFont(ofSize: 10, weight: .regular)
		label.numberOfLines = 0
		label.translatesAutoresizingMaskIntoConstraints = false

		return label
	}()

	override init(frame: CGRect) {
		super.init(frame: frame)

		addSubview(titleLabel)

		NSLayoutConstraint.activate([
			titleLabel.topAnchor.constraint(equalTo: topAnchor),
			titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
			titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
			titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
		])
	}

	required init?(coder: NSCoder) {
		fatalError()
	}

	func configure(title: String) {
		titleLabel.text = title
	}
}
