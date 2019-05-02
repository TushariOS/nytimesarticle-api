//
//  Stories.swift
//  SingleAPICalll
//
//  Created by Tushar on 01/05/19.
//  Copyright © 2019 Tushar. All rights reserved.
//

import Foundation

struct Stories: Decodable {
    let status: String?
    let section: String?
    let num_result: Int?
    let results: [Results]?
    
    enum CodingKeys: String, CodingKey {
        case status = "status"
        case section = "section"
        case num_result = "num_result"
        case results = "results"
    }
    
    init(from decoder: Decoder) throws {
        let value = try decoder.container(keyedBy: CodingKeys.self)
        status = try value.decodeIfPresent(String.self, forKey: .status)
        section = try value.decodeIfPresent(String.self, forKey: .section)
        num_result = try value.decodeIfPresent(Int.self, forKey: .num_result)
        results = try value.decodeIfPresent([Results].self, forKey: .results)
    }
    
}
