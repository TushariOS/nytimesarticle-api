//
//  Results.swift
//  SingleAPICalll
//
//  Created by Tushar on 01/05/19.
//  Copyright © 2019 Tushar. All rights reserved.
//

import Foundation

struct Results: Decodable {
    
    let section: String?
    let title: String?
    let abstract: String?
    let url: String?
    let multimedia: [Multimedia]?

    enum CodingKeys: String, CodingKey {
        case section = "section"
        case title = "title"
        case abstract = "abstract"
        case url = "url"
        case multimedia = "multimedia"
    }

    init(from decoder: Decoder) throws {
        let value = try decoder.container(keyedBy: CodingKeys.self)
        section = try value.decodeIfPresent(String.self, forKey: .section)
        title = try value.decodeIfPresent(String.self, forKey: .title)
        abstract = try value.decodeIfPresent(String.self, forKey: .abstract)
        url = try value.decodeIfPresent(String.self, forKey: .url)
        multimedia = try value.decodeIfPresent([Multimedia].self, forKey: .multimedia)
    }
}
