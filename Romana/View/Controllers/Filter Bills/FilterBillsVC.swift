import UIKit

class FilterBillsVC: UIViewController {

    @IBOutlet weak var startingDateTextField: UITextField!
    @IBOutlet weak var endingDateTextField: UITextField!
    @IBOutlet weak var confirmBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupToHideKeyboardOnTapOnView()
        
        setupTxtField()
        
        startingDateTextField.addRightIcon(icon: UIImage(systemName: "calendar")!, tintColor: .brown)
        endingDateTextField.addRightIcon(icon: UIImage(systemName: "calendar")!, tintColor: .brown)
    }
    

    // MARK: - All Items Filter Button
    @IBAction func allBtnPressed(_ sender: Any) {
    }
    
    // MARK: - Confirm Data Selected in Filter
    @IBAction func confirmBtnPreesed(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    // MARK: - Close FilterView Button
    @IBAction func closeEditViewBtnPressed(_ sender: Any) {
        self.dismiss(animated: true)
    }

}
