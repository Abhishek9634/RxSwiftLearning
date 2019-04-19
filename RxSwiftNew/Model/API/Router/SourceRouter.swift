//
//  SourceRouter.swift
//  Model
//
//  Created by Abhishek Thapliyal on 5/21/18.
//  Copyright © 2018 Nickelfox. All rights reserved.
//

import Foundation
import FoxAPIKit

public enum SourceRouter: BaseRouter {
 
    case fetchSources
    
    public var method: HTTPMethod {
        switch self {
        case .fetchSources:
            return .get
        }
    }
    
    public var path: String {
        switch self {
        case .fetchSources:
            return "/sources"
        }
    }
    
    public var params: [String: Any] {
        var params: [String: Any] = [:]
        switch self {
        case .fetchSources:
            params = [
                "apiKey": APIConfig.APICredentials.APIKey
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
