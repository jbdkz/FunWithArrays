//
//  ViewController.swift
//  FunWithArrays
//
//  Created by John Diczhazy on 10/5/17.
//  Copyright © 2017 John Diczhazy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Declare Class Variable to hold array
    var arrayStr = [String]()
    
    @IBOutlet weak var inputTxtFld: UITextField!
    
    @IBOutlet weak var statusLbl: UILabel!
    
    @IBOutlet weak var outputLbl: UILabel!
    
    @IBAction func submitBtn(_ sender: Any) {
        //Declare function variables
        var inputStr: String = ""
        var nowhitespaceStr: String = ""
        var outputStr: String = ""
        
        inputStr = inputTxtFld.text!
        
        //Remove spaces from string
        nowhitespaceStr = inputStr.replacingOccurrences(of: " ", with: "")
        //Use comma as delimiter for array elements
        arrayStr = nowhitespaceStr.components(separatedBy: ",")
        
        statusLbl.text = "The array consists of the following Strings:"
        
        //Create new string with appended elements with space between them
        for str in arrayStr {
            outputStr.append(str + " ")
        }
        //Display array
        outputLbl.text = outputStr
    }
    
    @IBAction func countBtn(_ sender: Any) {
        //Display number of elements in array
        statusLbl.text = "The array consists of " + String(arrayStr.count) + " elements."
    }
    
    @IBAction func sortBtn(_ sender: Any) {
        //Declare function variable
        var outputStr: String = ""
        
        statusLbl.text = "Sorted"
        
        //Call sort function
        arrayStr.sort()
        //Create new string with appended elements with space between them
        for str in arrayStr {
            outputStr.append(str + " ")
        }
        //Display array
        outputLbl.text = outputStr
    }
    
    @IBAction func insertAtBtn(_ sender: Any) {
        //Declare function variables
        var paramStr = [String]()
        var inputStr: String = ""
        var nowhitespaceStr: String = ""
        var outputStr: String = ""
        var newelemStr: String = ""
        var indexInt: Int = 0
        var msg: String = ""
        
        inputStr = inputTxtFld.text!
        //Call validate function in Validate class to check input
        msg = Validate.validate(input: inputStr, mode: "insertchange", count: arrayStr.count )
        //If validate function returns "Validated" proceed.
        if msg == "Validated" {
           //Remove spaces from string
           nowhitespaceStr = inputStr.replacingOccurrences(of: " ", with: "")
           //Use comma as delimiter for array elements
           paramStr = nowhitespaceStr.components(separatedBy: ",")
           newelemStr = paramStr[1]
           indexInt = Int(paramStr[0])!
           //Insert new element at specified index
           self.arrayStr.insert(newelemStr, at: indexInt)
           self.statusLbl.text = "The array consists of the following Strings:"
           //Create new string with appended elements with space between them
           for str in self.arrayStr {
             outputStr.append(str + " ")
                }
             self.outputLbl.text = outputStr
        }else{
            alert(input: msg)
        }
    }
    
    @IBAction func changeAtBtn(_ sender: Any) {
        //Declare function variables
        var paramStr = [String]()
        var inputStr: String = ""
        var nowhitespaceStr: String = ""
        var outputStr: String = ""
        var newelemStr: String = ""
        var indexInt: Int = 0
        var msg: String = ""
       
        inputStr = inputTxtFld.text!
        //Call validate function in Validate class to check input
        msg = Validate.validate(input: inputStr, mode: "insertchange", count: arrayStr.count )
        //If validate function returns "Validated" proceed.
        if msg == "Validated" {
           //Remove spaces from string
           nowhitespaceStr = inputStr.replacingOccurrences(of: " ", with: "")
           //Use comma as delimiter for array elements
           paramStr = nowhitespaceStr.components(separatedBy: ",")
           newelemStr = paramStr[1]
           indexInt = Int(paramStr[0])!
           //Change element at specified index
           self.arrayStr[indexInt] = newelemStr
           self.statusLbl.text = "The array consists of the following Strings:"
            //Create new string with appended elements with space between them
           for str in self.arrayStr {
                outputStr.append(str + " ")
                    }
                    //Display array
                self.outputLbl.text = outputStr
           }else{
                alert(input: msg)
           }
     }
    
    @IBAction func deleteAtBtn(_ sender: Any) {
        //Declare function variables
        var indexInt: Int = 0
        var indexStr: String = ""
        var outputStr: String = ""
        var msg: String = ""
        
        indexStr = inputTxtFld.text!
        
        msg = Validate.validate(input: indexStr, mode: "delete", count: arrayStr.count )
        //If validate function returns "Validated" proceed.
        if msg == "Validated" {
            indexInt = Int(indexStr)!
             //Delete element at specified index
             arrayStr.remove(at: indexInt)
             statusLbl.text = "The array consists of the following Strings:"
              //Create new string with appended elements with space between them
              for str in arrayStr {
              outputStr.append(str + " ")
               }
            //Display array
            outputLbl.text = outputStr
            }else{
                alert(input: msg)
          }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func alert (input: String){
        //Display alert with input string as the message
        let alertController = UIAlertController(title: "Alert!", message: input, preferredStyle: .alert)

        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(defaultAction)

        present(alertController, animated: true, completion: nil)
    }
}

