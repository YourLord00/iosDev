import UIKit

class DisplayView: UIView {

   
    var textFieldName: UITextField!
    var textFieldEmail: UITextField!
    var textFieldPhone: UITextField!
    var textFieldAddress: UITextField!
    var textFieldCityState: UITextField!
    var textFieldZipCode: UITextField!
    
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
        
        initConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: initializing the UI elements...
    func setupTextFieldName(){
        textFieldName = UITextField()
//        textFieldName.placeholder = "Name"
        textFieldName.textAlignment = .left
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
                
                textFieldName.topAnchor.constraint(equalTo: self.bottomAnchor, constant: 16),
                textFieldName.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
                textFieldName.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
                
                
                textFieldEmail.topAnchor.constraint(equalTo: textFieldName.bottomAnchor, constant: 16),
                textFieldEmail.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
                textFieldEmail.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
                
                
                textFieldPhone.topAnchor.constraint(equalTo: textFieldEmail.bottomAnchor, constant: 16),
                textFieldPhone.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
                textFieldPhone.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
                
                
                textFieldAddress.topAnchor.constraint(equalTo: textFieldPhone.safeAreaLayoutGuide.bottomAnchor, constant: 16),
                textFieldAddress.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
                textFieldAddress.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
        
                
                textFieldCityState.topAnchor.constraint(equalTo: textFieldAddress.safeAreaLayoutGuide.bottomAnchor, constant: 16),
                textFieldCityState.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
                textFieldCityState.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
                
                
                textFieldZipCode.topAnchor.constraint(equalTo: textFieldCityState.safeAreaLayoutGuide.bottomAnchor, constant: 16),
                textFieldZipCode.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
                textFieldZipCode.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            
            ])
        }
    
}

