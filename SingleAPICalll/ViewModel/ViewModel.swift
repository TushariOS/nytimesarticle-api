//
//  ViewModel.swift
//  SingleAPICalll
//
//  Created by Tushar on 27/04/19.
//  Copyright © 2019 Tushar. All rights reserved.
//

import Foundation

class ViewModel {
    
    func storyAPICall(compleationHandler:@escaping (Stories?, Error?) -> Void) {
        let urlString = "https://api.nytimes.com/svc/topstories/v2/science.json?api-key=KJtGH90YVLMJVFRdZgJJXLE2y9xNpwTj"
        guard let url = URL(string: urlString) else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                compleationHandler(nil, error)
            }

            guard let data = data else {  return }
            let deocder = JSONDecoder()
            do {
                let storyData = try deocder.decode(Stories.self, from: data)
                compleationHandler(storyData, nil)
            } catch {
                compleationHandler(nil, nil)
            }
            }.resume()
    }
}
