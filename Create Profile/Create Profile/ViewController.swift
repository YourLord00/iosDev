import UIKit

class ViewController: UIViewController {
    
    let phoneType: [String] = ["Cell", "Work", "Home"]
    
    var selectedPhoneType = "Cell"
    
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
