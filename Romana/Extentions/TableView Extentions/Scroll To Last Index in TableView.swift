import UIKit

extension UITableView {
  func scrollToBottom() {

    let lastSectionIndex = self.numberOfSections - 1
    if lastSectionIndex < 0 { //if invalid section
        return
    }

    let lastRowIndex = self.numberOfRows(inSection: lastSectionIndex) - 1
    if lastRowIndex < 0 { //if invalid row
        return
    }

    let pathToLastRow = IndexPath(row: lastRowIndex, section: lastSectionIndex)
    self.scrollToRow(at: pathToLastRow, at: .bottom, animated: true)
  }
}
