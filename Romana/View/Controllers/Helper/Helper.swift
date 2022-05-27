import UIKit

class Helper: NSObject {
    
    // MARK: - Restert App
    class func restartApp() {
        guard let window = UIApplication.shared.currentWindow else {return}
        
        let loginSB = UIStoryboard(name: "Main", bundle: nil)
        let homeSB = UIStoryboard(name: "TabBar", bundle: nil)
        let vc: UIViewController
        if getApiToken() == nil {
            vc = loginSB.instantiateViewController(withIdentifier: "CustomizeNavigationController")
        }
        else {
            vc = homeSB.instantiateViewController(withIdentifier: "TabBarVC")
        }
        window.rootViewController = vc
        UIView.transition(with: window, duration: 0.5, options: .transitionCrossDissolve, animations: nil, completion: nil)
    }
    
    // MARK: - Token
    class func getApiToken() -> String? {
        let token = UserDefaults.standard.object(forKey: "token") as? String
        
        return token
    }
}
