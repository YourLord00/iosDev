//
//  ViewController.swift
//  App1
//
//  Created by user246137 on 9/19/23.
//

import UIKit

class ViewController: UIViewController {
    
    var labelHello:UILabel!
    var textFieldUser:UITextField!
    var textFieldUser2:UITextField!
    
    var addtion:UIButton!
    var resultTextField:UILabel!
    
    var buttonClickMe:UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setupLabelHello()
        setupTextFieldUser()
        setupTextFieldUser2()
        
        setupAdd()
        setupResultTextField()
        
        setupButtonClickMe()
        
        //logic controller
        buttonClickMe.addTarget(self,
            action: #selector(onButtonClickMeTapped),
            for: .touchUpInside
        )
        
        addtion.addTarget(self,
            action: #selector(onButtonAddTapped),
            for: .touchUpInside
        )
        
        //initiate constraints
        initConstraints()
    }
    
    func setupLabelHello(){
        labelHello = UILabel()
        labelHello.text = "Basic Calculator"
        labelHello.font = UIFont.systemFont(ofSize: 24)
        labelHello.textColor = .systemBlue
        labelHello.textAlignment = .center
        labelHello.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(labelHello)
    }
    
    @objc func onButtonClickMeTapped(){
        let text = textFieldUser.text
        if let unwrappedText = text{
            if(unwrappedText.isEmpty) {
                showErrorAlert()
            } else {
                showAlertText(text: unwrappedText)
            }
        }
    }
    func showErrorAlert(){
        let alert = UIAlertController(title: "Error!", message: "Text Field must not be empty", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alert, animated: true)
    }
    func showAlertText(text: String){
        let alert = UIAlertController(title: "You said", message: "\(text)", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alert, animated: true)
    }
    
    @objc func onButtonAddTapped(){
        let text = textFieldUser.text
        let text2 = textFieldUser2.text
    
        if let unWrappedText = text, let unWrappedText2 = text2{
            if(unWrappedText.isEmpty || unWrappedText2.isEmpty){
                showErrorAlert()
            } else {
                if let firstNumber = Double(unWrappedText), let secondNumber = Double(unWrappedText2){
                    let result = firstNumber + secondNumber
                    resultTextField.text = String(result)
                }
            }
            
        }
            
    }

    //Defining the TextField attributes...
    func setupTextFieldUser(){
        textFieldUser = UITextField()
        textFieldUser.placeholder = "Put first number"
        textFieldUser.borderStyle = .roundedRect
//        textFieldUser.keyboardType = .decimalPad
        textFieldUser.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(textFieldUser)
    }
    func setupTextFieldUser2(){
        textFieldUser2 = UITextField()
        textFieldUser2.placeholder = "Put second number"
        textFieldUser2.borderStyle = .roundedRect
//        textFieldUser2.keyboardType = .decimalPad
        textFieldUser2.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(textFieldUser2)
    }
    
    //Defining the Button attributes...
    func setupAdd(){
        addtion = UIButton(type: .system) //You need to set the type when you create a Button. We use default system button...
        addtion.setTitle("Add", for: .normal)
        addtion.tintColor = .systemBlue
        addtion.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(addtion)
    }
    
    func setupResultTextField(){
        resultTextField = UILabel()
        resultTextField.text = "Result will be shown here"
        resultTextField.textAlignment = .center
        resultTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(resultTextField)
    }
    
    func setupButtonClickMe(){
        buttonClickMe = UIButton(type: .system) //You need to set the type when you create a Button. We use default system button...
        buttonClickMe.setTitle("Click Me!", for: .normal)
        buttonClickMe.tintColor = .systemBlue
        buttonClickMe.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(buttonClickMe)
    }
    
    func initConstraints(){
        NSLayoutConstraint.activate(
            [labelHello.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32),
             labelHello.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor)
            ]
        )
        NSLayoutConstraint.activate(
            [textFieldUser.topAnchor.constraint(equalTo: labelHello.bottomAnchor, constant: 16),
             textFieldUser.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor)
            ]
        )
        NSLayoutConstraint.activate(
            [textFieldUser2.topAnchor.constraint(equalTo: textFieldUser.bottomAnchor, constant: 16),
             textFieldUser2.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor)
            ]
        )
        NSLayoutConstraint.activate(
            [addtion.topAnchor.constraint(equalTo: textFieldUser2.bottomAnchor, constant: 16),
             addtion.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor)
            ]
        )
        NSLayoutConstraint.activate(
            [resultTextField.topAnchor.constraint(equalTo: textFieldUser2.bottomAnchor, constant: 300),
             resultTextField.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor)
            ]
        )
        
        NSLayoutConstraint.activate(
            [buttonClickMe.bottomAnchor.constraint(equalTo: textFieldUser2.bottomAnchor, constant: 400),
             buttonClickMe.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor)
            ]
        )

        
    }
}

