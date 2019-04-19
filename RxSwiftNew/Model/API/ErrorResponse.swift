//
//  ErrorResponse.swift
//  TemplateProject
//
//  Created by Ravindra Soni on 05/01/17.
//  Copyright © 2017 Nickelfox. All rights reserved.
//

import Foundation
import FoxAPIKit
import JSONParsing

private let errorKey = "error"

public struct ErrorResponse: ErrorResponseProtocol {
    
    public var code: Int
    public var message: String
    public let messages: [String]
    public var domain: String { return "" }
    
	public static func parse(_ json: JSON, code: Int) throws -> ErrorResponse {
        
        if 200...299 ~= code {
            throw NSError(domain: "", code: code, userInfo: nil)
        }
        
        return ErrorResponse(code: code, message: json["message"]^!,
                             messages: [json["message"]^!])
	}
	
	public var compiledErrorMessage: String {
		return self.messages.joined(separator: ",")
	}
}
