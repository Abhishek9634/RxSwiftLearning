//
//  Source+API.swift
//  Model
//
//  Created by Abhishek Thapliyal on 19/04/19.
//  Copyright © 2019 Abhishek Thapliyal. All rights reserved.
//

import Foundation
import FoxAPIKit

public extension Source {
    
    static func fetchSource(completion: @escaping APICompletion<ListResponse<Source>>) {
        let router = SourceRouter.fetchSources
        RxSwiftAPIClient.shared.request(router, completion: completion)
    }
    
}
