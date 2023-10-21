import UIKit

class TableViewExpenseCell: UITableViewCell {
    var wrapperCellView: UIView!
    var labelName: UILabel!
    var labelEmail: UILabel!
    var labelContactNumber: UILabel!
    
    var imageReceipt: UIImageView!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            setupWrapperCellView()
            setupLabelName()
            setupLabelEmail()
            setupLabelContactNumber()
        
            setupimageReceipt()
        
            initConstraints()
        }
    
        func setupimageReceipt(){
            imageReceipt = UIImageView()
            imageReceipt.image = UIImage(systemName: "photo")
            imageReceipt.contentMode = .scaleToFill
            imageReceipt.clipsToBounds = true
            imageReceipt.layer.cornerRadius = 10
            imageReceipt.translatesAutoresizingMaskIntoConstraints = false
            wrapperCellView.addSubview(imageReceipt)
        }
        
        func setupWrapperCellView(){
            wrapperCellView = UITableViewCell()
            wrapperCellView.translatesAutoresizingMaskIntoConstraints = false
            self.addSubview(wrapperCellView)
        }
        
        func setupLabelName(){
            labelName = UILabel()
            labelName.font = UIFont.boldSystemFont(ofSize: 16)
            labelName.translatesAutoresizingMaskIntoConstraints = false
            wrapperCellView.addSubview(labelName)
        }
        func setupLabelEmail(){
            labelEmail = UILabel()
            labelEmail.translatesAutoresizingMaskIntoConstraints = false
            wrapperCellView.addSubview(labelEmail)
        }
        func setupLabelContactNumber(){
            labelContactNumber = UILabel()
            labelContactNumber.translatesAutoresizingMaskIntoConstraints = false
            wrapperCellView.addSubview(labelContactNumber)
        }
        
        func initConstraints(){
            NSLayoutConstraint.activate([
                wrapperCellView.topAnchor.constraint(equalTo: self.topAnchor,constant: 10),
                wrapperCellView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
                wrapperCellView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
                wrapperCellView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
                
                labelName.topAnchor.constraint(equalTo: wrapperCellView.topAnchor, constant: 2),
                labelName.leadingAnchor.constraint(equalTo: imageReceipt.trailingAnchor, constant: 8),
                labelName.heightAnchor.constraint(equalToConstant: 32),
                labelName.widthAnchor.constraint(lessThanOrEqualTo: wrapperCellView.widthAnchor),
                            
                labelEmail.topAnchor.constraint(equalTo: labelName.bottomAnchor, constant: 2),
                labelEmail.leadingAnchor.constraint(equalTo: labelName.leadingAnchor),
                labelEmail.heightAnchor.constraint(equalToConstant: 32),
                labelEmail.widthAnchor.constraint(lessThanOrEqualTo: labelName.widthAnchor),
                
                labelContactNumber.topAnchor.constraint(equalTo: labelEmail.bottomAnchor, constant: 2),
                labelContactNumber.leadingAnchor.constraint(equalTo: labelName.leadingAnchor),
                labelContactNumber.heightAnchor.constraint(equalToConstant: 32),
                labelName.widthAnchor.constraint(lessThanOrEqualTo: wrapperCellView.widthAnchor),
                
                imageReceipt.leadingAnchor.constraint(equalTo: wrapperCellView.leadingAnchor, constant: 8),
                imageReceipt.centerYAnchor.constraint(equalTo: wrapperCellView.centerYAnchor),
                //MARK: it is better to set the height and width of an ImageView with constraints...
                imageReceipt.heightAnchor.constraint(equalTo: wrapperCellView.heightAnchor, constant: -20),
                imageReceipt.widthAnchor.constraint(equalTo: wrapperCellView.heightAnchor, constant: -20),
                
                wrapperCellView.heightAnchor.constraint(equalToConstant: 104)
            ])
        }
    
    
    //MARK: unused methods...
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
