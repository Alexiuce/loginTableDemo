//
//  LoginCellProcotol.swift
//  InternalSystem
//
//  Created by alexiuce  on 2017/6/9.
//  Copyright © 2017年 com.joinf.tls. All rights reserved.
//

import Foundation
import UIKit


protocol LoginCellProcotol : class {
    func cellDidClickedButton(buttonType:AuthCellType)
    func cellDidFinishedTextInput(input:String)
}
