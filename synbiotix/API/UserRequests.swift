//
//  DonutManager.swift
//  synbiotix
//
//  Created by Vasilis Neophytou on 21/10/2023.
//

import Foundation
import Alamofire

enum RequestError: Error, LocalizedError {
    case unknown
    case unauthorised
    
    var errorDescription: String? {
        switch self {
        case .unknown:
            return "Hey, this is an unknown error!"
        case .unauthorised:
            return "Access denied"
        }
    }
}

class UserRequests {
    
    static let sessionManager: Session = {
        let policy = RetryPolicy()
        let sessMan = Session(interceptor: policy)
        return sessMan
    }()
    
    static func getFrostings(completion: @escaping (Result<[Frosting], Error>) -> Void) {
        sessionManager.request(APIRouter.getFrostings)
            .validate()
            .responseDecodable(of: [Frosting].self, queue: .main, decoder: JSONDecoder()) { (response) in
                switch response.result {
                case .success(let frostings):
                    completion(.success(frostings))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
    
    static func getFillings(completion: @escaping (Result<[Filling], Error>) -> Void) {
        sessionManager.request(APIRouter.getFillings)
            .validate()
            .responseDecodable(of: [Filling].self, queue: .main, decoder: JSONDecoder()) { (response) in
                switch response.result {
                case .success(let fillings):
                    completion(.success(fillings))
                case .failure(let error):
                    let requestError = getRequestError(error: error)
                    completion(.failure(requestError))
                }
            }
    }

    static func getRequestError(error: AFError) -> Error {
        if error.responseCode == 401 {
            return RequestError.unauthorised
        } else {
            return RequestError.unknown
        }
    }
    
}
