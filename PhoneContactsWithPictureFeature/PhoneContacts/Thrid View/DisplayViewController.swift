import UIKit

class DisplayViewController: UIViewController {
    
    var contactIndex: Int?
    var delegate: ViewController?


    //MARK: creating instance of DisplayView...
    let detailScreen = DetailScreenView()
    
    //MARK: patch the view of the controller to the DisplayView...
    override func loadView() {
        view = detailScreen
    }
    
    //MARK: message and mood from the first screen...
    var receivedNewAddedContact: Contact! // The first screen can set this variable...
    
    override func viewDidLoad() {
        super.viewDidLoad()
        populateContactDetails()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit , target: self, action: #selector(onEditBarButtonTapped))
        
    }
    
    @objc func onEditBarButtonTapped() {
        let editVC = AddContactViewController()
        editVC.existingContact = receivedNewAddedContact
        editVC.selectedContactIndex = contactIndex // set the indexPath to know which contact to update in the main list
        editVC.delegate = delegate// Set this to your Main Screen instance
        navigationController?.pushViewController(editVC, animated: true)
    }
    
    func populateContactDetails() {
        //MARK: setting the Labels' texts...
        if let unwrappedMessageName = receivedNewAddedContact.name{
            if !unwrappedMessageName.isEmpty{
                detailScreen.labelNameDetail.text = "\(unwrappedMessageName)"
            }
        }
        
        if let unwrappedMessageEmail = receivedNewAddedContact.email{
            if !unwrappedMessageEmail.isEmpty{
                detailScreen.labelEmailDetail.text = "Email: \(unwrappedMessageEmail)"
            }
        }
        
        
        if let uwcontactPhone = receivedNewAddedContact.phone, let uwcontactPhoneType = receivedNewAddedContact.phoneType {
            detailScreen.labelPhoneDetail.text = "Phone: \(uwcontactPhone) (\(uwcontactPhoneType))"
        }
        
        if let unwrappedMessageAddress = receivedNewAddedContact.address{
            if !unwrappedMessageAddress.isEmpty{
                detailScreen.labelAddress.text = "Address: \(unwrappedMessageAddress)"
            }
        }
        
        if let unwrappedMessageCityState = receivedNewAddedContact.cityState{
            if !unwrappedMessageCityState.isEmpty{
                detailScreen.labelCityState.text = "\(unwrappedMessageCityState)"
            }
        }
        
        if let unwrappedMessageZipCode = receivedNewAddedContact.zipCode{
            if !unwrappedMessageZipCode.isEmpty{
                detailScreen.labelZipCode.text = "Zip Code: \(unwrappedMessageZipCode)"
            }
        }
    }
}

extension DisplayViewController: EditContactDelegate {
    func contactDidEdit(contact updatedContact: Contact, at index: Int) {
        
        receivedNewAddedContact = updatedContact
        populateContactDetails()
    }
}

