import UIKit

class BankAccountsVC: UIViewController {

    @IBOutlet weak var BankAccountsTV: UITableView!
    @IBOutlet weak var addBtn: UIButton!

    var presenter: BankAccountsPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()

        setupPresenter()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tabBarController?.tabBar.isHidden = false
        self.navigationController?.navigationBar.topItem?.title = "Bank Accounts"
        navigationItem.backButtonTitle = ""
        self.customizeNavBar(navBarimage: "tabBarPic", navBarTintColor: .white, titleColor: .white)
        
        // Getting Banks API
        presenter.getBankAccountsApi()
        
    }
    
    // MARK: - Add Button
    @IBAction func addBtnPressed(_ sender: Any) {
        addBtn.isEnabled = false
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "AddBankAccountVC") as! AddBankAccountVC
        navigationController?.pushViewController(vc, animated: true)
        vc.titleVC = "Add Bank Account"
        vc.addBtnTitle = "Add"
        
        addBtn.isEnabled = true
    }


    
}

