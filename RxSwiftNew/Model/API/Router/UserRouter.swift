//
//  UserRouter.swift
//  Model
//
//  Created by Abhishek Thapliyal on 5/21/18.
//  Copyright © 2018 Nickelfox. All rights reserved.
//

import Foundation
import FoxAPIKit

public enum UserRouter: BaseRouter {
 
    case login(username: String, password: String)
    
    public var method: HTTPMethod {
        switch self {
        case .login:
            return .post
        }
    }
    
    public var path: String {
        switch self {
        case .login:
            return "/wp-json/jwt-auth/v1/token"
        }
    }
    
    public var params: [String: Any] {
        var params: [String: Any] = [:]
        switch self {
        case .login(let username, let password):
            params = [
                "username": username,
                "password": password
            ]
        }
        return params
    }
    
    public var headers: [String: String] {
        return ["Content-Type": "application/json"]
    }
    
    public var keypathToMap: String? {
        return nil
    }
}
