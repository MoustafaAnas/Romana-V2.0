import UIKit

extension AddEmployeeVC: UICollectionViewDelegate, UICollectionViewDataSource {
    
    // MARK: - Setting up Collection View
    func setupCollectionView(){
        chosenPermissionsCV.delegate = self
        chosenPermissionsCV.dataSource = self
    }
    // MARK: - No. of Cells in Section
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return chosenPermissionsArr.count
    }
    
    // MARK: - Cell Data Content
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! PermissionsCollectionView
        
        cell.permissionLbl.text = chosenPermissionsArr[indexPath.row]
        cell.deleteBtn.tag = indexPath.row
        cell.deleteBtn.addTarget(self, action: #selector(deleteBtnPressed), for: .touchUpInside)
        return cell
    }
    
    // MARK: - Delete Button in Cell Action
    @objc func deleteBtnPressed(sender: UIButton) {
        let indexpath = IndexPath(row: sender.tag, section: 0)
        
            self.chosenPermissionsCV.deleteItems(at: [indexpath])
            self.chosenPermissionsArr.remove(at: indexpath.row)
            self.chosenPermissionsCV.reloadData()
        
            self.hideCollectionView()
    }
    
    // MARK: - Cell Size
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: (collectionView.frame.width) * 0.29, height: collectionView.frame.height - 20)
    }
    
    // MARK: - Min Spacing For Section
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    // MARK: - Min Inter item Spacing
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.1
    }
    
    // MARK: - pacing From Edges For the Cell
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 1, left: 20, bottom: 1, right: 20)
    }
    
}
