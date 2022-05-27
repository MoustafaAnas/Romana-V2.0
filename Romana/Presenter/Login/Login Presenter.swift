import UIKit

class LoginPresenter {
    
    // MARK: - Login Api Func
    func loginApi(phoneNumber: String, Password: String) {
        API.loginCodeNetwork(Url: URLs.login_Url, phoneNumber: phoneNumber, password: Password) { error, success, userInfo  in
            if success {
                let pref = UserDefaults.standard
                pref.set(userInfo.token, forKey: "token")
                pref.set(userInfo.id, forKey: "id")
                pref.set(userInfo.companyName, forKey: "companyName")
                pref.set(userInfo.commercialNumber, forKey: "commercialNumber")
                pref.set(userInfo.email, forKey: "email")
                pref.set(userInfo.image, forKey: "image")
                pref.set(userInfo.licenceImage, forKey: "licenceImage")
                pref.set(userInfo.commercialImage, forKey: "commercialImage")
                pref.set(userInfo.phone, forKey: "phone")
                pref.set(userInfo.name, forKey: "name")
                pref.set(userInfo.address, forKey: "address")
                pref.set(userInfo.landline, forKey: "landline")
                print(userInfo.token as Any)
                pref.synchronize()
                Helper.restartApp()

            }
        }
    }
}
