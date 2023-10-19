//
//  Expense.swift


import Foundation
import UIKit

struct Contact{
    var name:String?
    var email:String?
    var selectedPhoneType:String?
    var phoneNumber:String?
    var address:String?
    var cityState:String?
    var zipCode:String?
    var image:UIImage?

    init(name: String? = nil, email: String? = nil, selectedPhoneType: String? = nil, phoneNumber: String? = nil, address: String? = nil, cityState: String? = nil, zipCode: String? = nil, image:UIImage?) {
        self.name = name
        self.email = email
        self.selectedPhoneType = selectedPhoneType
        self.phoneNumber = phoneNumber
        self.address = address
        self.cityState = cityState
        self.zipCode = zipCode
        self.image = image
    }
    
}
