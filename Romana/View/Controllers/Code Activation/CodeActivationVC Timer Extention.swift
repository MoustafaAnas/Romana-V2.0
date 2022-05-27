import UIKit

extension CodeActivationVC {
    
    // Start Timer Method
    func startTimer () {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(codeActivationTimer), userInfo: nil, repeats: true)
    }
    
    // Start Timer Method Action
    @objc func codeActivationTimer() {
        if seenTimer == 0 {
            seenTimer = 59
        }
        else {
            timerLbl.text = "00:\(seenTimer)"
            seenTimer -= 1
        }
    }
}
