import UIKit

class StorageVC: UIViewController {

    @IBOutlet weak var storageTV: UITableView!
    
    let refreshControl = UIRefreshControl()
    var presenter: StoragePresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Storage"
        navigationItem.backButtonTitle = ""
    
        setupTableView()
        setupPresenter()
        
        presenter.getStorageApi()
        
        refreshControlPulled()
    }
   
    override func viewWillAppear(_ animated: Bool) {
        tabBarController?.tabBar.isHidden = true
    }

    // MARK: - Refreshing After Pulling
    func refreshControlPulled() {
        refreshControl.tintColor = UIColor.brown
        refreshControl.addTarget(self, action: #selector(refreshVC), for: .valueChanged)
        storageTV.addSubview(refreshControl)
    }
    
    // Refreshing Action
    @objc func refreshVC() {
        refreshControl.endRefreshing()
        presenter.getStorageApi()
    }
   
   

}


