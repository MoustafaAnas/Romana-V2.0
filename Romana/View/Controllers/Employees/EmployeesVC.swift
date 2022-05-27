import UIKit

class EmployeesVC: UIViewController {
    
    @IBOutlet weak var employeesTV: UITableView!
    @IBOutlet weak var addBtn: UIButton!
    
    let refreshControl = UIRefreshControl()
    
    var presenter: EmployeePresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Employees"
        navigationItem.backButtonTitle = ""
        
        setupTableView()
        
        setupPresenter()
        
        refreshControlPulled()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tabBarController?.tabBar.isHidden = true
        presenter.getUsersApi()
    }
    
    // MARK: - Refreshing After Pulling
    func refreshControlPulled() {
        refreshControl.tintColor = UIColor.brown
        refreshControl.addTarget(self, action: #selector(refreshVC), for: .valueChanged)
        employeesTV.addSubview(refreshControl)
    }
    
    // Refresh Action
    @objc func refreshVC() {
        refreshControl.endRefreshing()
        presenter.getUsersApi()
    }

    // MARK: - Add Button
    @IBAction func addBtnPressed(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "AddEmployeeVC") as! AddEmployeeVC
        navigationController?.pushViewController(vc, animated: true)
        vc.titleVC = "Add Employee"
        vc.titleBtn = "Add"
    }

  
    
}


