//
//  Multimedia.swift
//  SingleAPICalll
//
//  Created by Tushar on 01/05/19.
//  Copyright © 2019 Tushar. All rights reserved.
//

import Foundation

struct Multimedia: Decodable {
    
    let url: String?
    let height: Int?
    let widht: Int?

    enum CodingKeys: String, CodingKey {
        case url = "url"
        case height = "height"
        case width = "width"
    }

    init(from decoder: Decoder) throws {
        let value = try decoder.container(keyedBy: CodingKeys.self)
        url = try value.decodeIfPresent(String.self, forKey: .url)
        height = try value.decodeIfPresent(Int.self, forKey: .height)
        widht = try value.decodeIfPresent(Int.self, forKey: .width)
    }
}
