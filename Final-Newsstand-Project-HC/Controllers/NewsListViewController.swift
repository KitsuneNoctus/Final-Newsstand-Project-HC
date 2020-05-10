//
//  NewsListViewController.swift
//  Final-Newsstand-Project-HC
//
//  Created by Henry Calderon on 4/26/20.
//  Copyright © 2020 Henry Calderon. All rights reserved.
//

import UIKit

class NewsListViewController: UIViewController {
    
    var category: String = "general"
    
    var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    var newsArts: [News] = [] {
       didSet {
           tableView.reloadData()
       }
    }
    
    var networkManager = NetworkManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.title = "News"
        setTable()
        updateFeed()
    }
    
    func updateFeed(){
        networkManager.getNews(category){ result in
            switch result {
            case let .success(news):
              self.newsArts = news
            case let .failure(error):
              print(error)
            }
        }
    }
    
    func setTable(){
        self.view.addSubview(tableView)
        tableView.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.identifier)
        tableView.dataSource = self
        tableView.delegate = self
        self.view.backgroundColor = .white
        tableView.rowHeight = 100
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        ])
    }
    

}

extension NewsListViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.newsArts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identifier, for: indexPath) as! TableViewCell
        let news = newsArts[indexPath.row]
        cell.data = news
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let news = newsArts[indexPath.row]
        let vc = NewsContentsViewController()
        //Assigning Title
        vc.newsTitle = news.title!
        //Assigning Content
        guard let newsContent = news.content else{
            print("No content")
            return
        }
        vc.news = newsContent
        //Assigning URL news
        guard let newsURL = news.url else {
            print("No URL found")
            return
        }
        vc.theNews = newsURL
        //
        self.navigationController?.pushViewController(vc, animated: true)
        print("News selected at \(indexPath.row)")
    }
    
    
}
