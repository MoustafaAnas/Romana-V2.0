import UIKit

extension ProfileVC: ProfileView {
 
    // MARK: - Setting up Presenter
    func setupPresenter() {
        presenter = ProfilePresnter(delegate: self)
    }
    
    // MARK: - Go back to edit profile Action
    func goBackToEditProfile() {
        self.title = "Profile"
        self.saveBtn.isHidden = true
        self.changeProfilePicBtn.isHidden = true
        self.navigationItem.rightBarButtonItem?.isEnabled = true
        self.navigationItem.rightBarButtonItem?.image = UIImage(systemName: "pencil")
    }
    
}
