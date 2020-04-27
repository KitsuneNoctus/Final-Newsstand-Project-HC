//
//  CustomFlowLayout.swift
//  Final-Newsstand-Project-HC
//
//  Created by Henry Calderon on 4/26/20.
//  Copyright © 2020 Henry Calderon. All rights reserved.
//

import UIKit

class CustomFlowLayout: UICollectionViewFlowLayout {
    override func prepare() {
        super.prepare()
        guard let cv = collectionView else { return }
        self.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        self.sectionInsetReference = .fromSafeArea
        let availableWidth = cv.bounds.inset(by: cv.layoutMargins).size.width
        let minColumnWidth = CGFloat(150)
        let maxNumColumns = Int(availableWidth/minColumnWidth)
        let cellWidth = (availableWidth/CGFloat(maxNumColumns)).rounded(.down)
        self.itemSize = CGSize(width: cellWidth, height: 200.0)
    }

}
