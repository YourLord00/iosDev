import UIKit

class AddContactDetailsView: UIView {

    var labelAppName: UILabel!
    var textFieldName: UITextField!
    var buttonTakePhotoForContact: UIButton!
    var textFieldEmail: UITextField!

    var buttonPhoneType: UIButton!
    var textFieldPhone: UITextField!
    var textFieldAddress: UITextField!
    var textFieldCityState: UITextField!
    var textFieldZipCode: UITextField!
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        //MARK: set the background color...
        self.backgroundColor = .white
        
        //MARK: initializing the UI elements and constraints...

        setupLabelAppName()
        //take photo
        setupbottonTakePhotoForContact()
        setupTextFieldName()
        setupTextFieldEmail()
        
        setupbuttonSelectPhoneType()
        setupTextFieldPhone()
        
        setupTextFieldAddress()
        setupTextFieldCityState()
        setupTextFieldZipCode()
        
        initConstraints()

    }
        
    //MARK: initializing the UI elements...
    func setupLabelAppName(){
        labelAppName = UILabel()
        labelAppName.text = "Add a New Contact"
        labelAppName.font = UIFont.systemFont(ofSize: 24)
        labelAppName.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelAppName)
    }
    
    func setupbottonTakePhotoForContact(){
        buttonTakePhotoForContact = UIButton(type: .system)
        buttonTakePhotoForContact.setTitle("", for: .normal)
        buttonTakePhotoForContact.setImage(UIImage(systemName: "camera.fill"), for: .normal)
        buttonTakePhotoForContact.contentHorizontalAlignment = .fill
        buttonTakePhotoForContact.contentVerticalAlignment = .fill
        buttonTakePhotoForContact.imageView?.contentMode = .scaleAspectFit
        buttonTakePhotoForContact.translatesAutoresizingMaskIntoConstraints = false
        buttonTakePhotoForContact.showsMenuAsPrimaryAction = true
        self.addSubview(buttonTakePhotoForContact)
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

    func setupbuttonSelectPhoneType(){
        buttonPhoneType = UIButton(type: .system)
        buttonPhoneType.setTitle("Home", for: .normal)
        //MARK: the on-tap primary action will pop up the menu...
        buttonPhoneType.showsMenuAsPrimaryAction = true
        buttonPhoneType.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(buttonPhoneType)
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

    
    func initConstraints(){
        NSLayoutConstraint.activate([
            labelAppName.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 16),
            labelAppName.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            textFieldName.topAnchor.constraint(equalTo: labelAppName.bottomAnchor, constant: 16),
            textFieldName.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            textFieldName.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            textFieldName.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            buttonTakePhotoForContact.topAnchor.constraint(equalTo: textFieldName.bottomAnchor, constant: 16),
            buttonTakePhotoForContact.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            buttonTakePhotoForContact.widthAnchor.constraint(equalToConstant: 100),
            buttonTakePhotoForContact.heightAnchor.constraint(equalToConstant: 100),
            
            textFieldEmail.topAnchor.constraint(equalTo: buttonTakePhotoForContact.bottomAnchor, constant: 16),
            textFieldEmail.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            textFieldEmail.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            textFieldEmail.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            
            textFieldPhone.topAnchor.constraint(equalTo: textFieldEmail.safeAreaLayoutGuide.bottomAnchor, constant: 16),
            textFieldPhone.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            textFieldPhone.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            textFieldPhone.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -8),
            
            
            buttonPhoneType.centerYAnchor.constraint(equalTo: textFieldPhone.centerYAnchor),
            buttonPhoneType.leadingAnchor.constraint(equalTo: textFieldPhone.trailingAnchor, constant: 8),
            buttonPhoneType.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),

            
            
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

        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
