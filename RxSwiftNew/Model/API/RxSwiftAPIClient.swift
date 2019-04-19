//
//  RxSwiftAPIClient.swift
//  TemplateProject
//
//  Created by Ravindra Soni on 06/01/17.
//  Copyright © 2017 Nickelfox. All rights reserved.
//

import Foundation
import FoxAPIKit

class RxSwiftAPIClient: APIClient<AuthHeaders, ErrorResponse> {

	static let shared = RxSwiftAPIClient()
	
    override init() {
        super.init()
        enableLogs = true
    }
    
    override func authenticationHeaders(response: HTTPURLResponse) -> AuthHeaders? {
        return self.authHeaders
    }
	
}
