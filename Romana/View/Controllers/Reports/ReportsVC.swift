//
//  ReportsVC.swift
//  Romana
//
//  Created by Moustafa Anas on 07/02/2022.
//

import UIKit

class ReportsVC: UIViewController {

    @IBOutlet weak var empolyessCountLbl: UILabel!
    @IBOutlet weak var allBillsForEachIndevLbl: UILabel!
    @IBOutlet weak var allAmountPaidOfMoneyLbl: UILabel!
    @IBOutlet weak var allAmountOfMoneyLeftLbl: UILabel!
    @IBOutlet weak var detailsBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Reports"
        navigationItem.backButtonTitle = ""
    }
    override func viewWillAppear(_ animated: Bool) {
        tabBarController?.tabBar.isHidden = true
    }

    // MARK: - Details Button
    @IBAction func detailsBtnPressed(_ sender: Any) {
 
    }
    

}
