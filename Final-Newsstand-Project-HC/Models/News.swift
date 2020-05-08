//
//  News.swift
//  Final-Newsstand-Project-HC
//
//  Created by Henry Calderon on 4/26/20.
//  Copyright © 2020 Henry Calderon. All rights reserved.
//

import Foundation
import UIKit

struct ArticleList{
}

//MARK: News
struct News{
    var title: String
//    let urlToImage: String
    var content: String
}

struct NewsList: Decodable {
   var articles: [News]
}

extension News: Decodable{
    enum NewsKeys: String, CodingKey{
        case title
//        case urlToImage
        case content
    }
    
//    enum PreviewImageURLKeys: String, CodingKey {
//       // for all posts, we only want the 850px image
//       // Check out the
//       case imageURL = "850px"
//    }
    
    init(from decoder: Decoder) throws {
        let newsConatiner = try decoder.container(keyedBy: NewsKeys.self)
        title = try newsConatiner.decode(String.self, forKey: .title)
        content = try newsConatiner.decode(String.self, forKey: .content)
    }
}
