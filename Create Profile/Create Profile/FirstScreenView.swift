import UIKit

class FirstScreenView: UIView {

    var labelAppName: UILabel!
    var textFieldName: UITextField!
    var textFieldEmail: UITextField!
    var labelAddPhone: UILabel!
    var labelSelectedType: UILabel!
    var pickerViewPhoneType: UIPickerView!
    var textFieldPhone: UITextField!
    var textFieldAddress: UITextField!
    var textFieldCityState: UITextField!
    var textFieldZipCode: UITextField!
    
    var buttonSubmit: UIButton!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        //MARK: set the background color...
        self.backgroundColor = .white
        
        //MARK: initializing the UI elements and constraints...
        setupLabelAppName()
        setupTextFieldName()
        setupTextFieldEmail()
        
        setupLabelAddPhone()
        setupLabelSelectedType()
        setupPickerPhoneType()
        setupTextFieldPhone()
        
        setupTextFieldAddress()
        setupTextFieldCityState()
        setupTextFieldZipCode()

        setupButtonSubmit()
        
        initConstraints()
        
        
        buttonSubmit.addTarget(self, action: #selector(onButtonClickMeTapped), for: .touchUpInside)
        
    }
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    @objc func onButtonClickMeTapped(){
        //print("Button Clicked!!")
        // MARK: fetching the text the user typed...
        let text = textFieldEmail.text
        
        //Unwrapping the optional text...
        if let unwrappedText = text{
            //print(unwrappedText)
            
            if(unwrappedText.isEmpty || !isValidEmail(unwrappedText) ){ //The user didn't put anything...
                showErrorAlert()
            } else{ //The user put some texts...
                showAlertText(text: unwrappedText)
            }
        }
    }

    //MARK: Error alert...
    func showErrorAlert(){
        let alert = UIAlertController(
            title: "Error!", message: "Text Field must not be empty!",
            preferredStyle: .alert
        )
        
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        
        self.present(alert, animated: true)
    }

    //MARK: text alert...
    func showAlertText(text:String){
        let alert = UIAlertController(
            title: "You said:",
            message: "\(text)",
            preferredStyle: .alert
        )
        
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        
        self.present(alert, animated: true)
    }
    
    //MARK: initializing the UI elements...
    func setupLabelAppName(){
        labelAppName = UILabel()
        labelAppName.text = "Create Profile"
        labelAppName.font = UIFont.systemFont(ofSize: 24)
        labelAppName.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelAppName)
    }
    func setupTextFieldName(){
        textFieldName = UITextField()
        textFieldName.placeholder = "Name"
        textFieldName.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(textFieldName)
    }
    func setupTextFieldEmail(){
        textFieldEmail = UITextField()
        textFieldEmail.placeholder = "Email"
        textFieldEmail.keyboardType = .emailAddress
        textFieldEmail.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(textFieldEmail)
    }
    func setupLabelAddPhone(){
        labelAddPhone = UILabel()
        labelAddPhone.text = "Add Phone"
        labelAddPhone.font = labelAddPhone.font.withSize(22)
        labelAddPhone.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelAddPhone)
    }
    func setupLabelSelectedType(){
        labelSelectedType = UILabel()
        labelSelectedType.text = "Selected Type:"
        labelSelectedType.font = labelSelectedType.font.withSize(15)
        labelSelectedType.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelSelectedType)
    }
    func setupPickerPhoneType(){
        pickerViewPhoneType = UIPickerView()
        pickerViewPhoneType.isUserInteractionEnabled = true
        pickerViewPhoneType.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(pickerViewPhoneType)
    }
    func setupTextFieldPhone(){
        textFieldPhone = UITextField()
        textFieldPhone.placeholder = "Phone"
        textFieldPhone.keyboardType = .phonePad
        textFieldPhone.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(textFieldPhone)
    }
    func setupTextFieldAddress(){
        textFieldAddress = UITextField()
        textFieldAddress.placeholder = "Address"
        textFieldAddress.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(textFieldAddress)
    }
    func setupTextFieldCityState(){
        textFieldCityState = UITextField()
        textFieldCityState.placeholder = "City, State"
        textFieldCityState.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(textFieldCityState)
    }
    func setupTextFieldZipCode(){
        textFieldZipCode = UITextField()
        textFieldZipCode.placeholder = "Zip"
        textFieldZipCode.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(textFieldZipCode)
    }
    func setupButtonSubmit(){
        buttonSubmit = UIButton(type: .system)
        buttonSubmit.setTitle("Submit", for: .normal)
        buttonSubmit.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(buttonSubmit)
    }
    
    func initConstraints(){
            NSLayoutConstraint.activate([
                labelAppName.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 32),
                labelAppName.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
                
                textFieldName.topAnchor.constraint(equalTo: labelAppName.bottomAnchor, constant: 16),
                textFieldName.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
                
                textFieldEmail.topAnchor.constraint(equalTo: textFieldName.bottomAnchor, constant: 16),
                textFieldEmail.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
                
                labelAddPhone.topAnchor.constraint(equalTo: textFieldEmail.bottomAnchor, constant: 16),
                labelAddPhone.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
                
                labelSelectedType.topAnchor.constraint(equalTo: labelAddPhone.bottomAnchor, constant: 16),
                labelSelectedType.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
                
                pickerViewPhoneType.topAnchor.constraint(equalTo: labelSelectedType.bottomAnchor, constant: 16),
                pickerViewPhoneType.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
                
                textFieldPhone.topAnchor.constraint(equalTo: pickerViewPhoneType.safeAreaLayoutGuide.topAnchor, constant: 32),
                textFieldPhone.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
                
                textFieldAddress.topAnchor.constraint(equalTo: textFieldPhone.safeAreaLayoutGuide.topAnchor, constant: 32),
                textFieldAddress.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
                
                textFieldCityState.topAnchor.constraint(equalTo: textFieldAddress.safeAreaLayoutGuide.topAnchor, constant: 32),
                textFieldCityState.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
                
                textFieldZipCode.topAnchor.constraint(equalTo: textFieldCityState.safeAreaLayoutGuide.topAnchor, constant: 32),
                textFieldZipCode.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
                
                buttonSubmit.topAnchor.constraint(equalTo: textFieldZipCode.safeAreaLayoutGuide.topAnchor, constant: 64),
                buttonSubmit.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor)

            ])
        }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
