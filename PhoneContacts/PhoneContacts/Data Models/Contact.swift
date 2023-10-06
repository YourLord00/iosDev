//
//  Expense.swift


import Foundation

struct Contact{
    var name:String?
    var email:String?
    var selectedPhoneType:String?
    var phoneNumber:String?
    var address:String?
    var cityState:String?
    var zipCode:String?

    init(name: String? = nil, email: String? = nil, selectedPhoneType: String? = nil, phoneNumber: String? = nil, address: String? = nil, cityState: String? = nil, zipCode: String? = nil) {
        self.name = name
        self.email = email
        self.selectedPhoneType = selectedPhoneType
        self.phoneNumber = phoneNumber
        self.address = address
        self.cityState = cityState
        self.zipCode = zipCode
    }
    
}
