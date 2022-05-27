import UIKit

class MyProductsVC: UIViewController {
   

    @IBOutlet weak var productTableView: UITableView!
    @IBOutlet weak var addNewProductBtn: UIButton!
    @IBOutlet weak var filterBtnHightConst: NSLayoutConstraint!
    
    var productsIsFiltered: Bool!
    var presenter: MyProductsPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "My Products"
        navigationItem.backButtonTitle = ""
        
        setupTableView()
        
        setupPresenter()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tabBarController?.tabBar.isHidden = true
        productsIsFiltered = false
        presenter.getMyProductsApi(Url: URLs.stock_Url)
    }
    
    // MARK: - More Button
    @IBAction func moreBtnPressed(_ sender: Any) {
        if filterBtnHightConst.constant == 0 {
        UIView.animate(withDuration: 0.2) {
            self.filterBtnHightConst.constant = 50
            self.view.layoutIfNeeded()
        }
        } else {
            UIView.animate(withDuration: 0.2) {
                self.filterBtnHightConst.constant = 0
                self.view.layoutIfNeeded()
            }
        }
    }
    
    // MARK: - Filter Products Button
    @IBAction func filterBtnPressed(_ sender: Any) {
        productsIsFiltered = !productsIsFiltered
        
        if productsIsFiltered {
            presenter.getMyProductsApi(Url: URLs.products_Url)
        } else {
            presenter.getMyProductsApi(Url: URLs.stock_Url)
        }
        
        if filterBtnHightConst.constant == 50 {
        UIView.animate(withDuration: 0.2) {
            self.filterBtnHightConst.constant = 0
            self.view.layoutIfNeeded()
            }
        }
    }
    
    // MARK: - Add NewProduct Button
    @IBAction func addBtnPressed(_ sender: Any) {
        addNewProductBtn.isEnabled = false
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "AddProductVC") as! AddProductVC
        navigationController?.pushViewController(vc, animated: true)
        
        if filterBtnHightConst.constant == 50 {
        UIView.animate(withDuration: 0.2) {
            self.filterBtnHightConst.constant = 0
            self.view.layoutIfNeeded()
            }
        }
        
        addNewProductBtn.isEnabled = true
    }
   
   

}


