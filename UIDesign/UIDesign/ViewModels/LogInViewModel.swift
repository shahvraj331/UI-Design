//
//  LogInViewModel.swift
//  UIDesign
//
//  Created by Vraj Shah on 25/05/22.
//

import UIKit

class LogInViewModel {
    
    //MARK: - Variables
    var logInResponse: logInCallBack?
    var errorCallBack: stringCallBack?
    
    //MARK: - static functions
    func logInUser(headers: [String: String], parameters: Data) {
        ApiRequest.request(requestUrl: "https://reqres.in/api/login", method: "POST", header: headers, parameters: parameters, responseDataType: LogInResponse.self) { result in
            switch result {
            case .success(let data):
                self.logInResponse?(data)
            case .failure(.error(let error)):
                self.errorCallBack?(error)
            }
        }
    }
    
}//End of class
