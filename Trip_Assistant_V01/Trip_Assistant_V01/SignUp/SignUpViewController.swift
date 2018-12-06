//
//  SignUpViewController.swift
//  Trip_Assistant_V01
//
//  Created by ios e on 4/2/18.
//  Copyright © 2018 ios-e. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {
    
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var txtf_name: UITextField!
    @IBOutlet weak var txtf_email: UITextField!
    @IBOutlet weak var txtf_usr: UITextField!
    @IBOutlet weak var txtf_password: UITextField!
    @IBOutlet weak var txtf_password_rep: UITextField!
    @IBOutlet weak var txtf_phone: UITextField!
    @IBOutlet weak var emerg_phone: UITextField!
    @IBOutlet weak var slider: UISlider!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerForKeyboardNotifications()
        // Do any additional setup after loading the view.
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard(_:)))
        self.view.addGestureRecognizer(tapGesture)
        
        
    }
    
    @objc func dismissKeyboard(_ sender: UITapGestureRecognizer){
        txtf_name.resignFirstResponder()
        txtf_usr.resignFirstResponder()
        txtf_email.resignFirstResponder()
        txtf_password.resignFirstResponder()
        txtf_password_rep.resignFirstResponder()
        txtf_phone.resignFirstResponder()
        emerg_phone.resignFirstResponder()
        
    }
    
    func registerForKeyboardNotifications() {
        NotificationCenter.default.addObserver(self, selector:#selector(keyboardWasShown(_:)),name: .UIKeyboardDidShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillBeHidden(_:)), name: .UIKeyboardWillHide, object: nil)
    }
    
    @objc func keyboardWasShown(_ notificiation: NSNotification) {
        guard let info = notificiation.userInfo,
            let keyboardFrameValue =
            info[UIKeyboardFrameBeginUserInfoKey] as? NSValue
            else { return }
        
        let keyboardFrame = keyboardFrameValue.cgRectValue
        let keyboardSize = keyboardFrame.size
        
        let contentInsets = UIEdgeInsetsMake(0.0, 0.0, keyboardSize.height, 0.0)
        scrollView.contentInset = contentInsets
        scrollView.scrollIndicatorInsets = contentInsets
    }
    
    @objc func keyboardWillBeHidden(_ notification: NSNotification){
        let contentInsets = UIEdgeInsets.zero
        scrollView.contentInset = contentInsets
        scrollView.scrollIndicatorInsets = contentInsets
    }
    

    
    @IBAction func buttonSignUp(_ sender: UIButton) {
        var role = false
        if (slider.value > 0.5){
            role = true
        }
        else{
            role = false
        }
        
        let newUser = User.init(username: txtf_usr.text!, password: txtf_password.text!, name: txtf_name.text!, phone: txtf_phone.text!, email: txtf_email.text!, isChap: role)
        print (newUser.isChap)
        
        // saveToFile(usr: newUser)
        
    }
    
    /*func saveToFile(usr: User){
     let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
     let archiveURL = documentsDirectory.appendingPathComponent("credentials").appendingPathExtension("plist")
     
     let propertyListEnc = PropertyListEncoder()
     let encodedUser = try? propertyListEnc.encode(usr)
     
     print(encodedUser)
     try? encodedUser?.write(to: archiveURL, options: .noFileProtection)
     }*/
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

