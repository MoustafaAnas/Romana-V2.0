import UIKit

class BillsVC: UIViewController {

    @IBOutlet weak var billsTableView: UITableView!
    @IBOutlet weak var processTypeSC: UISegmentedControl!
    @IBOutlet weak var editBtn: UIButton!
    
    var presenter: BillsPresenter!
    
    let refreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        setupTableView()

        setupPresenter()
        
        refreshControlPulled()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.topItem?.title = "Invoices"
        navigationItem.backButtonTitle = ""
        tabBarController?.tabBar.isHidden = false
        self.customizeNavBar(navBarimage: "tabBarPic", navBarTintColor: .white, titleColor: .white)
        
        showTableViewCurrentData()
    }
    
    // MARK: - Refreshing TableView
    func refreshControlPulled() {
        refreshControl.tintColor = UIColor.brown
        refreshControl.addTarget(self, action: #selector(refreshVC), for: .valueChanged)
        billsTableView.addSubview(refreshControl)
    }
    
    // Refreshing Action
    @objc func refreshVC() {
        refreshControl.endRefreshing()
        self.billsTableView.reloadData()
    }
    
       
    // MARK: - Change Process Type SegmentControl Current Selection
    @IBAction func processTypeSCChanged(_ sender: Any) {
        processTypeSC.isEnabled = false
        
        showTableViewCurrentData()
        
        processTypeSC.isEnabled = true
    }
    
    // MARK: - Filter Button
    @IBAction func editBtnPressed(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "FilterBillsVC") as! FilterBillsVC
        self.present(vc, animated: true)
    }
    
    // MARK: - Show Current Data Based on SegmentControl Selection
    func showTableViewCurrentData () {
        if processTypeSC.selectedSegmentIndex == 0 {
            presenter.purchaseApi()
            editBtn.isHidden = false
        } else {
            presenter.returnPurchaseApi()
            editBtn.isHidden = true
        }
    }
    

    
    
}


