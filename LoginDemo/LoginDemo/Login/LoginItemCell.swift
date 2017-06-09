//
//  LoginItemCell.swift
//  ISystemApp
//
//  Created by alexiuce  on 2017/6/8.
//  Copyright © 2017年 com.joinf.tls. All rights reserved.
//

import UIKit

class LoginItemCell: UITableViewCell {
    
    weak var delegate : LoginCellProcotol?
    
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var textField: UITextField!
    
    var cellType : AuthCellType? = nil{
        willSet{
            if let newType = newValue {
                switch newType {
                case .NameTextField:
                    icon.image = UIImage(named: "")
                    textField.placeholder = "name"
                case .PasswordTextField:
                    icon.image = UIImage(named: "")
                    textField.placeholder = "password"
                case .RegistCodeTextField:
                    icon.image = UIImage(named: "")
                    textField.placeholder = "registr"
                default:
                    icon.image = nil
                    textField.placeholder = nil
                }
            }
        }
    }
    @IBAction func finishedEditing(_ sender: UITextField) {
        XCPrint(sender.text)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}

extension LoginItemCell{
    
}
