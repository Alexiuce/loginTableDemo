//
//  ButtonCell.swift
//  InternalSystem
//
//  Created by alexiuce  on 2017/6/9.
//  Copyright © 2017年 com.joinf.tls. All rights reserved.
//

import UIKit

class ButtonCell: UITableViewCell {
    
    weak var delegate: LoginCellProcotol?

    @IBOutlet weak var button: UIButton!
    
    var cellType : AuthCellType? = nil{
        willSet{
            if let newType = newValue {
                switch newType {
                case .ForgetButton:
                    button.setTitle("forget", for: .normal)
                case .LoginButton:
                    button.setTitle("login", for: .normal)
                case .RegistButton:
                    button.setTitle("regist", for: .normal)
                case .ResetButton:
                    button.setTitle("reset", for: .normal)
                default:
                    button.setTitle(nil, for: .normal)
                }
            }
        }
   
    }
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func clickButton(_ sender: Any) {
        delegate?.cellDidClickedButton(buttonType: cellType!)
    }

}
