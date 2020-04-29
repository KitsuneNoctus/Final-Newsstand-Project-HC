//
//  NewsContentsViewController.swift
//  Final-Newsstand-Project-HC
//
//  Created by Henry Calderon on 4/26/20.
//  Copyright © 2020 Henry Calderon. All rights reserved.
//

import UIKit

class NewsContentsViewController: UIViewController {
    
    var newsTitle: String = "Title"
    var news: String = "The News"
    
    var newsContents: UITextView = {
        let text = UITextView()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.backgroundColor = .white
        text.textColor = .black
        text.textAlignment = .justified
        text.isEditable = false
        return text
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = newsTitle
        setup()
    }
    
    func setup(){
        self.view.addSubview(newsContents)
        NSLayoutConstraint.activate([
            newsContents.topAnchor.constraint(equalTo: self.view.topAnchor),
            newsContents.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            newsContents.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            newsContents.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        ])
        newsContents.text = news
    }

}
