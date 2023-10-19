import UIKit

class DisplayView: UIView {

    var textFieldName: UITextField!
    var textFieldEmail: UITextField!
    var textFieldPhone: UITextField!
    var textFieldAddress: UITextField!
    var textFieldCityState: UITextField!
    var textFieldZipCode: UITextField!
    
    var imageViewPhoneType: UIImageView!
    
    //MARK: View initializer...
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        //setting the background color...
        self.backgroundColor = .white
        
        setupTextFieldName()
        setupTextFieldEmail()
        
        setupTextFieldPhone()
        
        setupTextFieldAddress()
        setupTextFieldCityState()
        setupTextFieldZipCode()
        
        setupImageViewPhoneType()
        
        initConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: initializing the UI elements...
    func setupImageViewPhoneType(){
        imageViewPhoneType = UIImageView()
        imageViewPhoneType.contentMode = .scaleAspectFit
        imageViewPhoneType.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(imageViewPhoneType)
    }
    
    func setupTextFieldName(){
        textFieldName = UITextField()
//        textFieldName.placeholder = "Name"
        textFieldName.textAlignment = .center
        textFieldName.font = UIFont.boldSystemFont(ofSize: 20)
        textFieldName.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(textFieldName)
    }
    func setupTextFieldEmail(){
        textFieldEmail = UITextField()
//        textFieldEmail.placeholder = "Email"
        textFieldEmail.keyboardType = .emailAddress
        textFieldEmail.textAlignment = .left
        textFieldEmail.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(textFieldEmail)
    }

    func setupTextFieldPhone(){
        textFieldPhone = UITextField()
//        textFieldPhone.placeholder = "Phone"
        textFieldPhone.keyboardType = .phonePad
        textFieldPhone.textAlignment = .left
        textFieldPhone.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(textFieldPhone)
    }
    func setupTextFieldAddress(){
        textFieldAddress = UITextField()
//        textFieldAddress.placeholder = "Address"
        textFieldAddress.textAlignment = .left
        textFieldAddress.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(textFieldAddress)
    }
    func setupTextFieldCityState(){
        textFieldCityState = UITextField()
//        textFieldCityState.placeholder = "City, State"
        textFieldCityState.textAlignment = .left
        textFieldCityState.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(textFieldCityState)
    }
    func setupTextFieldZipCode(){
        textFieldZipCode = UITextField()
//        textFieldZipCode.placeholder = "Zip"
        textFieldZipCode.textAlignment = .left
        textFieldZipCode.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(textFieldZipCode)
    }
    
    func initConstraints(){
            NSLayoutConstraint.activate([
                
                textFieldName.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 16),
                textFieldName.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
                
                
                textFieldEmail.topAnchor.constraint(equalTo: textFieldName.bottomAnchor, constant: 16),
                textFieldEmail.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
                
                
                textFieldPhone.topAnchor.constraint(equalTo: textFieldEmail.bottomAnchor, constant: 16),
                textFieldPhone.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
                
                
                textFieldAddress.topAnchor.constraint(equalTo: textFieldPhone.safeAreaLayoutGuide.bottomAnchor, constant: 16),
                textFieldAddress.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
        
                
                textFieldCityState.topAnchor.constraint(equalTo: textFieldAddress.safeAreaLayoutGuide.bottomAnchor, constant: 16),
                textFieldCityState.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
                
                
                textFieldZipCode.topAnchor.constraint(equalTo: textFieldCityState.safeAreaLayoutGuide.bottomAnchor, constant: 16),
                textFieldZipCode.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
                
                imageViewPhoneType.topAnchor.constraint(equalTo: textFieldZipCode.safeAreaLayoutGuide.bottomAnchor, constant: 90),
                imageViewPhoneType.centerXAnchor.constraint(equalTo: self.centerXAnchor)
            
            ])
        }
    
}

