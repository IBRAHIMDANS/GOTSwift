//
//  House.swift
//  GOTSwift
//
//  Created by ibrahima on 21/05/2019.
//  Copyright © 2019 Ibrahima DANSOKO. All rights reserved.
//

import Foundation

class House: Decodable {
    enum CodingKeys: String, CodingKey{
        case name
        case words
        case logoURL
    }
    
    var name: String
    var words: String
    var logoURL: String
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        self.words = try container.decode(String.self, forKey: .words)
        self.logoURL = try container.decodeIfPresent(String.self, forKey: .logoURL) ?? ""
    }
}
