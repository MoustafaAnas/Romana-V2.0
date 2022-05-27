import UIKit

extension UITextField {
    func addRightIcon(icon: UIImage, tintColor: UIColor){
        
        let rightAddedIcon = UIImageView(frame: CGRect(x: -10.0, y: 0.0, width: icon.size.width, height: icon.size.height))
        rightAddedIcon.image = icon
        rightAddedIcon.tintColor = tintColor
        self.rightViewMode = .always
        let view = UIView(frame: CGRect(x: 0, y: 0, width: icon.size.width, height: icon.size.height))
        view.addSubview(rightAddedIcon)
        self.rightView = view
        
    }
    
    func addLeftIcon(icon: UIImage, tintColor: UIColor){
        
        let leftAddedIcon = UIImageView(frame: CGRect(x: 10.0, y: 0.0, width: icon.size.width, height: icon.size.height))
        leftAddedIcon.image = icon
        leftAddedIcon.tintColor = tintColor
        self.leftViewMode = .always
        let view = UIView(frame: CGRect(x: 0, y: 0, width: icon.size.width, height: icon.size.height))
        view.addSubview(leftAddedIcon)
        self.leftView = view
        
    }
}
