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
        
        
//        buttonSubmit.addTarget(self, action: #selector(onButtonClickMeTapped), for: .touchUpInside)
        
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
        textFieldName.borderStyle = .roundedRect
        textFieldName.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(textFieldName)
    }
    func setupTextFieldEmail(){
        textFieldEmail = UITextField()
        textFieldEmail.placeholder = "Email"
        textFieldEmail.borderStyle = .roundedRect
        textFieldEmail.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(textFieldEmail)
    }
    func setupLabelAddPhone(){
        labelAddPhone = UILabel()
        labelAddPhone.text = "Add Phone"
        labelAddPhone.font = labelAddPhone.font.withSize(20)
        labelAddPhone.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelAddPhone)
    }
    func setupLabelSelectedType(){
        labelSelectedType = UILabel()
        labelSelectedType.text = "Selected Type:"
        labelSelectedType.font = labelSelectedType.font.withSize(14)
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
        textFieldPhone.borderStyle = .roundedRect
        textFieldPhone.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(textFieldPhone)
    }
    func setupTextFieldAddress(){
        textFieldAddress = UITextField()
        textFieldAddress.placeholder = "Address"
        textFieldAddress.borderStyle = .roundedRect
        textFieldAddress.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(textFieldAddress)
    }
    func setupTextFieldCityState(){
        textFieldCityState = UITextField()
        textFieldCityState.placeholder = "City, State"
        textFieldCityState.borderStyle = .roundedRect
        textFieldCityState.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(textFieldCityState)
    }
    func setupTextFieldZipCode(){
        textFieldZipCode = UITextField()
        textFieldZipCode.placeholder = "Zip"
        textFieldZipCode.borderStyle = .roundedRect
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
            labelAppName.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 16),
            labelAppName.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            textFieldName.topAnchor.constraint(equalTo: labelAppName.bottomAnchor, constant: 16),
            textFieldName.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            textFieldName.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            textFieldName.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            textFieldEmail.topAnchor.constraint(equalTo: textFieldName.bottomAnchor, constant: 16),
            textFieldEmail.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            textFieldEmail.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            textFieldEmail.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            labelAddPhone.topAnchor.constraint(equalTo: textFieldEmail.bottomAnchor, constant: 16),
            labelAddPhone.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            labelSelectedType.topAnchor.constraint(equalTo: labelAddPhone.bottomAnchor, constant: 16),
            labelSelectedType.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            pickerViewPhoneType.topAnchor.constraint(equalTo: labelSelectedType.bottomAnchor, constant: 16),
            pickerViewPhoneType.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            textFieldPhone.topAnchor.constraint(equalTo: pickerViewPhoneType.safeAreaLayoutGuide.bottomAnchor, constant: 16),
            textFieldPhone.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            textFieldPhone.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            textFieldPhone.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            textFieldAddress.topAnchor.constraint(equalTo: textFieldPhone.safeAreaLayoutGuide.bottomAnchor, constant: 16),
            textFieldAddress.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            textFieldAddress.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            textFieldAddress.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            textFieldCityState.topAnchor.constraint(equalTo: textFieldAddress.safeAreaLayoutGuide.bottomAnchor, constant: 16),
            textFieldCityState.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            textFieldCityState.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            textFieldCityState.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            textFieldZipCode.topAnchor.constraint(equalTo: textFieldCityState.safeAreaLayoutGuide.bottomAnchor, constant: 16),
            textFieldZipCode.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            textFieldZipCode.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            textFieldZipCode.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            buttonSubmit.topAnchor.constraint(equalTo: textFieldZipCode.safeAreaLayoutGuide.bottomAnchor, constant: 64),
            buttonSubmit.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor)

        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
