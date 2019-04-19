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
    
    var id: String
    var name: String
    var desc: String
    var url: String
    var category: String
    var language: String
    var country: String
    
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
