//
//  NewsContentsViewController.swift
//  Final-Newsstand-Project-HC
//
//  Created by Henry Calderon on 4/26/20.
//  Copyright © 2020 Henry Calderon. All rights reserved.
//

import UIKit
import WebKit

class NewsContentsViewController: UIViewController, WKUIDelegate {
    
    var newsTitle: String = "Title"
    var news: String = "The News"
    var theNews: String = ""
    
    //MARK: Web View
    lazy var webView: WKWebView = {
        let webConfiguration = WKWebViewConfiguration()
        let webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        webView.translatesAutoresizingMaskIntoConstraints = false
        return webView
    }()
    
    var newsContents: UITextView = {
        let text = UITextView()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.backgroundColor = .white
        text.textColor = .black
        text.textAlignment = .justified
//        text.font = UIFont(name: "Ariel", size: 30)
        text.isEditable = false
        return text
    }()
    
    var newsImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        //TODO: Add so image adjusts properly to container
        return image
    }()
    
    //MARK: View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = newsTitle
//        print(theNews)
        setup()
        let myURL = URL(string:theNews)
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
    }
    
    func setup(){
        self.view.backgroundColor = .white
        self.view.addSubview(webView)
        NSLayoutConstraint.activate([
            webView.topAnchor.constraint(equalTo: self.view.topAnchor),
            webView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            webView.widthAnchor.constraint(equalTo: self.view.widthAnchor)
        ])
    }

}
