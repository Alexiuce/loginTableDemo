//
//  LoginController.swift
//  ISystemApp
//
//  Created by alexiuce  on 2017/6/8.
//  Copyright © 2017年 com.joinf.tls. All rights reserved.
//

import UIKit
import SwiftLCS


enum AuthCellType : String {
    case NameTextField
    case PasswordTextField
    case RegistCodeTextField
    case LoginButton
    case RegistButton
    case ForgetButton
    case ResetButton
}

typealias AuthViewStatus = Array<AuthCellType>

class LoginController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    let loginStates = [AuthCellType.NameTextField,AuthCellType.PasswordTextField,AuthCellType.LoginButton,AuthCellType.RegistButton,AuthCellType.ForgetButton]
    let registStates = [AuthCellType.NameTextField,AuthCellType.PasswordTextField,AuthCellType.RegistCodeTextField,AuthCellType.RegistButton,AuthCellType.ResetButton]
    var currentStates : AuthViewStatus?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentStates = loginStates
        setupUI()
    }
}
extension LoginController{
// MARK:   setupUI
    fileprivate func setupUI(){
        let nibCell = UINib(nibName: "LoginItemCell", bundle: nil)
        tableView.register(nibCell, forCellReuseIdentifier: "loginItemCell")
        let buttonCell = UINib(nibName: "ButtonCell", bundle: nil)
        tableView.register(buttonCell, forCellReuseIdentifier: "ButtonCell")
        tableView.contentInset = UIEdgeInsetsMake(82, 0, 0, 0)
        let banner = BannerView.banner()
        banner.frame = CGRect(x: 0, y: 0, width: tableView.bounds.size.width, height: 100)
        tableView.tableHeaderView = banner
    }
}
extension LoginController : UITableViewDataSource{
// MARK: DatsSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (currentStates?.count)!;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellStates = currentStates![indexPath.row]
        let reusedKey = (cellStates == .NameTextField || cellStates == .PasswordTextField || cellStates == .RegistCodeTextField) ? "loginItemCell" :"ButtonCell"
        let itemCell = tableView.dequeueReusableCell(withIdentifier:reusedKey, for: indexPath)
        if reusedKey == "loginItemCell" {
            (itemCell as! LoginItemCell).delegate = self
            (itemCell as! LoginItemCell).cellType = currentStates?[indexPath.row]
        }else{
            (itemCell as! ButtonCell).delegate = self
            (itemCell as! ButtonCell).cellType = currentStates?[indexPath.row]
        }
        return itemCell
    }
}

extension LoginController : LoginCellProcotol{
    func cellDidFinishedTextInput(input: String) {
        
    }
    func cellDidClickedButton(buttonType: AuthCellType) {
        switch buttonType {
        case .ForgetButton:
            XCPrint("forget clicked")
        case .LoginButton:
            XCPrint("login clicked")
        case .RegistButton:
            XCPrint("regist clicked")
            if currentStates! != registStates {
                transitionToViewStatus(registStates)
                break
            }
        case .ResetButton:
            XCPrint("reset clicked")
            transitionToViewStatus(loginStates)
        default:
            break
        }
    }
}



extension LoginController{
// MARK: custom method
    fileprivate func transitionToViewStatus(_ newState : AuthViewStatus){
        let diff = currentStates?.diff(newState)
        tableView.beginUpdates()
        if let indexArray = diff?.removedIndexes {
            for index in indexArray.reversed() {
                currentStates?.remove(at: index)
                let removePath = IndexPath(row: index, section: 0)
                tableView.deleteRows(at: [removePath], with: .top)
            }
        }
        if let addIndexArray = diff?.addedIndexes {
            for addIndex in addIndexArray {
                currentStates?.insert(newState[addIndex], at: addIndex)
                let addPath = IndexPath(row: addIndex, section: 0)
                tableView.insertRows(at: [addPath], with: .top)
            }
        }
        tableView.endUpdates()
    }
    
}
