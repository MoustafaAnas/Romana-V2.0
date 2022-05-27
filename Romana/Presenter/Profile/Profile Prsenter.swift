import UIKit

// MARK: - Profile Protocol
protocol ProfileView: AnyObject {
    func goBackToEditProfile()
}

// MARK: - Profile Presenter
class ProfilePresnter {
    
    // Creating a Delegate Variable
    private weak var delegate: ProfileView?
    
    // Setup Delegate
    init(delegate: ProfileView) {
        self.delegate = delegate
    }
    
    // Edit Profile Info Api Func
    func updateProfileApi(phoneNumber: String, mobileNumber: String, address: String, email: String) {
        
        API.updateProfileCodeNetwork(Url: URLs.profile_Url, phoneNumber: phoneNumber, mobileNumber: mobileNumber, address: address, email: email ) { error, success, userInfo  in
            if success {
                let pref = UserDefaults.standard
                pref.set(userInfo.data.email, forKey: "email")
                pref.set(userInfo.data.phone, forKey: "phone")
                pref.set(userInfo.data.name, forKey: "name")
                pref.set(userInfo.data.address, forKey: "address")
                pref.set(userInfo.data.landline, forKey: "landline")
                print(userInfo.data.token as Any)
                pref.synchronize()
            }
        }
    }

}
