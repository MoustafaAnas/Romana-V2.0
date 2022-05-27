import UIKit
import Alamofire
import FTIndicator

class API: NSObject {
   
    
    // MARK: - Login
    class func loginCodeNetwork(Url: String, phoneNumber: String, password: String, compleition: @escaping (_ error: Error?, _ success: Bool, _ data: UserDataClass) -> Void) {
        
        let params : [String: Any] =
        [
         "phone": phoneNumber,
         "password": password,
         "fcm_token_ios":"12312"
        ]
        
        FTIndicator.showProgress(withMessage: "Loading")
        
        Alamofire.request(Url, method: .post , parameters: params)
            .responseJSON { response in
                
                if response.result.isSuccess
                {
                    print(response)
                    
                    guard let data = response.data else {return}
                    parsingJSONFromAPIResponse(data: data)
                    
                }
                else
                {
                    print("Error \(response.result.error!)")
                    FTIndicator.showError(withMessage: "")
                 
                }
                    
            }
        
        func parsingJSONFromAPIResponse(data : Data)
        {
            do
            {
                let informationResponseBeforeParsing = try JSONDecoder().decode(UserData.self, from: data)
                print(informationResponseBeforeParsing)
                if informationResponseBeforeParsing.status == true
                {
                    compleition(nil, true, informationResponseBeforeParsing.data)
                    FTIndicator.showSuccess(withMessage: "Login Successfully")
                    
                }
                else{
                    FTIndicator.showError(withMessage: "")
                }
            }
                
            catch let jsonError{
                print("Catch Error: \(jsonError.localizedDescription)")
                FTIndicator.showError(withMessage: "")
            }
        }
    }
    
    // MARK: - Forgot Password
    class func forgotPasswordCodeNetwork(Url: String, phoneNumber: String, compleition: @escaping (_ error: Error?, _ success: Bool) -> Void) {
        
        let params : [String: Any] =
        [
         "phone": phoneNumber,
        ]
        
        FTIndicator.showProgress(withMessage: "Loading")
        
        Alamofire.request( Url , method: .post, parameters: params).responseJSON{
            response in
            if response.result.isSuccess
            {
                print("Success")
                print(response.data!)
                print(response)
                
                guard let data = response.data else {return}
                parsingJSONFromAPIResponse(data: data)
            }
            else
            {
                compleition(response.result.error, false)
                print("Error \(response.result.error!)")
                FTIndicator.showError(withMessage: "Wrong Phone Number")
            }
        }
        func parsingJSONFromAPIResponse(data : Data)
        {
            do
            {
                let informationResponseBeforeParsing = try JSONDecoder().decode(ForgotPassword.self, from: data)
                print(informationResponseBeforeParsing)
                if informationResponseBeforeParsing.status == true
                {
                    compleition(nil, true)
                    FTIndicator.dismissProgress()
    
                }
                else{
                    compleition(nil, false)
                    print("something wrong")
                    FTIndicator.showError(withMessage: "Wrong Phone Number")
                }
            }
                
            catch let jsonError{
                compleition(nil, false)
                FTIndicator.dismissProgress()
                print(jsonError.localizedDescription)
                
            }
        }
        
    }
    
    // MARK: - Activation Code
    class func codeActivationNetwork(Url: String, phoneNumber: String, code: String, compleition: @escaping (_ error: Error?, _ success: Bool) -> Void) {
        
        let params : [String: Any] =
        [
         "phone": phoneNumber,
         "code": code,
        ]
        
        FTIndicator.showProgress(withMessage: "Loading")
        
        Alamofire.request(Url, method: .post , parameters: params)
            .responseJSON { response in
                
                if response.result.isSuccess
                {
                    print(response)
                    
                    guard let data = response.data else {return}
                    parsingJSONFromAPIResponse(data: data)
                    
                }
                else
                {
                    print("Error \(response.result.error!)")
                    FTIndicator.showError(withMessage: "")
                 
                }
                    
            }
        
        func parsingJSONFromAPIResponse(data : Data)
        {
            do
            {
                let informationResponseBeforeParsing = try JSONDecoder().decode(CodeActivation.self, from: data)
                print(informationResponseBeforeParsing)
                if informationResponseBeforeParsing.status == true && informationResponseBeforeParsing.data == true
                {
                    compleition(nil, true)
                    FTIndicator.showSuccess(withMessage: "")
                }
                else{
                    compleition(nil, false)
                    print("something wrong")
                    FTIndicator.showError(withMessage: "Wrong Code")
                }
            }
                
            catch let jsonError{
                FTIndicator.dismissProgress()
                print(jsonError.localizedDescription)
                
                
            }
        }
    }
    
    // MARK: - Reset Password
    class func resetPasswordCodeNetwork(Url: String, phoneNumber: String, code: String, password: String, compleition: @escaping (_ error: Error?, _ success: Bool) -> Void) {
        
        let params : [String: Any] =
        [
         "phone": phoneNumber,
         "code": code,
         "password": password
        ]
        
        FTIndicator.showProgress(withMessage: "Loading")
        
        Alamofire.request(Url, method: .post , parameters: params)
            .responseJSON { response in
                
                if response.result.isSuccess
                {
                    print(response)
                    
                    guard let data = response.data else {return}
                    parsingJSONFromAPIResponse(data: data)
                    
                }
                else
                {
                    print("Error \(response.result.error!)")
                    FTIndicator.showError(withMessage: "")
                 
                }
                    
            }
        
        func parsingJSONFromAPIResponse(data : Data)
        {
            do
            {
                let informationResponseBeforeParsing = try JSONDecoder().decode(UserData.self, from: data)
                print(informationResponseBeforeParsing)
                if informationResponseBeforeParsing.status == true
                {
                    compleition(nil, true)
                    FTIndicator.showSuccess(withMessage: "Reset Password Successfully")
                }
                else{
                    print("something wrong")
                    FTIndicator.showError(withMessage: "")
                }
            }
                
            catch let jsonError{
                FTIndicator.dismissProgress()
                print(jsonError.localizedDescription)
            }
        }
    }
    
    // MARK: - Sign up Networking
    class func signupCodeNetwork(phoneNumber: String, password: String, CompanyName:String, ComericalNumber:String,email: String,commericalRegImg: UIImage, licenseImg: UIImage, compleition: @escaping (_ error: Error?, _ success: Bool) -> Void) {
        
        let params : [String: Any] =
        [
            "phone":phoneNumber,
            "password":password,
            "company_name":CompanyName,
            "commercial_number":ComericalNumber,
            "email":email
        ]
        
        Alamofire.upload(multipartFormData: { multipartFormData in
    
            multipartFormData.append(commericalRegImg.jpegData(compressionQuality: 0.1)!, withName: "commercial_image",fileName: "\(Date().timeIntervalSince1970).jpg", mimeType: "image/jpg")
            multipartFormData.append(licenseImg.jpegData(compressionQuality: 0.1)!, withName: "licence_image",fileName: "\(Date().timeIntervalSince1970).jpg", mimeType: "image/jpg")
            
                for (key, value) in params {
                    multipartFormData.append((value as AnyObject).data(using: String.Encoding.utf8.rawValue)!, withName: key)
                    }
            },
                         to:URLs.signup_Url,
    encodingCompletion: { encodingResult in
         switch encodingResult {
         case .success(let upload, _, _):
             upload.responseJSON { response in
                 debugPrint(response)
                 
                 if response.result.isSuccess
                 {
                     print(response)
                     
                     guard let data = response.data else {return}
                     parsingJSONFromAPIResponse(data: data) { error, success in
                         if success {
                             compleition(nil, true)
                         }
                     }
                                                                              
                                                                               
                     
                 }
                 else
                 {
                     print("Error \(response.result.error!)")
                     FTIndicator.showError(withMessage: "")
                  
                 }
             }
//             upload.uploadProgress(queue: DispatchQueue(label: "uploadQueue"), closure: { (progress) in
//
//
//             })

         case .failure(let encodingError):
             print(encodingError)
         }
 }
 )
        func parsingJSONFromAPIResponse(data : Data, compleition: @escaping (_ error: Error?, _ success: Bool) -> Void)
        {
            do
            {
                let informationResponseBeforeParsing = try JSONDecoder().decode(UserData.self, from: data)
                print(informationResponseBeforeParsing)
                if informationResponseBeforeParsing.status == true
                {
                    //compleition(nil, true, informationResponseBeforeParsing.data)
                    FTIndicator.showSuccess(withMessage: "Signup Successfully")
                    compleition(nil, true)
                    
                }
                else{
                    FTIndicator.showError(withMessage: "")
                }
            }
                
            catch let jsonError{
                print("Catch Error: \(jsonError.localizedDescription)")
                FTIndicator.showError(withMessage: "")
            }
        }
}
    // MARK: - Purchase - Return Purchase
    class func purchaseCodeNetwork(Url: String, compleition: @escaping (_ error: Error?, _ success: Bool, _ data: BillsData) -> Void)
    {
        guard let token = Helper.getApiToken() else{return }
        print("TOKEN:\(token)")
        
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(token)",
            "Accept": "application/json"
        ]
        
        Alamofire.request(Url , method: .get, headers: headers).responseJSON{
            response in
            if response.result.isSuccess
            {
                print("Success")
                print(response.data!)
                print(response)
                
                guard let data = response.data else {return}
                parsingJSONFromAPIResponse(data: data)
            }
            else
            {
                print("Error \(response.result.error!)")
            }
        }
        func parsingJSONFromAPIResponse(data : Data)
        {
            do
            {
                let informationResponseBeforeParsing = try JSONDecoder().decode(BillsData.self, from: data)
                print(informationResponseBeforeParsing)
                if informationResponseBeforeParsing.status == true
                {
                    compleition(nil, true, informationResponseBeforeParsing)
                }
                else{
                    print("something wrong")
                }
            }
                
            catch let jsonError{
                print(jsonError.localizedDescription)
                
                
            }
        }
        
        
    }
    
    // MARK: - Get Banks
    class func getBanksCodeNetwork(Url: String, compleition: @escaping (_ error: Error?, _ success: Bool,_ data: BanksModel) -> Void)
    {
        FTIndicator.showProgress(withMessage: "")
        
        guard let token = Helper.getApiToken() else{return }
        print("TOKEN:\(token)")
        
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(token)",
            "Accept": "application/json"
        ]
        
        Alamofire.request( Url , method: .get, headers: headers ).responseJSON{
            response in
            if response.result.isSuccess
            {
                print("Success")
                print(response.data!)
                print(response)
                
                guard let data = response.data else {return}
                parsingJSONFromAPIResponse(data: data)
            }
            else
            {
                print("Error \(response.result.error!)")
                FTIndicator.showError(withMessage: "")
            }
        }
        func parsingJSONFromAPIResponse(data : Data)
        {
            do
            {
                let informationResponseBeforeParsing = try JSONDecoder().decode(BanksModel.self, from: data)
                print(informationResponseBeforeParsing)
                if informationResponseBeforeParsing.status == true
                {
                    compleition(nil, true, informationResponseBeforeParsing)
                    FTIndicator.dismissProgress()
                }
                else{
                    print("something wrong")
                    FTIndicator.showError(withMessage: "")
                }
            }
                
            catch let jsonError{
                print(jsonError.localizedDescription)
                FTIndicator.showError(withMessage: "")
            }
        }
        
        
    }
    
    // MARK: - Delete Bank Account
    class func deleteBankCodeNetwork(id: Int, compleition: @escaping (_ error: Error?, _ success: Bool) -> Void)
    {
        FTIndicator.showProgress(withMessage: "")
        guard let token = Helper.getApiToken() else{return }
        print("TOKEN:\(token)")
        
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(token)",
            "Accept": "application/json"
        ]
        
        Alamofire.request( "\(URLs.banks_Url)/\(id)" ,method: .delete, headers: headers ).responseJSON{
            response in
            if response.result.isSuccess
            {
                print("Success")
                print(response.data!)
                print(response)
                
                guard let data = response.data else {return}
                parsingJSONFromAPIResponse(data: data)
            }
            else
            {
                print("Error \(response.result.error!)")
                FTIndicator.showError(withMessage: "")
            }
        }
        func parsingJSONFromAPIResponse(data : Data)
        {
            do
            {
                let informationResponseBeforeParsing = try JSONDecoder().decode(DeleteBanksModel.self, from: data)
                print(informationResponseBeforeParsing)
                if informationResponseBeforeParsing.status == true
                {
                    compleition(nil, true)
                    FTIndicator.dismissProgress()
                }
                else{
                    compleition(nil, false)
                    print("something wrong")
                    FTIndicator.showError(withMessage: "")
                }
            }
                
            catch let jsonError{
                print(jsonError.localizedDescription)
                FTIndicator.showError(withMessage: "")
            }
        }
        
        
    }
    
    // MARK: - Add Bank Account
    class func addBankCodeNetwork(bankName:String, accountOwnerName: String, iban: String, compleition: @escaping (_ error: Error?, _ success: Bool) -> Void)
    {
        guard let token = Helper.getApiToken() else{return }
        print("TOKEN:\(token)")
        
        let params : [String: Any] =
        ["name": bankName,
         "owner_name": accountOwnerName,
         "iban": iban
        ]
        
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(token)",
            "Accept": "application/json"
        ]
        
        Alamofire.request( URLs.banks_Url , method: .post, parameters: params, headers: headers ).responseJSON{
            response in
            if response.result.isSuccess
            {
                print("Success")
                print(response.data!)
                print(response)
                
                guard let data = response.data else {return}
                parsingJSONFromAPIResponse(data: data)
            }
            else
            {
                compleition(nil, false)
                print("Error \(response.result.error!)")
                FTIndicator.showError(withMessage: "")
            }
        }
        func parsingJSONFromAPIResponse(data : Data)
        {
            do
            {
                let informationResponseBeforeParsing = try JSONDecoder().decode(AddBanksModel.self, from: data)
                print(informationResponseBeforeParsing)
                if informationResponseBeforeParsing.status == true
                {
                    compleition(nil, true)
                    FTIndicator.showSuccess(withMessage: "Added Successfuly")
                }
                else{
                    compleition(nil, false)
                    print("something wrong")
                    FTIndicator.showError(withMessage: "\(informationResponseBeforeParsing.msg ?? "")")
                }
            }
                
            catch let jsonError{
                compleition(nil, false)
                FTIndicator.dismissProgress()
                print(jsonError.localizedDescription)
                
                
            }
        }
        
        
    }
    
    // MARK: - Update Bank Account
    class func updateBankCodeNetwork(accountID: Int, bankName:String, accountOwnerName: String, iban: String, compleition: @escaping (_ error: Error?, _ success: Bool) -> Void)
    {
        guard let token = Helper.getApiToken() else{return }
        print("TOKEN:\(token)")
        
        let params : [String: Any] =
        ["name": bankName,
         "owner_name": accountOwnerName,
         "iban": iban
        ]
        
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(token)",
            "Accept": "application/json"
        ]
        
        Alamofire.request( "\(URLs.banks_Url)/\(accountID)" , method: .put, parameters: params, headers: headers ).responseJSON{
            response in
            if response.result.isSuccess
            {
                print("Success")
                print(response.data!)
                print(response)
                
                guard let data = response.data else {return}
                parsingJSONFromAPIResponse(data: data)
            }
            else
            {
                compleition(nil, false)
                print("Error \(response.result.error!)")
                FTIndicator.showError(withMessage: "")
            }
        }
        func parsingJSONFromAPIResponse(data : Data)
        {
            do
            {
                let informationResponseBeforeParsing = try JSONDecoder().decode(AddBanksModel.self, from: data)
                print(informationResponseBeforeParsing)
                if informationResponseBeforeParsing.status == true
                {
                    compleition(nil, true)
                    FTIndicator.showSuccess(withMessage: "Updated Successfuly")
                }
                else{
                    compleition(nil, false)
                    print("something wrong")
                    FTIndicator.showError(withMessage: "")
                }
            }
                
            catch let jsonError{
                compleition(nil, false)
                FTIndicator.dismissProgress()
                print(jsonError.localizedDescription)
            }
        }
        
        
    }
    
    // MARK: - Update Profile Info
    class func updateProfileCodeNetwork(Url: String, phoneNumber: String, mobileNumber: String, address: String, email: String, compleition: @escaping (_ error: Error?, _ success: Bool,_ data: UserData) -> Void)
    {
        FTIndicator.showProgress(withMessage: "")
        guard let token = Helper.getApiToken() else{return }
        print("TOKEN:\(token)")
        
        guard let companyID = UserDefaults.standard.object(forKey: "id") else {return}
        print("companyID:\(companyID)")
        
        let params : [String: Any] =
        [
            "phone":phoneNumber,
            "landline":mobileNumber,
            "address":address,
            "email":email
        ]
        
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(token)",
            "X-company-id": "\(companyID)",
            "Accept": "application/json"
        ]
        
        Alamofire.request(Url, method: .put, parameters: params, headers: headers ).responseJSON{
            response in
            if response.result.isSuccess
            {
                print("Success")
                print(response.data!)
                print(response)
                
                guard let data = response.data else {return}
                parsingJSONFromAPIResponse(data: data)
            }
            else
            {
                print("Error \(response.result.error!)")
                FTIndicator.showError(withMessage: "")
            }
        }
        func parsingJSONFromAPIResponse(data : Data)
        {
            do
            {
                let informationResponseBeforeParsing = try JSONDecoder().decode(UserData.self, from: data)
                print(informationResponseBeforeParsing)
                if informationResponseBeforeParsing.status == true
                {
                    compleition(nil, true, informationResponseBeforeParsing)
                    FTIndicator.showSuccess(withMessage: "Updated Successfuly")
                    
                }
                else{
                    print("something wrong")
                    FTIndicator.showError(withMessage: "")
                }
            }
                
            catch let jsonError{
                FTIndicator.dismissProgress()
                print(jsonError.localizedDescription)
                
                
            }
        }
        
        
    }
    
    // MARK: - Update User Password
    class func updateUserPasswordCodeNetwork(Url: String, password: String, compleition: @escaping (_ error: Error?, _ success: Bool,_ data: UserData) -> Void)
    {
        FTIndicator.showProgress(withMessage: "")
        guard let token = Helper.getApiToken() else{return }
        print("TOKEN:\(token)")
        
        guard let companyID = UserDefaults.standard.object(forKey: "id") else {return}
        print("companyID:\(companyID)")
        
        let params : [String: Any] =
        [
            "password": password

        ]
        
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(token)",
            "X-company-id": "\(companyID)",
            "Accept": "application/json"
        ]
        
        Alamofire.request(Url, method: .put, parameters: params, headers: headers ).responseJSON{
            response in
            if response.result.isSuccess
            {
                print("Success")
                print(response.data!)
                print(response)
                
                guard let data = response.data else {return}
                parsingJSONFromAPIResponse(data: data)
            }
            else
            {
                print("Error \(response.result.error!)")
                FTIndicator.showError(withMessage: "")
            }
        }
        func parsingJSONFromAPIResponse(data : Data)
        {
            do
            {
                let informationResponseBeforeParsing = try JSONDecoder().decode(UserData.self, from: data)
                print(informationResponseBeforeParsing)
                if informationResponseBeforeParsing.status == true
                {
                    compleition(nil, true, informationResponseBeforeParsing)
                    FTIndicator.showSuccess(withMessage: "Updated Successfuly")
                    
                }
                else{
                    print("something wrong")
                    FTIndicator.showError(withMessage: "")
                }
            }
                
            catch let jsonError{
                FTIndicator.dismissProgress()
                print(jsonError.localizedDescription)
                
                
            }
        }
        
        
    }
    // MARK: - Products
    class func productsCodeNetwork(Url: String, compleition: @escaping (_ error: Error?, _ success: Bool,_ data: ProductsModel) -> Void)
    {
        FTIndicator.showProgress(withMessage: "")
        guard let token = Helper.getApiToken() else{return }
        print("TOKEN:\(token)")
        
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(token)",
            "Accept": "application/json"
        ]
        
        Alamofire.request( Url , method: .get, headers: headers ).responseJSON{
            response in
            if response.result.isSuccess
            {
                print("Success")
                print(response.data!)
                print(response)
                
                guard let data = response.data else {return}
                parsingJSONFromAPIResponse(data: data)
            }
            else
            {
                print("Error \(response.result.error!)")
                FTIndicator.showError(withMessage: "")
            }
        }
        func parsingJSONFromAPIResponse(data : Data)
        {
            do
            {
                let informationResponseBeforeParsing = try JSONDecoder().decode(ProductsModel.self, from: data)
                print(informationResponseBeforeParsing)
                if informationResponseBeforeParsing.status == true
                {
                    compleition(nil, true, informationResponseBeforeParsing)
                    FTIndicator.dismissProgress()
                }
                else{
                    compleition(nil, false, informationResponseBeforeParsing)
                    print("something wrong")
                    FTIndicator.showError(withMessage: "")
                    
                }
            }
                
            catch let jsonError{
                print(jsonError.localizedDescription)
                FTIndicator.showError(withMessage: "")
            }
        }
        
    }
    
    // MARK: - Delete Product Item
    class func deleteProductCodeNetwork(id: Int, compleition: @escaping (_ error: Error?, _ success: Bool) -> Void)
    {
        FTIndicator.showProgress(withMessage: "")
        guard let token = Helper.getApiToken() else{return }
        print("TOKEN:\(token)")
        
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(token)",
            "Accept": "application/json"
        ]
        
        Alamofire.request( "\(URLs.products_Url)/\(id)" ,method: .delete, headers: headers ).responseJSON{
            response in
            if response.result.isSuccess
            {
                print("Success")
                print(response.data!)
                print(response)
                
                guard let data = response.data else {return}
                parsingJSONFromAPIResponse(data: data)
            }
            else
            {
                print("Error \(response.result.error!)")
                FTIndicator.showError(withMessage: "")
            }
        }
        func parsingJSONFromAPIResponse(data : Data)
        {
            do
            {
                let informationResponseBeforeParsing = try JSONDecoder().decode(DeleteProductModel.self, from: data)
                print(informationResponseBeforeParsing)
                if informationResponseBeforeParsing.status == true
                {
                    compleition(nil, true)
                    FTIndicator.dismissProgress()
                }
                else{
                    compleition(nil, false)
                    print("something wrong")
                    FTIndicator.showError(withMessage: "")
                }
            }
                
            catch let jsonError{
                print(jsonError.localizedDescription)
                FTIndicator.showError(withMessage: "")
            }
        }
        
        
    }
    // MARK: - Offers
    class func offersCodeNetwork(Url: String, compleition: @escaping (_ error: Error?, _ success: Bool,_ data: OffersModel) -> Void)
    {
        FTIndicator.showProgress(withMessage: "")
        guard let token = Helper.getApiToken() else{return }
        print("TOKEN:\(token)")
        
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(token)",
            "Accept": "application/json"
        ]
        
        Alamofire.request( Url , method: .get, headers: headers ).responseJSON{
            response in
            if response.result.isSuccess
            {
                print("Success")
                print(response.data!)
                print(response)
                
                guard let data = response.data else {return}
                parsingJSONFromAPIResponse(data: data)
            }
            else
            {
                print("Error \(response.result.error!)")
                FTIndicator.showError(withMessage: "")
            }
        }
        func parsingJSONFromAPIResponse(data : Data)
        {
            do
            {
                let informationResponseBeforeParsing = try JSONDecoder().decode(OffersModel.self, from: data)
                print(informationResponseBeforeParsing)
                if informationResponseBeforeParsing.status == true
                {
                    compleition(nil, true, informationResponseBeforeParsing)
                    FTIndicator.dismissProgress()
                }
                else{
                    compleition(nil, false, informationResponseBeforeParsing)
                    print("something wrong")
                    FTIndicator.showError(withMessage: "")
                    
                }
            }
                
            catch let jsonError{
                print(jsonError.localizedDescription)
                FTIndicator.showError(withMessage: "")
            }
        }
        
    }
    
    // MARK: - Stock
    class func stockCodeNetwork(Url: String, compleition: @escaping (_ error: Error?, _ success: Bool,_ data: StockModel) -> Void)
    {
        FTIndicator.showProgress(withMessage: "")
        
        guard let token = Helper.getApiToken() else{return }
        print("TOKEN:\(token)")
        
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(token)",
            "Accept": "application/json"
        ]
        
        Alamofire.request( Url , method: .get, headers: headers ).responseJSON{
            response in
            if response.result.isSuccess
            {
                print("Success")
                print(response.data!)
                print(response)
                
                guard let data = response.data else {return}
                parsingJSONFromAPIResponse(data: data)
            }
            else
            {
                print("Error \(response.result.error!)")
                FTIndicator.showError(withMessage: "")
                
            }
        }
        func parsingJSONFromAPIResponse(data : Data)
        {
            do
            {
                let informationResponseBeforeParsing = try JSONDecoder().decode(StockModel.self, from: data)
                print(informationResponseBeforeParsing)
                if informationResponseBeforeParsing.status == true
                {
                    compleition(nil, true, informationResponseBeforeParsing)
                    FTIndicator.dismissProgress()
                }
                else{
                    compleition(nil, false, informationResponseBeforeParsing)
                    print("something wrong")
                    FTIndicator.showError(withMessage: "")
                }
            }
                
            catch let jsonError{
                print(jsonError.localizedDescription)
                FTIndicator.showError(withMessage: "")
                
                
            }
        }
        
        
    }
    
    // MARK: - Get Chat Messages
    class func chatCodeNetwork(Url: String, compleition: @escaping (_ error: Error?, _ success: Bool,_ data: ChatModel) -> Void)
    {
        FTIndicator.showProgress(withMessage: "")
        guard let token = Helper.getApiToken() else{return }
        print("TOKEN:\(token)")
        
        
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(token)",
            "X-company-id": "20",
            "Accept": "application/json"
        ]
        
        Alamofire.request( Url , method: .get, headers: headers ).responseJSON{
            response in
            if response.result.isSuccess
            {
                print("Success")
                print(response.data!)
                print(response)
                
                guard let data = response.data else {return}
                parsingJSONFromAPIResponse(data: data)
            }
            else
            {
                print("Error \(response.result.error!)")
                FTIndicator.showError(withMessage: "")
            }
        }
        func parsingJSONFromAPIResponse(data : Data)
        {
            do
            {
                let informationResponseBeforeParsing = try JSONDecoder().decode(ChatModel.self, from: data)
                print(informationResponseBeforeParsing)
                if informationResponseBeforeParsing.status == true
                {
                    compleition(nil, true, informationResponseBeforeParsing)
                    FTIndicator.dismissProgress()
                }
                else{
                    compleition(nil, false, informationResponseBeforeParsing)
                    print("something wrong")
                    FTIndicator.showError(withMessage: "")
                    
                }
            }
                
            catch let jsonError{
                print(jsonError.localizedDescription)
                FTIndicator.showError(withMessage: "")
            }
        }
        
    }
    
    // MARK: - Send Chat Message
    class func sendMsgCodeNetwork(Url: String, msg: String, compleition: @escaping (_ error: Error?, _ success: Bool) -> Void)
    {
        guard let token = Helper.getApiToken() else{return }
        print("TOKEN:\(token)")
        
        let params : [String: Any] =
        [
            "_method":"PUT",
            "message": msg
//            "type": "",
//            "attachment": "",
//            "thumbnail": ""
        ]
        
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(token)",
            "Accept": "application/json"
        ]
        
        Alamofire.request( Url , method: .post, parameters: params, headers: headers ).responseJSON{
            response in
            if response.result.isSuccess
            {
                print("Success")
                print(response.data!)
                print(response)
                
                guard let data = response.data else {return}
                parsingJSONFromAPIResponse(data: data)
            }
            else
            {
                print("Error \(response.result.error!)")
                FTIndicator.showError(withMessage: "")
            }
        }
        func parsingJSONFromAPIResponse(data : Data)
        {
            do
            {
                let informationResponseBeforeParsing = try JSONDecoder().decode(SendMsgModel.self, from: data)
                print(informationResponseBeforeParsing)
                if informationResponseBeforeParsing.status == true
                {
                    compleition(nil, true)
                }
                else{
                    compleition(nil, false)
                    print("something wrong")
                    FTIndicator.showError(withMessage: "")
                    
                }
            }
                
            catch let jsonError{
                print(jsonError.localizedDescription)
                FTIndicator.showError(withMessage: "")
            }
        }
        
    }
    
    // MARK: - Get Users
    class func usersCodeNetwork(Url: String, compleition: @escaping (_ error: Error?, _ success: Bool, _ data: UsersModel) -> Void)
    {
        FTIndicator.showProgress(withMessage: "")
        
        guard let token = Helper.getApiToken() else{return }
        print("TOKEN:\(token)")
        
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(token)",
            "Accept": "application/json"
        ]
        
        Alamofire.request( Url , method: .get, headers: headers ).responseJSON{
            response in
            if response.result.isSuccess
            {
                print("Success")
                print(response.data!)
                print(response)
                
                guard let data = response.data else {return}
                parsingJSONFromAPIResponse(data: data)
            }
            else
            {
                print("Error \(response.result.error!)")
                FTIndicator.showError(withMessage: "")
            }
        }
        func parsingJSONFromAPIResponse(data : Data)
        {
            do
            {
                let informationResponseBeforeParsing = try JSONDecoder().decode(UsersModel.self, from: data)
                print(informationResponseBeforeParsing)
                if informationResponseBeforeParsing.status == true
                {
                    
                    compleition(nil, true, informationResponseBeforeParsing)
                    FTIndicator.dismissProgress()

                }
                else{
                    compleition(nil, false, informationResponseBeforeParsing)
                    print("something wrong")
                    FTIndicator.showError(withMessage: "")
                }
            }
                
            catch let jsonError{
                print(jsonError.localizedDescription)
                FTIndicator.showError(withMessage: "")
            }
        }
        
        
    }
    
    // MARK: - Update User Info
    class func updateUserCodeNetwork(ID: Int, name: String, phone: String, email: String, permissions: [String], compleition: @escaping (_ error: Error?, _ success: Bool) -> Void)
    {
        guard let token = Helper.getApiToken() else{return }
        print("TOKEN:\(token)")
        
        let params : [String: Any] =
        [
        "name":name,
        "phone":phone,
        "email":email,
        "permissions[]": permissions
        ]
        
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(token)",
            "Accept": "application/json"
        ]
        
        Alamofire.request( "\(URLs.users_Url)/\(ID)" , method: .put, parameters: params, headers: headers ).responseJSON{
            response in
            if response.result.isSuccess
            {
                print("Success")
                print(response.data!)
                print(response)
                
                guard let data = response.data else {return}
                parsingJSONFromAPIResponse(data: data)
            }
            else
            {
                compleition(nil, false)
                print("Error \(response.result.error!)")
                FTIndicator.showError(withMessage: "")
            }
        }
        func parsingJSONFromAPIResponse(data : Data)
        {
            do
            {
                let informationResponseBeforeParsing = try JSONDecoder().decode(UpdateUserModel.self, from: data)
                print(informationResponseBeforeParsing)
                if informationResponseBeforeParsing.status == true
                {
                    compleition(nil, true)
                    FTIndicator.showSuccess(withMessage: "Updated Successfuly")
                }
                else{
                    compleition(nil, false)
                    print("something wrong")
                    FTIndicator.showError(withMessage: "")
                }
            }
                
            catch let jsonError{
                compleition(nil, false)
                FTIndicator.dismissProgress()
                print(jsonError.localizedDescription)
                
                
            }
        }
        
        
    }
    
    // MARK: - Add User Account
    class func addUserCodeNetwork(Url: String, name: String, phone: String, email: String, permissions: [String], password: String, compleition: @escaping (_ error: Error?, _ success: Bool) -> Void)
    {
        guard let token = Helper.getApiToken() else{return }
        print("TOKEN:\(token)")
        
        let params : [String: Any] =
        [
        "name":name,
        "phone":phone,
        "email":email,
        "permissions[]": permissions,
        "password":password
        ]
        
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(token)",
            "Accept": "application/json"
        ]
        
        FTIndicator.showProgress(withMessage: "")
        
        Alamofire.request( Url , method: .post, parameters: params, headers: headers ).responseJSON{
            response in
            if response.result.isSuccess
            {
                print("Success")
                print(response.data!)
                print(response)
                
                guard let data = response.data else {return}
                parsingJSONFromAPIResponse(data: data)
            }
            else
            {
                compleition(nil, false)
                print("Error \(response.result.error!)")
                FTIndicator.showError(withMessage: "")
            }
        }
        func parsingJSONFromAPIResponse(data : Data)
        {
            do
            {
                let informationResponseBeforeParsing = try JSONDecoder().decode(AddUserModel.self, from: data)
                print(informationResponseBeforeParsing)
                if informationResponseBeforeParsing.status == true
                {
                    compleition(nil, true)
                    FTIndicator.showSuccess(withMessage: "Added Successfuly")
                }
                else{
                    compleition(nil, false)
                    print("something wrong")
                    FTIndicator.showError(withMessage: "\(informationResponseBeforeParsing.msg ?? "")")
                }
            }
                
            catch let jsonError{
                compleition(nil, false)
                FTIndicator.dismissProgress()
                print(jsonError.localizedDescription)
                
                
            }
        }
        
        
    }
    
    // MARK: - Permissions
    class func getPermissionsCodeNetwork(Url: String, compleition: @escaping (_ error: Error?, _ success: Bool, _ data: [String]) -> Void)
    {
        FTIndicator.showProgress(withMessage: "")
        
        guard let token = Helper.getApiToken() else{return }
        print("TOKEN:\(token)")
        
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(token)",
            "Accept": "application/json"
        ]
        
        Alamofire.request( Url , method: .get, headers: headers ).responseJSON{
            response in
            if response.result.isSuccess
            {
                print("Success")
                print(response.data!)
                print(response)
                
                guard let data = response.data else {return}
                parsingJSONFromAPIResponse(data: data)
            }
            else
            {
                print("Error \(response.result.error!)")
                FTIndicator.dismissProgress()
            }
        }
        func parsingJSONFromAPIResponse(data : Data)
        {
            do
            {
                let informationResponseBeforeParsing = try JSONDecoder().decode(PermissionsModel.self, from: data)
                print(informationResponseBeforeParsing)
                if informationResponseBeforeParsing.status == true
                {
                    compleition(nil, true, informationResponseBeforeParsing.data.permissions)
                    FTIndicator.dismissProgress()
                }
                else{
                    print("something wrong")
                    FTIndicator.dismissProgress()
                }
            }
                
            catch let jsonError{
                print(jsonError.localizedDescription)
                FTIndicator.dismissProgress()
            }
        }
    }
    
}
