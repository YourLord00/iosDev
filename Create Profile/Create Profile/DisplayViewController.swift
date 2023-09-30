import UIKit

class DisplayViewController: UIViewController {

    //MARK: creating instance of DisplayView...
    let displayScreen = DisplayView()
    
    //MARK: patch the view of the controller to the DisplayView...
    override func loadView() {
        view = displayScreen
    }
    
    //MARK: message and mood from the first screen...
    var receivedPackage: ViewController.Package = ViewController.Package() // The first screen can set this variable...
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK: setting the Labels' texts...
        if let unwrappedMessageName = receivedPackage.name{
            if !unwrappedMessageName.isEmpty{
                displayScreen.textFieldName.text = "Your message: \(unwrappedMessageName)"
            }
        }
        
        if let unwrappedMessageEmail = receivedPackage.email{
            if !unwrappedMessageEmail.isEmpty{
                displayScreen.textFieldEmail.text = "Email: \(unwrappedMessageEmail)"
            }
        }
        
        
        if let unwrappedMessagePhoneNumber = receivedPackage.phoneNumber{
            if !unwrappedMessagePhoneNumber.isEmpty{
                if let unwrappedSelectedPhoneType = receivedPackage.selectedPhoneType{
                    displayScreen.textFieldPhone.text = "Phone: \(unwrappedMessagePhoneNumber) (\(unwrappedSelectedPhoneType))"
                    displayScreen.imageViewPhoneType.image = UIImage(named: unwrappedSelectedPhoneType.lowercased())
                }
            }
        }
        
        if let unwrappedMessageAddress = receivedPackage.address{
            if !unwrappedMessageAddress.isEmpty{
                displayScreen.textFieldAddress.text = "Address: \(unwrappedMessageAddress)"
            }
        }
        
        if let unwrappedMessageCityState = receivedPackage.cityState{
            if !unwrappedMessageCityState.isEmpty{
                displayScreen.textFieldCityState.text = "\(unwrappedMessageCityState)"
            }
        }
        
        if let unwrappedMessageZipCode = receivedPackage.zipCode{
            if !unwrappedMessageZipCode.isEmpty{
                displayScreen.textFieldZipCode.text = "Zip Code: \(unwrappedMessageZipCode)"
            }
        }
    }
}
