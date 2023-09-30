import UIKit

class ViewController: UIViewController {
    
    let phoneType: [String] = ["Cell", "Work", "Home"]
    
    var selectedPhoneType = "Cell"
    
        public struct Package {
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
    
    //MARK: initializing the First Screen View...
    let firstScreen = FirstScreenView()
    
    //MARK: add the view to this controller while the view is loading...
    override func loadView() {
        view = firstScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        firstScreen.pickerViewPhoneType.delegate = self
        firstScreen.pickerViewPhoneType.dataSource = self
        
        firstScreen.buttonSubmit.addTarget(self, action: #selector(onButtonSubmitTapped), for: .touchUpInside)
    }
    @objc func onButtonSubmitTapped(){
//        let emailSession = firstScreen.textFieldEmail.text
//        let nameSession = firstScreen.textFieldName.text
//        let phoneSession = firstScreen.textFieldPhone.text
//        let addressSession = firstScreen.textFieldAddress.text
//        let cityStateSession = firstScreen.textFieldCityState.text
//        let zipCodeSession = firstScreen.textFieldZipCode.text
        
        guard let nameSession = firstScreen.textFieldName.text, !nameSession.isEmpty else {
            showErrorAlert(currentField: "Name")
            return
        }
        //for email validation
        guard let emailSession = firstScreen.textFieldEmail.text, !emailSession.isEmpty else {
            showErrorAlert(currentField: "Email")
            return
        }
        guard isValidEmail(emailSession) else {
            showAlertText(text: "Please enter a valid email address!")
            return
        }
        
        guard let phoneSession = firstScreen.textFieldPhone.text, !phoneSession.isEmpty else {
            showErrorAlert(currentField: "Phone")
            return
        }
        guard phoneNumberValid(phoneSession) else {
            showAlertText(text: "Please enter a valid phone number with 9 digits")
            return
        }
        guard let addressSession = firstScreen.textFieldAddress.text, !addressSession.isEmpty else {
            showErrorAlert(currentField: "Address")
            return
        }
        guard let cityStateSession = firstScreen.textFieldCityState.text, !cityStateSession.isEmpty else {
            showErrorAlert(currentField: "City & State")
            return
        }
        guard let zipCodeSession = firstScreen.textFieldZipCode.text, !zipCodeSession.isEmpty else {
            showErrorAlert(currentField: "ZipCode")
            return
        }
        guard isValidZipCode(zipCodeSession) else{
            showAlertText(text: "Please enter a valid ZipCode from 00001 – 99950")
            return
        }
        
        let package = Package(name: nameSession, email: emailSession, selectedPhoneType: selectedPhoneType, phoneNumber: phoneSession, address: addressSession, cityState: cityStateSession, zipCode: zipCodeSession)
        
        let displayViewController = DisplayViewController()
                       
       //setting the to be sent package...
       displayViewController.receivedPackage = package
       
       //pushing displayController to navigation controller...
       navigationController?.pushViewController(displayViewController, animated: true)
        
    }
    
    func showErrorAlert(currentField: String){
        let alert = UIAlertController(
            title: "Error!", message: "\(currentField) Text Field must not be empty!",
            preferredStyle: .alert
        )
        
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        
        self.present(alert, animated: true)
    }

    //MARK: text alert...
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
    func phoneNumberValid(_ poneNumber: String) -> Bool {
        if poneNumber.count == 9 {
            guard let digitPoneNumber = Int(poneNumber) else { return false }
            return (digitPoneNumber >= 1 && digitPoneNumber <= 999999999)
        }
        return false
    }
}


extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource{
        //returns the number of columns/components in the Picker View...
        func numberOfComponents(in pickerView: UIPickerView) -> Int {
            return 1
        }
        
        //returns the number of rows in the current component...
        func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            return phoneType.count
        }
        
        //set the title of currently picked row...
        func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
            // on change selection, update selectedMood...
            selectedPhoneType = phoneType[row]
            return phoneType[row]
        }
    }

