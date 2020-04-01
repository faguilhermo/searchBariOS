//
//  CountryCell.swift
//  SearchController
//
//  Created by Zac Workman on 29/01/2019.
//  Copyright © 2019 Kwip Limited. All rights reserved.
//

import UIKit

class CountryCell: UITableViewCell {
    
    let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return titleLabel
    }()
    
    let categoryLabel: UILabel = {
        let categoryLabel = UILabel()
        categoryLabel.translatesAutoresizingMaskIntoConstraints = false
        categoryLabel.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        categoryLabel.textAlignment = .right
        
        return categoryLabel
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(titleLabel)
        addSubview(categoryLabel)
        
        titleLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 20).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: categoryLabel.leftAnchor).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        categoryLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        categoryLabel.widthAnchor.constraint(equalToConstant: 120).isActive = true
        categoryLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -20).isActive = true
        categoryLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
