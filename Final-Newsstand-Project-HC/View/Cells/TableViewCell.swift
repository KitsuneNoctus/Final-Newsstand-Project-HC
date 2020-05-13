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
    
    var data: News? {
        didSet {
            guard let data = data else { return }
            //Getting Image
            guard let newsImg = data.urlToImage else {
                print("fail")
                return
            }
            let iUrl = URL(string: newsImg)
            imageView!.kf.setImage(with: iUrl)
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
        return newsLabel
    }()
    
    var newsImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.cornerRadius = 10
        image.contentMode = .scaleAspectFill
        return image
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setup()
    }
    
    func setup(){
//        self.contentView.addSubview(newStack)
//        NSLayoutConstraint.activate([
//            newStack.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10),
//            newStack.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: 10),
//            newStack.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10),
//            newStack.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: 10)
//        ])
        
//        newStack.addArrangedSubview(newsLabel)
        self.contentView.addSubview(newsLabel)
//        newStack.addArrangedSubview(newsImage)
        self.contentView.addSubview(newsImage)
        NSLayoutConstraint.activate([
            newsLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10),
            newsLabel.heightAnchor.constraint(equalTo: self.contentView.heightAnchor, multiplier: 9/10),
            newsLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: 10),
            newsImage.heightAnchor.constraint(equalTo: self.contentView.heightAnchor, multiplier: 9/10),
            newsImage.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor),
            newsImage.widthAnchor.constraint(equalToConstant: 100)
        ])
    }

}
