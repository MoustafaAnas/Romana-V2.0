
import UIKit

extension UIViewController {
    
    func customizeNavBar (navBarimage: String, navBarTintColor: UIColor, titleColor: UIColor) {
    let appearance = UINavigationBarAppearance()
    appearance.configureWithOpaqueBackground()
    appearance.backgroundImage =  UIImage(named: navBarimage)
    appearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: titleColor]
    navigationController?.navigationBar.standardAppearance = appearance
    navigationController?.navigationBar.scrollEdgeAppearance = navigationController?.navigationBar.standardAppearance
    navigationController?.navigationBar.tintColor = navBarTintColor
}

}
