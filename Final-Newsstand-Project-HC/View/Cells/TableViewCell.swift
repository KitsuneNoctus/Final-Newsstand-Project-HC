//
//  TableViewCell.swift
//  Final-Newsstand-Project-HC
//
//  Created by Henry Calderon on 4/26/20.
//  Copyright © 2020 Henry Calderon. All rights reserved.
//

import UIKit
import Kingfisher

class TableViewCell: UITableViewCell {
    static var identifier = "NewsCell"
    
    //MARK: Set Data
    var data: News? {
        didSet {
            guard let data = data else { return }
            //Getting Image
            guard let newsImg = data.urlToImage else {
                print("fail")
                return
            }
            let iUrl = URL(string: newsImg)
            newsImage.kf.setImage(with: iUrl)
            //Getting Title
            self.newsLabel.text = data.title
        }
    }
    
    var newStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.spacing = 10
        return stack
    }()
    
    var newsLabel: UILabel = {
        let newsLabel = UILabel()
        newsLabel.translatesAutoresizingMaskIntoConstraints = false
        newsLabel.textColor = .black
        newsLabel.numberOfLines = 0
        newsLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
        newsLabel.adjustsFontSizeToFitWidth = true
        return newsLabel
    }()
    
    var newsImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.cornerRadius = 10
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        return image
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addSubview(newStack)
//        self.addSubview(newsLabel)
//        self.contentView.addSubview(newsImage)
        self.setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
//        self.setup()
    }
    
    func setup(){
        NSLayoutConstraint.activate([
            newStack.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            newStack.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
            newStack.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            newStack.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10)
        ])
        newStack.addArrangedSubview(newsLabel)
        newStack.addArrangedSubview(newsImage)
    }

}
