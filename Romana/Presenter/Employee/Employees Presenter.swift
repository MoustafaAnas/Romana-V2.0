import UIKit

// MARK: - Employee Protocol
protocol EmployeeView: AnyObject {
    func reloadUsers()
    func goToEditUserInfo(user: UsersDataModel)
}

// MARK: - Employee Cell Protocol
protocol EmployeeCellView {
    func setUserName(name: String)
    func setUserEmail(email: String)
}

// MARK: - Employee Presenter
class EmployeePresenter {
    
    // Create delegate Variable
    private weak var delegate: EmployeeView?
    
    // Create object from UsersModel
    var cellItems: UsersModel?
    
    // Setup Delegate
    init(delegate: EmployeeView) {
        self.delegate = delegate
    }
    
    // Get Users Api Func
    func getUsersApi() {
        API.usersCodeNetwork(Url: URLs.users_Url) { error, success, data in
            if success {
                self.cellItems = data
                self.delegate?.reloadUsers()
            } else {
                self.delegate?.reloadUsers()
            }
        }
    }
    
    // Edit User Info Api Func
    func editUserInfo(index: Int) {
        guard let user = cellItems?.data[index] else {return}
        self.delegate?.goToEditUserInfo(user: user)
    }
    
    // Configure Cell
    func configureCell(cell: EmployeeCellView, for index: Int) {
        guard let Item = cellItems?.data[index] else {return}
        cell.setUserName(name: Item.name ?? "")
        cell.setUserEmail(email: Item.email ?? "")
    }
    
    // Get Count of Users
    func getItemsCount() -> Int {
        return cellItems?.data.count ?? 0
    }
    
}


