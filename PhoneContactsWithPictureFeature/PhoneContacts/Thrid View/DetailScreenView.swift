import UIKit

class DetailScreenView: UIView {

    var labelNameDetail: UILabel!
    var labelEmailDetail: UILabel!
    var labelPhoneDetail: UILabel!
    var labelAddress: UILabel!
    var labelAddressDetail: UILabel!
    var labelCityState: UILabel!
    var labelZipCode: UILabel!
    var imageContact: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        
        setupLabelNameDetail()
        setupLabelEmailDetail()
        setupLabelPhoneDetail()
        setupLabelAddress()
        setupLabelAddressDetail()
        setupLabelCityState()
        setupLabelZipCode()
        setupimageContact()
        initConstraints()
    }
    
    func setupLabelNameDetail() {
        labelNameDetail = UILabel()
        labelNameDetail.font = UIFont.boldSystemFont(ofSize: 20)
        labelNameDetail.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelNameDetail)
    }
    
    func setupLabelEmailDetail() {
        labelEmailDetail = UILabel()
        labelEmailDetail.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelEmailDetail)
    }
    
    func setupLabelPhoneDetail() {
        labelPhoneDetail = UILabel()
        labelPhoneDetail.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelPhoneDetail)
    }
    
    func setupLabelAddress() {
        labelAddress = UILabel()
        labelAddress.font = UIFont.boldSystemFont(ofSize: 16)
        labelAddress.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelAddress)
    }
    
    func setupLabelAddressDetail() {
        labelAddressDetail = UILabel()
        labelAddressDetail.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelAddressDetail)
    }
    
    func setupLabelCityState() {
        labelCityState = UILabel()
        labelCityState.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelCityState)
    }
    
    func setupLabelZipCode() {
        labelZipCode = UILabel()
        labelZipCode.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelZipCode)
    }
    
    func setupimageContact() {
        imageContact = UIImageView()
        imageContact.image = UIImage(systemName:"person.fill")
        imageContact.contentMode = .scaleAspectFill
        imageContact.clipsToBounds = true
        imageContact.layer.cornerRadius = 10
        imageContact.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(imageContact)
    }
    func initConstraints() {
        
        NSLayoutConstraint.activate([
            
            imageContact.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 40),
            imageContact.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            imageContact.widthAnchor.constraint(equalToConstant: 100),
            imageContact.heightAnchor.constraint(equalToConstant: 100),
            // Name
            labelNameDetail.topAnchor.constraint(equalTo: imageContact.bottomAnchor, constant: 20),
            labelNameDetail.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            // Email
            labelEmailDetail.topAnchor.constraint(equalTo: labelNameDetail.bottomAnchor, constant: 20),
            labelEmailDetail.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            // Phone
            labelPhoneDetail.topAnchor.constraint(equalTo: labelEmailDetail.bottomAnchor, constant: 10),
            labelPhoneDetail.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            // Address Label
            labelAddress.topAnchor.constraint(equalTo: labelPhoneDetail.bottomAnchor, constant: 30),
            labelAddress.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            // Address Detail
            labelAddressDetail.topAnchor.constraint(equalTo: labelAddress.bottomAnchor, constant: 10),
            labelAddressDetail.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            // City & State
            labelCityState.topAnchor.constraint(equalTo: labelAddressDetail.bottomAnchor, constant: 5),
            labelCityState.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            // Zip Code
            labelZipCode.topAnchor.constraint(equalTo: labelCityState.bottomAnchor, constant: 5),
            labelZipCode.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
    }

    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
