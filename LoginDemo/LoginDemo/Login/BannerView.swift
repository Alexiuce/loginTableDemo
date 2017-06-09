//
//  BannerView.swift
//  ISystemApp
//
//  Created by alexiuce  on 2017/6/8.
//  Copyright © 2017年 com.joinf.tls. All rights reserved.
//

import UIKit

class BannerView: UIView {
    class func banner() -> BannerView{
       let array =  Bundle.main.loadNibNamed("Banner", owner: nil, options: nil)
       return array?.first as! BannerView
        
    }

}
