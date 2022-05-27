import UIKit

// MARK: - AddEmployee Protocol
protocol AddEmployeeView: AnyObject {
    func setPermissions(permissions: [String])
    func goBackToAllUsers()
}

// MARK: - AddEmployee Presenter
class AddEmployeePresenter {
    
    // Create delegate Variable
    private weak var delegate: AddEmployeeView?
    
    // Setup Delegate
    init(delegate: AddEmployeeView) {
        self.delegate = delegate
    }
    
    // Get Permissions Api Func
    func getPermissionsApi() {
        API.getPermissionsCodeNetwork(Url: URLs.permissions_Url) {error,success,data in
            if success {
                self.delegate?.setPermissions(permissions: data)
            }
        }
    }
    
    // Add User Api Func
    func addUsersApi(userName: String, phoneNumber: String, email: String, permissions: [String], password: String) {
        API.addUserCodeNetwork(Url: URLs.users_Url, name: userName, phone: phoneNumber, email: email, permissions: permissions, password: password) { error, success in
            if success {
                self.delegate?.goBackToAllUsers()
            }
        }
    }
    
    // Edit User Info Api Func
    func editUsersApi(userID: Int, userName: String, phoneNumber: String, email: String, permissions: [String]) {
        API.updateUserCodeNetwork(ID: userID, name: userName, phone: phoneNumber, email: email, permissions: permissions) { error, success in
            if success {
                self.delegate?.goBackToAllUsers()
            }
        }
    }
    
   
    
  
    
}



