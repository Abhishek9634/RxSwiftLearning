//
//  Source.swift
//  Model
//
//  Created by Abhishek Thapliyal on 19/04/19.
//  Copyright © 2019 Abhishek Thapliyal. All rights reserved.
//

import Foundation
import JSONParsing

public struct Source: JSONParseable {
    
    public var id: String
    public var name: String
    public var desc: String
    public var url: String
    public var category: String
    public var language: String
    public var country: String
    
    public static func parse(_ json: JSON) throws -> Source {
        return try Source(id: json["id"]^,
                          name: json["name"]^,
                          desc: json["description"]^,
                          url: json["url"]^,
                          category: json["category"]^,
                          language: json["language"]^,
                          country: json["country"]^)
    }
    
}
