import PhotosUI
import UIKit

class AddContactDetailsViewController: UIViewController {
    
    var selectedPhoneType: String = "Home"
    var delegate: ViewController!
    var pickedImage: UIImage?
    var existingContact: Contact?
    let addContactDetailsViewScreen = AddContactDetailsView()
    

    
    override func loadView() {
        view = addContactDetailsViewScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let contact = existingContact {
            populateFieldsWith(contact: contact)
        }
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .save, target: self,
            action: #selector(onSaveBarButtonTapped)
        )
        
        addContactDetailsViewScreen.buttonTakePhotoForContact.menu = getMenuImagePicker()
        addContactDetailsViewScreen.buttonPhoneType.menu = getMenuTypes()
        
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyboardOnTap))
        view.addGestureRecognizer(tapRecognizer)
    }
    
    func populateFieldsWith(contact: Contact) {
        addContactDetailsViewScreen.textFieldName.text = contact.name
        addContactDetailsViewScreen.textFieldEmail.text = contact.email
        addContactDetailsViewScreen.textFieldPhone.text = contact.phoneNumber
        selectedPhoneType = contact.selectedPhoneType ?? "Home"
        addContactDetailsViewScreen.buttonPhoneType.setTitle(selectedPhoneType, for: .normal)
        addContactDetailsViewScreen.textFieldAddress.text = contact.address
        addContactDetailsViewScreen.textFieldCityState.text = contact.cityState
        addContactDetailsViewScreen.textFieldZipCode.text = contact.zipCode
        pickedImage = contact.image
        if let image = pickedImage {
            addContactDetailsViewScreen.buttonTakePhotoForContact.setImage(image, for: .normal)
        }
    }
    
    func getMenuTypes() -> UIMenu {
        var menuItems = [UIAction]()
        for type in Telecom.types {
            let menuItem = UIAction(title: type, handler: { (_) in
                self.selectedPhoneType = type
                self.addContactDetailsViewScreen.buttonPhoneType.setTitle(self.selectedPhoneType, for: .normal)
            })
            menuItems.append(menuItem)
        }
        return UIMenu(title: "Select type", children: menuItems)
    }

    func getMenuImagePicker() -> UIMenu {
        let menuItems = [
            UIAction(title: "Camera", handler: { (_) in
                self.pickUsingCamera()
            }),
            UIAction(title: "Gallery", handler: { (_) in
                self.pickPhotoFromGallery()
            })
        ]
        return UIMenu(title: "Select source", children: menuItems)
    }

    func pickUsingCamera() {
        let cameraController = UIImagePickerController()
        cameraController.sourceType = .camera
        cameraController.allowsEditing = true
        cameraController.delegate = self
        present(cameraController, animated: true)
    }

    func pickPhotoFromGallery() {
        var configuration = PHPickerConfiguration()
        configuration.filter = PHPickerFilter.any(of: [.images])
        configuration.selectionLimit = 1
        let photoPicker = PHPickerViewController(configuration: configuration)
        photoPicker.delegate = self
        present(photoPicker, animated: true, completion: nil)
    }
    
    @objc func hideKeyboardOnTap() {
        view.endEditing(true)
    }
    
    @objc func onSaveBarButtonTapped() {

        // Validation and extraction of data from the views
        guard let nameSession = addContactDetailsViewScreen.textFieldName.text, !nameSession.isEmpty else {
            showErrorAlert(currentField: "Name")
            return
        }

        guard let emailSession = addContactDetailsViewScreen.textFieldEmail.text, !emailSession.isEmpty else {
            showErrorAlert(currentField: "Email")
            return
        }

        guard let phoneSession = addContactDetailsViewScreen.textFieldPhone.text, !phoneSession.isEmpty else {
            showErrorAlert(currentField: "Phone")
            return
        }

        guard let addressSession = addContactDetailsViewScreen.textFieldAddress.text, !addressSession.isEmpty else {
            showErrorAlert(currentField: "Address")
            return
        }

        guard let cityStateSession = addContactDetailsViewScreen.textFieldCityState.text, !cityStateSession.isEmpty else {
            showErrorAlert(currentField: "City & State")
            return
        }

        guard let zipCodeSession = addContactDetailsViewScreen.textFieldZipCode.text, !zipCodeSession.isEmpty else {
            showErrorAlert(currentField: "ZipCode")
            return
        }

        let contactToSave = Contact(name: nameSession, email: emailSession, selectedPhoneType: selectedPhoneType, phoneNumber: phoneSession, address: addressSession, cityState: cityStateSession, zipCode: zipCodeSession, image: pickedImage ?? UIImage(systemName: "photo"))
        
        if let _ = existingContact {
            if let index = delegate.contacts.firstIndex(where: { $0.name == existingContact?.name && $0.email == existingContact?.email }) {
                delegate.contacts[index] = contactToSave
            }
        } else {
            delegate.delegateOnAddContactDetails(contact: contactToSave)
        }
        
        navigationController?.popViewController(animated: true)
    }

    
    func showErrorAlert(currentField: String){
        let alert = UIAlertController(
            title: "Error!", message: "\(currentField) Text Field must not be empty!",
            preferredStyle: .alert
        )
        
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        
        self.present(alert, animated: true)
    }

    func showAlertText(text:String){
        let alert = UIAlertController(
            title: "Caution:",
            message: "\(text)",
            preferredStyle: .alert
        )
        
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        
        self.present(alert, animated: true)
    }
    
    func isValidZipCode(_ zipCode:String) -> Bool {
        if zipCode.count == 5 {
            guard let intZipCode = Int(zipCode) else { return false }
            return (intZipCode >= 1 && intZipCode <= 99950)
        }
        return false
    }
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    func phoneNumberValid(_ phoneNumber: String) -> Bool {
        if phoneNumber.count == 9 {
            guard let digitPhoneNumber = Int(phoneNumber) else { return false }
            return (digitPhoneNumber >= 1 && digitPhoneNumber <= 999999999)
        }
        return false
    }
}

extension AddContactDetailsViewController: UIPickerViewDelegate, UIPickerViewDataSource{
    //returns the number of columns/components in the Picker View...
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    //returns the number of rows in the current component...
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return Utilities.phoneTypes.count
    }

    //set the title of currently picked row...
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        // on change selection, update selectedMood...
        selectedPhoneType = Utilities.phoneTypes[row]
        return Utilities.phoneTypes[row]
    }
}

//MARK: adopting required protocols for PHPicker...
extension AddContactDetailsViewController:PHPickerViewControllerDelegate{
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        dismiss(animated: true)
        
        print(results)
        
        let itemprovider = results.map(\.itemProvider)
        
        for item in itemprovider{
            if item.canLoadObject(ofClass: UIImage.self){
                item.loadObject(ofClass: UIImage.self, completionHandler: { (image, error) in
                    DispatchQueue.main.async{
                        if let uwImage = image as? UIImage{
                            self.addContactDetailsViewScreen.buttonTakePhotoForContact.setImage(
                                uwImage.withRenderingMode(.alwaysOriginal),
                                for: .normal
                            )
                            self.pickedImage = uwImage
                        }
                    }
                })
            }
        }
    }
}

//MARK: adopting required protocols for UIImagePicker...
extension AddContactDetailsViewController: UINavigationControllerDelegate, UIImagePickerControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true)
        
        if let image = info[.editedImage] as? UIImage{
            self.addContactDetailsViewScreen.buttonTakePhotoForContact.setImage(
                image.withRenderingMode(.alwaysOriginal),
                for: .normal
            )
            self.pickedImage = image
        }else{
            // Do your thing for No image loaded...
        }
    }
}
