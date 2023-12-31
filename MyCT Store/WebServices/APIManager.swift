//
//  APIManager.swift
//  MyCT Store
//
//  Created by R86 on 31/03/23.
//

import Foundation
import Alamofire

class APIManager {
    
    func request(with url: String,
                 method: HTTPMethod = .get,
                 header: HTTPHeaders? = nil,
                 parameter: Parameters? = nil,
                 completion: @escaping (Result<Data, APIError>) -> Void) {
        
        guard let url = URL(string: url) else {
            return  completion(.failure(.urlDoseNotFound))
        }
        
        AF.request(url, method: method, parameters: parameter, encoding: URLEncoding.default, headers: header).responseData { response in
            
            guard let statusCode = response.response?.statusCode,
                  (200...299).contains(statusCode) else {
                
                completion(.failure(.invalidResponse))
                return
            }
            guard let data = response.data else {
                completion(.failure(.dataNotFound))
                return
            }
            completion(.success(data))
        }
    }
}
//enum MwthodType {
//    case get
//    case post
//    case put
//    case delete
//
//    var httpMethod: HTTPMethod {
//        switch self {
//        case .get: return .get
//        case .post: return .post
//        case .put: return .put
//        case .delete: return .delete
//        }
//    }
//}

enum APIError: Error {
    case urlDoseNotFound
    case invalidResponse
    case dataNotFound
}

