//
//  ModelError.swift
//  Model
//
//  Created by Abhishek Thapliyal on 29/10/18.
//  Copyright © 2018 Nickelfox. All rights reserved.
//

import Foundation
import AnyErrorKit

public enum ModelError: AnyError {
    
    case userNotLoggedIn
    case custom(message: String)
    
    public var code: Int {
        switch self {
        case .userNotLoggedIn:
            return 401
        case .custom:
            return 0
        }
    }
    
    public var domain: String { return "Model Error" }
    
    public var message: String {
        switch self {
        case .userNotLoggedIn:
            return "User not loggedIn"
        case .custom(let message):
            return message
        }
    }
}
