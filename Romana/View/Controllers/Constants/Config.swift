struct URLs {
    
    // Base URL
    static let base_Url = "https://beta.alqabedah.com/api/suppliers/"
    
    /// POST {phone, password}
    static let login_Url = base_Url + "auth/login"
    
    /// POST {phone}
    static let forgotPassword_Url = base_Url + "auth/forget-password"
    
    // POST {phone, code}
    static let codeActivation_Url = base_Url + "auth/forget-password/check"
    
    /// POST {phone, code, password}
    static let newPassword_Url = base_Url + "auth/forget-password/reset"
    
    /// POST {phone, landline, email, address, password, reginsteration photo, license photo}
    static let signup_Url = base_Url + "auth/register"
    
    /// GET {token}
    static let purchase_Url = base_Url + "purchase-invoices"
    
    /// GET {token}
    static let returnPurchase_Url = base_Url + "purchase-return-invoices"
    
    /// GET {token, x-company-id}
    static let chat_Url = base_Url + "chats"
    
    /// PUT {phone, landline, email, address, password, token}
    static let profile_Url = base_Url + "auth/profile"
    
    /// GET {token}
    static let products_Url = base_Url + "products"
    
    /// GET {token}
    static let offers_Url = base_Url + "invoices"
    
    /// GET {token}
    static let stock_Url = base_Url + "my-products"
    
    /// GET {token} -> Present
    /// DELETE {token} -> Delete
    /// POST {name, owner_name, iban, token} -> Add
    /// PUT {name, owner_name, iban, token} -> Update
    static let banks_Url = base_Url  + "banks"
    
    /// GET {token} -> Present
    /// PUT {name, email, phone, permissions[]} -> Update
    /// POST {name, email, phone, permissions[], password, token} -> Add
    static let users_Url = base_Url + "users"
    
    /// GET {token}
    static let permissions_Url = base_Url + "spinners"
}
