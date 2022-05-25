//
//  BaseViewModel.swift
//  UIDesign
//
//  Created by Vraj Shah on 25/05/22.
//

import UIKit

/// Class for API calling
class ApiRequest {
    
    //MARK: - static functions
    static func request<T: Codable>(requestUrl: String, method: String, header: [String: String], parameters: Data, responseDataType: T.Type, completion: @escaping (Result<T, ApiError>) -> Void) {
        guard let url = URL(string: requestUrl) else { return }
    
        var request = URLRequest(url: url)
        request.httpMethod = method
        header.forEach { key, value in
            request.setValue(value, forHTTPHeaderField: key)
        }
        request.httpBody = parameters
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let errorResponse = error {
                completion(.failure(ApiError.error(error: errorResponse.localizedDescription)))
                return
            }
            guard let data = data else { return }
            guard let response = response as? HTTPURLResponse, (200 ..< 299) ~= response.statusCode else {
                guard let responseData = try? JSONDecoder().decode(ErrorResponse.self, from: data) else { return }
                completion(.failure(ApiError.error(error: responseData.error)))
                return
            }
            guard let responseData = try? JSONDecoder().decode(responseDataType.self, from: data) else { return }
            completion(.success(responseData))
        }.resume()
    }
    
}//End of class
