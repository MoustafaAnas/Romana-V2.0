import UIKit
import AnimatableReload

class PoliciesVC: UIViewController {
    

    @IBOutlet weak var policiesTableView: UITableView!
    var policyCellData = [PolicyTVCellData]()
    let refreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Policy"
        navigationItem.backButtonTitle = ""
        
        setupTableView()
        
        
        policyCellData.append(PolicyTVCellData(orderPrice: "1500 SR", oderDate: "1/5/2022", orderID: "#123456"))
        policyCellData.append(PolicyTVCellData(orderPrice: "1500 SR", oderDate: "1/5/2022", orderID: "#123456"))
        policyCellData.append(PolicyTVCellData(orderPrice: "1500 SR", oderDate: "1/5/2022", orderID: "#123456"))
        policyCellData.append(PolicyTVCellData(orderPrice: "1500 SR", oderDate: "1/5/2022", orderID: "#123456"))
        
        AnimatableReload.reload(tableView: self.policiesTableView, animationDirection: "right")
        
        refreshControlPulled()

        self.noDataToDisplayMsg(tableview: policiesTableView, tableViewDataArrCount: policyCellData.count)
    }
    override func viewWillAppear(_ animated: Bool) {
        tabBarController?.tabBar.isHidden = true
    }
    
    // MARK: - Refreshing After Pulling
    func refreshControlPulled() {
        refreshControl.tintColor = UIColor.brown
        refreshControl.addTarget(self, action: #selector(refreshVC), for: .valueChanged)
        policiesTableView.addSubview(refreshControl)
    }
    
    // Refreshing Action
    @objc func refreshVC() {
        refreshControl.endRefreshing()
        self.policiesTableView.reloadData()
    }
}




