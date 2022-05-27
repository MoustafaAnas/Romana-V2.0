import UIKit

extension EmployeesVC: UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - Setting up Table View
    func setupTableView(){
        employeesTV.delegate = self
        employeesTV.dataSource = self
    }
    
    // MARK: - No. Cells in Section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.getItemsCount()
    }
    
    // MARK: - Cell Height
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
    
    // MARK: - Cell Data Content
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! EmployeesTVCell
        
        presenter.configureCell(cell: cell, for: indexPath.row)
        
        cell.editBtn.tag = indexPath.row
        cell.editBtn.addTarget(self, action: #selector(cellEditBtnIsPressed), for: .touchUpInside)
        cell.recoredBtn.tag = indexPath.row
        cell.recoredBtn.addTarget(self, action: #selector(cellRecoredBtnIsPressed), for: .touchUpInside)
        
        let maskLayer = CAShapeLayer()
        let bounds = cell.bounds
        maskLayer.path = UIBezierPath(roundedRect: CGRect(x: 2, y: 2, width: bounds.width-4, height: bounds.height-10), cornerRadius: 5).cgPath
        cell.layer.mask = maskLayer
        
        return cell
    }
    
    // MARK: - Edit Button in Cell Action
    @objc func cellEditBtnIsPressed(sender: UIButton) {
        let indexpath = IndexPath(row: sender.tag, section: 0)
        presenter.editUserInfo(index: indexpath.row)
    }
    
    // MARK: - Recored Button in Cell Action
    @objc func cellRecoredBtnIsPressed(sender: UIButton) {
        let indexpath = IndexPath(row: sender.tag, section: 0)
        print("Recored \(indexpath.row)")
    }
}
