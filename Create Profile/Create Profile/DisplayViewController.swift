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
        if let unwrappedMessage = receivedPackage.name{
            if !unwrappedMessage.isEmpty{
                displayScreen.textFieldName.text = "Your message: \(unwrappedMessage)"
            }
        }
        
        if let unwrappedMessage = receivedPackage.email{
            if !unwrappedMessage.isEmpty{
                displayScreen.textFieldName.text = "Your message: \(unwrappedMessage)"
            }
        }
        
        if let unwrappedMessage = receivedPackage.selectedPhoneType{
            if !unwrappedMessage.isEmpty{
                displayScreen.textFieldName.text = "Your message: \(unwrappedMessage)"
            }
        }
        
        if let unwrappedMessage = receivedPackage.phoneNumber{
            if !unwrappedMessage.isEmpty{
                displayScreen.textFieldName.text = "Your message: \(unwrappedMessage)"
            }
        }
        
        if let unwrappedMessage = receivedPackage.address{
            if !unwrappedMessage.isEmpty{
                displayScreen.textFieldName.text = "Your message: \(unwrappedMessage)"
            }
        }
        
        if let unwrappedMessage = receivedPackage.cityState{
            if !unwrappedMessage.isEmpty{
                displayScreen.textFieldName.text = "Your message: \(unwrappedMessage)"
            }
        }
        
        if let unwrappedMessage = receivedPackage.zipCode{
            if !unwrappedMessage.isEmpty{
                displayScreen.textFieldName.text = "Your message: \(unwrappedMessage)"
            }
        }
    }
}
