import UIKit

extension CollViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    // MARK: - no. of Cells in Section
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cellDataArr.count
    }
    
    // MARK: - Data in Cells
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if headrAddr.text == "Recent Requisitions" {
            let cell1 = collectionView.dequeueReusableCell(withReuseIdentifier: "cell1", for: indexPath) as! NewOrdersCell
            cell1.orderNumber.text = cellDataArr[indexPath.row].orderName
            cell1.orderDate.text = cellDataArr[indexPath.row].orderDate
            cell1.itemsNumber.text = cellDataArr[indexPath.row].itemsNumber
            print("section1")
            return cell1
         
        }
        else {
            let cell2 = collectionView.dequeueReusableCell(withReuseIdentifier: "cell2", for: indexPath) as! NewBillsCell
            cell2.orderNumber.text = cellDataArr[indexPath.row].orderName
            cell2.itemsNumber.text = cellDataArr[indexPath.row].itemsNumber
            cell2.orderDate.text = cellDataArr[indexPath.row].orderDate
            cell2.orderPrice.text = cellDataArr[indexPath.row].orderPrice
            
            print("section2")
            return cell2
        }
        
    }
    
    // MARK: - Cells Height
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
     
        if headrAddr.text == "Recent Requisitions" {
            return CGSize(width: collectionView.frame.width - 40, height: collectionView.frame.height - 30)
        }
        
        else {
            return CGSize(width: collectionView.frame.width * 0.29, height: collectionView.frame.height - 20)
        }
    }
    
    // MARK: - Min Spacing For Section
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 13
    }

    // MARK: - Min Inter item Spacing
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.1
    }
    
    // MARK: - Spacing From Edges For the Cell
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 1, left: 20, bottom: 1, right: 20)
    }

}
