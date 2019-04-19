//
//  DataModel.swift
//  TemplateProject
//
//  Created by Ravindra Soni on 05/01/17.
//  Copyright © 2017 Nickelfox. All rights reserved.
//

import Foundation
import FoxAPIKit
import JSONParsing

public let DefaultPerPage = 10
public let DefaultFilterPerPage = 30

public typealias APICompletion<T> = (APIResult<T>) -> Void

public class DataModel {
	
    public static let shared: DataModel = DataModel()
    private let userDefaults = UserDefaults.standard
    
    private init() { }
    
    public var accessToken: String? {
        get {
            return self.userDefaults.string(forKey: APIConfig.KeyChainKey.AccessTokenKey)
        } set {
            self.userDefaults.set(newValue, forKey: APIConfig.KeyChainKey.AccessTokenKey)
            self.userDefaults.synchronize()
        }
    }
    
    public func logout() {
        let bundleId = APIConfig.Constants.bundleIdentifier
        self.userDefaults.removePersistentDomain(forName: bundleId)
        self.userDefaults.synchronize()
    }
    
}
