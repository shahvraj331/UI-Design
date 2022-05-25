//
//  SignUpViewModel.swift
//  UIDesign
//
//  Created by Vraj Shah on 25/05/22.
//

import UIKit

class SignUpViewModel {
    
    //MARK: - Variables
    var signUpCallBack: signUpCallBack?
    var errorCallBack: stringCallBack?
    
    //MARK: - static functions
    func signUpUser(headers: [String: String], parameters: Data) {
        ApiRequest.request(requestUrl: "https://reqres.in/api/register", method: "POST", header: headers, parameters: parameters, responseDataType: SignUpResponse.self) { result in
            switch result {
            case .success(let data):
                self.signUpCallBack?(data)
            case .failure(.error(let error)):
                self.errorCallBack?(error)
            }
        }
    }
    
}//End of class
