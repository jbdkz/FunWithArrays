//
//  Validate.swift
//  FunWithArrays
//
//  Created by John Diczhazy on 10/20/17.
//  Copyright © 2017 John Diczhazy. All rights reserved.
//

import UIKit

class Validate:UIViewController{
    
    class func validate (input: String, mode: String, count: Int) -> String{
        //Declare Class Variables
        var message: String = ""
        var paramStr = [String]()
        var nowhitespaceStr: String = ""
        let charset = CharacterSet(charactersIn: ",")
        
        //Check if mode = "insertchange"
        if mode == "insertchange" {
            //Check if Index/Value is blank
            if input != ""{
                //Check if Index/Value is separated with a comma
                if input.rangeOfCharacter(from: charset) != nil {
                  nowhitespaceStr = input.replacingOccurrences(of: " ", with: "")
                  paramStr = nowhitespaceStr.components(separatedBy: ",")
                    //Check if Index is blank
                    if paramStr[0] != "" {
                        //Check if value is blank
                        if paramStr[1] != "" {
                            //Check if index is out of range
                            if  (Int(paramStr[0]))! < count {
                          message = "Validated"
                            } else {
                            message = "Index out of Range"
                        }
                      } else {
                        message = "Value cannot be blank"
                      }
                  } else {
                    message = "Index cannot be blank"
                  }
                } else {
                    message = "Index,Value must be separated by a comma"
                }
            } else {
                message = "Index/Value cannot be blank"
            }
        }
    
            //Check if mode = "delete"
            if mode == "delete" {
            //Input index must be an integer
            if (Int(input) != nil){
                //Input index must not exceed array count
                if (Int(input))! < count {
                    message = "Validated"
                }else{
                    message = "Invalid Index!"
                }
            }else{
                 message = "Index must be an Integer!"
            }
        }
     return message
  }
}
