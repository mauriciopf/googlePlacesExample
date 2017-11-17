//
//  HomeTableViewCell.swift
//  hellogenio
//
//  Created by Mauricio Pérez Flores on 11/16/17.
//  Copyright © 2017 wappdevelopers. All rights reserved.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    var myImageView = UIImageView()
    var typeOfCell: String!
    var isCreated = false
    var anchorConstraints: NSLayoutConstraint!

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
    }
    
    override open func layoutSubviews() {
        super.layoutSubviews()
        
        if !isCreated {
            isCreated = true
            updateLayout()
        }
    }
    
    
    func updateLayout() {
        
        myImageView.translatesAutoresizingMaskIntoConstraints = false
        myImageView.layer.cornerRadius = myImageView.frame.size.width / 2
        myImageView.clipsToBounds = true

        contentView.addSubview(myImageView)

        if typeOfCell == "data_0" {
            
            myImageView.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor).isActive = true
            myImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 100).isActive = true
            myImageView.widthAnchor.constraint(equalToConstant: 30).isActive = true
            myImageView.heightAnchor.constraint(equalToConstant: 30).isActive = true

            
        } else if typeOfCell == "data_1" {
            
            myImageView.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor).isActive = true
            myImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -100).isActive = true
            myImageView.widthAnchor.constraint(equalToConstant: 30).isActive = true
            myImageView.heightAnchor.constraint(equalToConstant: 30).isActive = true


        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
