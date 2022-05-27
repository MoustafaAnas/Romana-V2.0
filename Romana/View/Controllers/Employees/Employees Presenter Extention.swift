extension EmployeesVC: EmployeeView {
    
    // MARK: - Setting up Presenter
    func setupPresenter() {
        presenter = EmployeePresenter(delegate: self)
    }
   
    // MARK: - Reload Employee TableView Action
    func reloadUsers() {
        self.employeesTV.reloadData()
        self.noDataToDisplayMsg(tableview: self.employeesTV, tableViewDataArrCount: presenter.getItemsCount())
    }
    
    // MARK: - Edit User Info Method
    func goToEditUserInfo(user: UsersDataModel) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "AddEmployeeVC") as! AddEmployeeVC
        self.navigationController?.pushViewController(vc, animated: true)
        vc.titleVC = "Edit Employee Info"
        vc.titleBtn = "Edit"
        
        vc.userItem = user
    }
}
