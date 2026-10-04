
import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

		setupConstraints()
		sayHello()
    }

	func setupConstraints() {
		print("setup constraints")
    }

	func sayHello() {
		print("say hello")
	}
}
