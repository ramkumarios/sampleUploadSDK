//
//  LoginViewModel.swift
//  NewFramwrk6Mar
//
//  Created by TVPC000013 on 06/03/23.
//

import Foundation
import SwiftyJSON

public class LoginViewModel{
    public init(model: LoginDataModel? = nil){
        if let Loginmodel = model{
            loginData = Loginmodel
        }
    }
    var loginData : LoginDataModel!
}
extension LoginViewModel {
    func loginApiCall(parameter: [String: String], completion: @escaping (Result<LoginDataModel, Error> ) -> Void) {
        
        Service.shared.post(urlString: "https://identity.enol.ai/login" , param: parameter) { [weak self] result in
            guard let self = self else {return}
            switch result {
            case .failure(let error):
                print ("failure", error)
            case .success(let dta) :
                let rootclass = LoginDataModel.init(fromJson: JSON(dta))
                self.loginData = rootclass
                if let responseData = self.loginData{
                    completion(.success(responseData))
                }
            }
        }
    }
}

