//
//  FourTwoNine.swift
//  ShabbatShalom
//
//  Created by Jerry Ren on 4/29/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import UIKit
import Foundation


class ITerGer {
    
    static let shared = ITerGer()
    private init() {}
    
    func APICaller(using urlString: String, completion: @escaping (Data?, Error?) -> Void)
    {
        guard let url = URL(string: urlString) else {
            completion(nil, NetworkError.NotAValidURL)
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            completion(data, error)
        }.resume()
    }
}

enum NetworkError: Error {
    case NotAValidURL
}
  
