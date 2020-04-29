//
//  TableViewCell.swift
//  Final-Newsstand-Project-HC
//
//  Created by Henry Calderon on 4/26/20.
//  Copyright © 2020 Henry Calderon. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    static var identifier = "NewsCell"
    
    var data: News? {
        didSet {
            guard let data = data else { return }
            newsLabel.text = data.title
        }
    }
    
    var newsLabel: UILabel = {
        let newsLabel = UILabel()
        newsLabel.translatesAutoresizingMaskIntoConstraints = false
        newsLabel.textColor = .black
        return newsLabel
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
        self.contentView.addSubview(newsLabel)
        NSLayoutConstraint.activate([
            newsLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10),
            newsLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: 10),
            newsLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10),
            newsLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: 10)
        ])
    }

}
