//
//  LoginModel.swift
//  NewFramwrk6Mar
//
//  Created by TVPC000013 on 06/03/23.
//

import Foundation
import SwiftyJSON

public class LoginDataModel{
    
    var companyId : Int!
    var email : String!
    var name : String!
    var status : String!
    var token : String!
    var userId : Int!
    
    init(fromJson json: JSON!){
        if json == nil{
            return
        }
        companyId = json["company_id"].intValue
        email = json["email"].stringValue
        name = json["name"].stringValue
        status = json["status"].stringValue
        token = json["token"].stringValue
        userId = json["user_id"].intValue
    }
    
}
