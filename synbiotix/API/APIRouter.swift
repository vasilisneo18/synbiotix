//
//  APIRouter.swift
//  synbiotix
//
//  Created by Vasilis Neophytou on 21/10/2023.
//

import Foundation
import Alamofire

enum APIRouter: URLRequestConvertible {
    
    case getFillings
    case getFrostings
    
    var baseURL: String? {
        switch self {
            case .getFillings,
                 .getFrostings:
                return "https://dev.synbiotix.com"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getFillings,
             .getFrostings:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .getFillings:
            return "/fill.json"
        case .getFrostings:
            return "/frost.json"
        }
    }
    
    var encoding: ParameterEncoding {
        return URLEncoding.queryString
    }
    
    var headers: [String : String] {
        var headers = [
            "Content-Type": "application/json"
        ]
    
        return headers
    }
    
    public func asURLRequest() throws -> URLRequest {
        
        let url: URL = try (baseURL ?? "").asURL()
        
        var request = URLRequest(url: url.appendingPathComponent(path))
        request.httpMethod = method.rawValue
        request.allHTTPHeaderFields = headers
        var parameters: Parameters?
        parameters = [:]
        return try encoding.encode(request, with: parameters)
    }
    
    
    
}
