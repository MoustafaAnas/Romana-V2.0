import UIKit

extension ChangePasswordVC: ChangePasswordView {
 
    // MARK: - Setting up Presenter
    func setupPresenter() {
        presenter = ChangePasswordPresnter(delegate: self)
    }
    
    // MARK: - Go back to edit Profile Method
    func goBackToEditProfile() {
        self.dismiss(animated: true)
    }
    
}
