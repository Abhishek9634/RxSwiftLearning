//
//  APIConfig.swift
//  Model
//
//  Created by Abhishek Thapliyal on 5/21/18.
//  Copyright © 2018 Nickelfox. All rights reserved.
//

import Foundation

public struct APIConfig {
    
    struct KeyChainKey {
        static let AccessTokenKey = "AccessTokenKey"
    }
    
    struct APIUrl {
        static let Base = APIUrl.Development
        private static let Production = ""
        private static let Development = ""
    }
    
    struct Constants {
        static let bundleIdentifier = Bundle.main.bundleIdentifier!
    }
    
}

