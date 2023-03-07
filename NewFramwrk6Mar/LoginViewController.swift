//
//  LoginViewController.swift
//  NewFramwrk6Mar
//
//  Created by TVPC000013 on 06/03/23.
//

import UIKit

public class LoginViewController: UIViewController {
    
    @IBOutlet weak var signLabel: UILabel!
    @IBOutlet weak var signInTextField: UITextField!
    
    var loginVM = LoginViewModel()

    public override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    public init() {
        super.init(nibName: "LoginViewController", bundle: Bundle(for: LoginViewController.self))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func loginAPICall(){
        let param = ["username":"ramios","password":"password"]
        loginVM.loginApiCall(parameter: param){[weak self] breaches in
            DispatchQueue.main.async {
                let cellData = self?.loginVM.loginData
            }
        }
    }
    
    @IBAction func signInButton_Tapped(_ sender: UIButton){
        self.loginAPICall()
    }

}
