import UIKit

final class AboutAnimalSearchCell: UICollectionViewCell {
    
    var onSearchTextChanged: ((String) -> Void)?
    
    private let searchTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Найти животное"
        textField.font = .systemFont(ofSize: 14)
        textField.backgroundColor = .white
        textField.textColor = .greenGray
        textField.attributedPlaceholder = NSAttributedString(string: "Найти животное", attributes: [.foregroundColor: UIColor.systemGray])
        textField.layer.cornerRadius = 22
        textField.clipsToBounds = true
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 48, height: 1))
        textField.leftViewMode = .always

        textField.translatesAutoresizingMaskIntoConstraints = false

        return textField
       }()
    
    private let searchIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .search
        imageView.tintColor = .accent
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false

        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        searchTextField.addTarget(self, action: #selector(searchTextDidChange), for: .editingChanged)
        setupUI()
        setupConstraint()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        contentView.addSubview(searchTextField)
        contentView.addSubview(searchIcon)
    }
    
    private func setupConstraint() {
        NSLayoutConstraint.activate([
            searchTextField.topAnchor.constraint(equalTo: contentView.topAnchor),
            searchTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            searchTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            searchTextField.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
			searchTextField.heightAnchor.constraint(equalToConstant: 46),

            searchIcon.leadingAnchor.constraint(equalTo: searchTextField.leadingAnchor, constant: 18),
            searchIcon.centerYAnchor.constraint(equalTo: searchTextField.centerYAnchor),
            searchIcon.widthAnchor.constraint(equalToConstant: 20),
            searchIcon.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    @objc private func searchTextDidChange() {
        onSearchTextChanged?(searchTextField.text ?? "")
    }
}
