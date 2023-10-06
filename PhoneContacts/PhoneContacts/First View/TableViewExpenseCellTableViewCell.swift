//
//  TableViewExpenseCell.swift

import UIKit

class TableViewExpenseCell: UITableViewCell {
    var wrapperCellView: UIView!
    var labelName: UILabel!
    var labelEmail: UILabel!
    var labelContactNumber: UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            setupWrapperCellView()
            setupLabelName()
            setupLabelEmail()
            setupLabelContactNumber()
            initConstraints()
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
                wrapperCellView.topAnchor.constraint(equalTo: self.topAnchor),
                wrapperCellView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
                wrapperCellView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
                wrapperCellView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
                
                labelName.topAnchor.constraint(equalTo: wrapperCellView.topAnchor, constant: 4),
                labelName.leadingAnchor.constraint(equalTo: wrapperCellView.leadingAnchor, constant: 4),
                labelName.heightAnchor.constraint(equalToConstant: 20),
                
                labelEmail.topAnchor.constraint(equalTo: labelName.bottomAnchor, constant: 4),
                labelEmail.leadingAnchor.constraint(equalTo: labelName.leadingAnchor),
                labelEmail.heightAnchor.constraint(equalToConstant: 20),
                
                labelContactNumber.topAnchor.constraint(equalTo: labelEmail.bottomAnchor, constant: 4),
                labelContactNumber.leadingAnchor.constraint(equalTo: labelName.leadingAnchor),
                labelContactNumber.heightAnchor.constraint(equalToConstant: 20),
                
                wrapperCellView.heightAnchor.constraint(equalToConstant: 76)
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
