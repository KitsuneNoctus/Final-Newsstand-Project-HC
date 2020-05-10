//
//  News.swift
//  Final-Newsstand-Project-HC
//
//  Created by Henry Calderon on 4/26/20.
//  Copyright © 2020 Henry Calderon. All rights reserved.
//

import Foundation
import UIKit

//MARK: News
struct News: Decodable{
    var title: String?
    var url: String?
    var urlToImage: String?
    var content: String?
}

struct NewsList: Decodable {
   var articles: [News]
}

