//
//  ViewController.swift
//  App5_draft

import UIKit

class ViewController: UIViewController {
    
    let firstScreen = FirstScreenView()
    
    var contacts = [Contact]()
    
    //MARK: predefined types of expenses...
//    let phoneTypes = ["Cell", "Work", "Home"]
    
    override func loadView() {
        view = firstScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "My Contacts"
        
        //MARK: patching the table view delegate and datasource to controller...
        firstScreen.tableViewContact.delegate = self
        firstScreen.tableViewContact.dataSource = self
        
        //MARK: setting the add button to the navigation controller...
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add, target: self,
            action: #selector(onAddBarButtonTapped)
        )
        
//        contacts.append(Contact(name: "khan", email: "khan@gmail.com", contactNumber: phoneTypes[1]))

    }
    @objc func onAddBarButtonTapped(){
        let addContactDetailsViewController = AddContactDetailsViewController()
        addContactDetailsViewController.delegate = self
        navigationController?.pushViewController(addContactDetailsViewController, animated: true)
    }
    
    func delegateOnAddContactDetails(contact: Contact){
        contacts.append(contact)
        firstScreen.tableViewContact.reloadData()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Deselect the row to remove the selection highlight.
        tableView.deselectRow(at: indexPath, animated: true)
        
        // Assuming you have an array of contacts called `contacts`, fetch the selected contact.
        let selectedContact = contacts[indexPath.row]
        
        // Create an instance of DisplayViewController and set its properties.
        let displayViewController = DisplayViewController()
        // Here, you'll want to pass the contact data to the DisplayViewController in a format it can use.
        // For this example, we're creating a package for the display view controller.
        let package = AddContactDetailsViewController.Package(name: selectedContact.name, email: selectedContact.email, selectedPhoneType: selectedContact.selectedPhoneType, phoneNumber: selectedContact.phoneNumber, address: selectedContact.address, cityState: selectedContact.cityState, zipCode: selectedContact.zipCode)
        displayViewController.receivedPackage = package
        
        // Push the DisplayViewController onto the navigation stack.
        navigationController?.pushViewController(displayViewController, animated: true)
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "contact", for: indexPath) as! TableViewExpenseCell
        cell.labelName.text = contacts[indexPath.row].name
        if let uwEmail = contacts[indexPath.row].email{
            cell.labelEmail.text = "Email: \(uwEmail)"
        }
        
        let contact = contacts[indexPath.row]

        if let uwContactNumber = contact.phoneNumber, let phoneType = contact.selectedPhoneType {
            cell.labelContactNumber.text = "ContactNumber: \(uwContactNumber) \(phoneType)"
        }
   
        return cell
    }
    
    
}
    
