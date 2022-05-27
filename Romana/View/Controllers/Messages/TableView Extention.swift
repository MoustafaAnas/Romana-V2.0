import UIKit

extension MessagesVC:  UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - Setting up Table View
    func setupTableView() {
        msgsTableView.delegate = self
        msgsTableView.dataSource = self
    }
    
    // MARK: - No. Of Cells in Section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.getItemsCount()
    }
    
    // MARK: - Cells Data Content
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellUserID = presenter.getUserID(index: indexPath.row)
                          
        if cellUserID == UserDefaults.standard.object(forKey: "id") as? Int {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath) as! CurrentUselMsgCell
            presenter.configureCell(cell: cell, for: indexPath.row)
            
        return cell
            } else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath) as! OtherUserMsgCell
                presenter.configureCell(cell: cell, for: indexPath.row)

                    return cell
                }
        }
    
    // MARK: - Configure Cells Height
    func configureTableView() {
        msgsTableView.rowHeight = UITableView.automaticDimension
        msgsTableView.estimatedRowHeight = 120.0
        
    }
    
    // MARK: - Cells will Display when reach to last indexPath
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//        guard let item = cellItems else { return }
//        if indexPath.row == item.data.items.count - 3 {
//            if let nextURL = item.data.paginate?.nextPageURL, !nextURL.isEmpty{
//                self.getMessages(Url: nextURL)
//            }
//        }
    }
}
