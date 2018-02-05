//
//  CategoryCell.swift
//  coder-swag
//
//  Created by 이주원 on 2018. 2. 2..
//  Copyright © 2018년 이주원. All rights reserved.
//

import UIKit

class CategoryCell: UITableViewCell {

    @IBOutlet weak var categoryImage: UIImageView!
    @IBOutlet weak var categoryTitle: UILabel!
    
    func updateViews(category: Category) {
        categoryImage.image = UIImage(named: category.imageName)
        categoryTitle.text = category.title
    }
}
