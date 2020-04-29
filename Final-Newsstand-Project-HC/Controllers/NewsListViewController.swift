//
//  NewsListViewController.swift
//  Final-Newsstand-Project-HC
//
//  Created by Henry Calderon on 4/26/20.
//  Copyright © 2020 Henry Calderon. All rights reserved.
//

import UIKit

class NewsListViewController: UIViewController {
    
    var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    let dummyNews: [News] = [
        News(title: "Fire Started", content: "Fire at 11 am in this town caused by dog"),
        News(title: "Boy Dies", content: "Boy fakes death to get out of school"),
        News(title: "Scandal", content: "Donald Trump cheats on wife, no one is suprised. As people continue to comment we will update. in other news, lets look at baseball. What a bad time to be a dodgers fan, Thats all for sports. Dont be lazy this weekend.")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.title = "News"
        setTable()
        // Do any additional setup after loading the view.
    }
    
    func setTable(){
        self.view.addSubview(tableView)
        tableView.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.identifier)
        tableView.dataSource = self
        tableView.delegate = self
        self.view.backgroundColor = .white
        
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
        return self.dummyNews.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identifier, for: indexPath) as! TableViewCell
        let news = dummyNews[indexPath.row]
        cell.data = news
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let news = dummyNews[indexPath.row]
        let vc = NewsContentsViewController()
        vc.newsTitle = news.title
        vc.news = news.content
        self.navigationController?.pushViewController(vc, animated: true)
        print("News selected at \(indexPath.row)")
    }
    
    
}
