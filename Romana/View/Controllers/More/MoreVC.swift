import UIKit
import AnimatableReload

class MoreVC: UIViewController {

    @IBOutlet weak var moreTabeView: UITableView!
    
    var moreArr = [MoreData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        
        AnimatableReload.reload(tableView: self.moreTabeView, animationDirection: "left")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.topItem?.title = "More"
        navigationItem.backButtonTitle = ""
        tabBarController?.tabBar.isHidden = false
        self.customizeNavBar(navBarimage: "tabBarPic", navBarTintColor: .white, titleColor: .white)
    }
    
    // MARK: - Logout Action
    func logout() {
        let pref = UserDefaults.standard
        pref.removeObject(forKey: "phone")
        pref.removeObject(forKey: "token")
        pref.removeObject(forKey: "id")
        pref.removeObject(forKey: "email")
        pref.removeObject(forKey: "image")
        pref.removeObject(forKey: "name")
        pref.removeObject(forKey: "companyName")
        pref.removeObject(forKey: "commercialNumber")
        pref.removeObject(forKey: "licenceImage")
        pref.removeObject(forKey: "commercialImage")
        pref.removeObject(forKey: "address")
        pref.synchronize()
        
        Helper.restartApp()
    }
}

