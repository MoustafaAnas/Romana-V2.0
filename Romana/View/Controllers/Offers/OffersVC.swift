import UIKit

class OffersVC: UIViewController {

    @IBOutlet weak var offersTV: UITableView!
    
    var presenter: OffersPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Offers"
        navigationItem.backButtonTitle = ""
        
        setupPresenter()
        
        setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tabBarController?.tabBar.isHidden = true
        
        // Getting Offers API
        presenter.getOffersApi()
               
    }
    
    
}


