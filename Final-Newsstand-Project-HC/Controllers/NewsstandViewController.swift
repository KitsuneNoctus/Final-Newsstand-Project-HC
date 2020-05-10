//
//  NewsstandViewController.swift
//  Final-Newsstand-Project-HC
//
//  Created by Henry Calderon on 4/26/20.
//  Copyright © 2020 Henry Calderon. All rights reserved.
//

import UIKit

class NewsstandViewController: UIViewController {
    
    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: CollectionViewCell.identifier)
        collectionView.collectionViewLayout =  CustomFlowLayout()
        return collectionView
    }()

    let categories: [Category] = [
        Category(title: "business"),
        Category(title: "entertainment"),
        Category(title: "general"),
        Category(title: "health"),
        Category(title: "science"),
        Category(title: "sports"),
        Category(title: "technology")
    ]
    
    override func loadView() {
        super.loadView()
        self.title = "Newsstand"
        self.view.backgroundColor = .white
        view.addSubview(collectionView)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

}

extension NewsstandViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.identifier, for: indexPath) as! CollectionViewCell
        let category = categories[indexPath.row]
        cell.cat = category
        cell.backgroundColor = .blue
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = NewsListViewController()
        vc.category = categories[indexPath.row].title
        self.navigationController?.pushViewController(vc, animated: true)
        print("Selected an Item at \(indexPath.row)")
    }
    
}
