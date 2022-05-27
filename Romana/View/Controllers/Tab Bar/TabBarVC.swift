import UIKit

class TabBarVC: UITabBarController, UITabBarControllerDelegate {
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.delegate = self
        
        setupMiddleButton()
    }
    
    // MARK: - Setting up Middle Button
    func setupMiddleButton() {
        let middleBtn = UIButton(frame: CGRect(x: (self.view.bounds.width / 2)-25, y: -20, width: 50, height: 50))
        middleBtn.setImage(UIImage(named: "plus"), for: .normal)
          //add to the tabbar and add click event
           self.tabBar.addSubview(middleBtn)
           middleBtn.addTarget(self, action: #selector(self.menuButtonAction), for: .touchUpInside)

           self.view.layoutIfNeeded()
       }

    // Menu Button Touch Action
       @objc func menuButtonAction(sender: UIButton) {
           selectedIndex = 2
       }

}

