
extension AddEmployeeVC: AddEmployeeView {
    
    // MARK: - Setting up Presenter
    func setupPresenter() {
        presenter = AddEmployeePresenter(delegate: self)
    }
    
    // MARK: - Getting permissions Method
    func setPermissions(permissions: [String]) {
        userPermissionsDropDownMenu = permissions
    }
    
    // MARK: - Go back to EmployeesVC Method
    func goBackToAllUsers() {
        self.navigationController?.popViewController(animated: true)
    }
}
