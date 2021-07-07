//
//  NewzModel.swift
//  ShabbatShalom
//
//  Created by Jerry Ren on 5/7/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import Foundation

struct Newzfeed: Codable {
    
    var status: String?
    var totalResults: Int?
    var articles: [APieceOfNewz]?
    
}

struct APieceOfNewz: Codable {
    var author: String?
    var title: String?
    var description: String?
    var url: String?
    var urlToImage: String?
    var publishedAt: String?
    var content: String?
}
