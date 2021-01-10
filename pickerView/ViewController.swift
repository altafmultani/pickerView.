//
//  ViewController.swift
//  pickerView
//
//  Created by helpmac on 15/12/20.
//  Copyright © 2020 TechnoTouch Infotech. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate,UIPickerViewDelegate,UIPickerViewDataSource {

    @IBOutlet weak var categoryTextField: UITextField!
    
        var selectedTime = Date()
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    
    public let categoryArray = ["Shopping","Sports","Party","Event","Office","Other"]
      
      var myPickerView : UIPickerView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
         categoryTextField.delegate = self
        
    }
    

        //MARK : ========  Picker Delegate ========
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return categoryArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return categoryArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.categoryTextField.text = categoryArray[row]
        
       // self.addImage.image = UIImage(named: categoryArray[row])
        
    }
    @objc func doneClick() {
          categoryTextField.resignFirstResponder()
          
          
      }
      @objc func cancelClick() {
          categoryTextField.resignFirstResponder()
      }
    func pickUp(_ textField : UITextField){
           
           // UIPickerView
           self.myPickerView = UIPickerView(frame:CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 216))
           self.myPickerView.delegate = self
           self.myPickerView.dataSource = self
         //  self.myPickerView.backgroundColor = .white
           textField.inputView = self.myPickerView
           
           // ToolBar
           let toolBar = UIToolbar()
           toolBar.barStyle = .default
           toolBar.isTranslucent = true
           toolBar.tintColor = UIColor(red: 92/255, green: 216/255, blue: 255/255, alpha: 1)
           toolBar.sizeToFit()
           
           // Adding Button ToolBar
           let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(self.doneClick))
           let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
           let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(self.cancelClick))
           toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
           toolBar.isUserInteractionEnabled = true
           textField.inputAccessoryView = toolBar
           
           
       }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.pickUp(self.categoryTextField)
    }
    

}

