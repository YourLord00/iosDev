import UIKit

class DisplayViewController: UIViewController {
    
    weak var mainDelegate: ViewController?

    //MARK: creating instance of DisplayView...
    let displayScreen = DisplayView()
    
    
    // Index for updating the contact in the list after editing
    var contactIndex: Int?
    
    //MARK: patch the view of the controller to the DisplayView...
    override func loadView() {
        view = displayScreen
    }
    
    //MARK: Contact from the main screen...
    var receivedContact: Contact?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Add 'Edit' button to navigation bar
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(editContact))
        
        // Populate fields with receivedContact's data
        populateFields()
    }
    
    private func populateFields() {
        if let unwrappedMessageName = receivedContact?.name {
            displayScreen.textFieldName.text = "\(unwrappedMessageName)"
        }
        if let unwrappedMessageEmail = receivedContact?.email {
            displayScreen.textFieldEmail.text = "Email: \(unwrappedMessageEmail)"
        }
        if let unwrappedMessagePhoneNumber = receivedContact?.phoneNumber,
           let unwrappedSelectedPhoneType = receivedContact?.selectedPhoneType {
            displayScreen.textFieldPhone.text = "Phone: \(unwrappedMessagePhoneNumber) (\(unwrappedSelectedPhoneType))"
            displayScreen.imageViewPhoneType.image = UIImage(named: unwrappedSelectedPhoneType.lowercased())
        }
        displayScreen.textFieldAddress.text = receivedContact?.address
        displayScreen.textFieldCityState.text = receivedContact?.cityState
        displayScreen.textFieldZipCode.text = receivedContact?.zipCode
    }
    
    @objc func editContact() {
        let editContactViewController = AddContactDetailsViewController()
        
        // Send current contact data to the edit screen
        editContactViewController.existingContact = receivedContact
        
        // Push the edit screen
        navigationController?.pushViewController(editContactViewController, animated: true)
    }
}
