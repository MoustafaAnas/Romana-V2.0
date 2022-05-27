import UIKit
import AnimatableReload
import FTIndicator

class HomeVC: UIViewController {
     
    @IBOutlet weak var homeTableView: UITableView!
    
    var sectionDataArr = [HomeCollectionViewData]()
    var policyTVDataArr = [PolicyTVCellData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        homeTableView.delegate = self
        homeTableView.dataSource = self
        tabBarController?.tabBar.isHidden = false
        
        sectionDataArr.append(HomeCollectionViewData(sectionName: "Recent Requisitions", collectionViewData: [HomeCollectionViewCellData(orderName: "12345", orderDate: "1/5/2022", itemsNumber: "123", orderPrice: ""), HomeCollectionViewCellData(orderName: "12345", orderDate: "1/5/2022", itemsNumber: "123", orderPrice: ""), HomeCollectionViewCellData(orderName: "12345", orderDate: "1/5/2022", itemsNumber: "123", orderPrice: "")]))
        
        sectionDataArr.append(HomeCollectionViewData(sectionName: "Recent Invoices", collectionViewData: [HomeCollectionViewCellData(orderName: "#12345", orderDate: "1/8/2022", itemsNumber: "123", orderPrice: "150 SR"), HomeCollectionViewCellData(orderName: "!12345", orderDate: "1/6/2022", itemsNumber: "123", orderPrice: "100 SR"), HomeCollectionViewCellData(orderName: "!12345", orderDate: "1/6/2022", itemsNumber: "123", orderPrice: "100 SR"), HomeCollectionViewCellData(orderName: "!12345", orderDate: "1/6/2022", itemsNumber: "123", orderPrice: "1500 SR"), HomeCollectionViewCellData(orderName: "!12345", orderDate: "1/6/2022", itemsNumber: "123", orderPrice: "200 SR")]))
        
        policyTVDataArr.append(PolicyTVCellData(orderPrice: "1500 SR", oderDate: "1/5/2022", orderID: "#123456"))
        policyTVDataArr.append(PolicyTVCellData(orderPrice: "1500 SR", oderDate: "1/5/2022", orderID: "#123456"))
        policyTVDataArr.append(PolicyTVCellData(orderPrice: "1500 SR", oderDate: "1/5/2022", orderID: "#123456"))
        
        AnimatableReload.reload(tableView: self.homeTableView, animationDirection: "left")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        addNavBarImage(img: "logo2")
        navigationItem.backButtonTitle = ""
        tabBarController?.tabBar.isHidden = false
        self.customizeNavBar(navBarimage: "tabBarPic", navBarTintColor: .white, titleColor: .white)
    }

    // MARK: - Go to Bills ViewController after clicking on show all in Recent Invoices
    @objc func goToBillsVC(sender: UIButton){
        let indexpath = IndexPath(row: sender.tag, section: 0)
        
        if indexpath.row == 0 {
        print("Recent Requisitions")
        } else {
            tabBarController?.selectedIndex = 1
        }
    }
    
    // MARK: - Go to Policies ViewController after clicking on show all in Recent Policies
    @objc func goToPoliciesVC(sender: UIButton){
        let vc = storyboard?.instantiateViewController(withIdentifier: "PoliciesVC") as! PoliciesVC
        navigationController?.pushViewController(vc, animated: true)
    }
    
    // MARK: - Add Image to The NavigationBar Title
    func addNavBarImage(img: String) {
    
        let navController = navigationController!
    
        let image = UIImage(named: img)
        let imageView = UIImageView(image: image)
        let bannerWidth = navController.navigationBar.frame.size.width
        let bannerHeight = navController.navigationBar.frame.size.height
    
        let bannerX = bannerWidth / 2 - (image?.size.width)! / 2
        let bannerY = bannerHeight / 2 - (image?.size.height)! / 2
    
        imageView.frame = CGRect(x: bannerX, y: bannerY, width: bannerWidth, height: bannerHeight)
        imageView.contentMode = .scaleAspectFit
    
        navigationItem.titleView = imageView
    }
   
}

