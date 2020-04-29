//
//  News.swift
//  Final-Newsstand-Project-HC
//
//  Created by Henry Calderon on 4/26/20.
//  Copyright © 2020 Henry Calderon. All rights reserved.
//

import Foundation
import UIKit

struct News {
    var title: String
    var content: String
}

struct NewsList: Decodable {
   var news: [News]
}

extension News: Decodable{
    enum NewsKeys: String, CodingKey{
        case title
        case body
    }
    
//    init(from decoder: Decoder) throws {
//
//    }
}
