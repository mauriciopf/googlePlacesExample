//
//  MapVCTableViewCell.swift
//  hellogenio
//
//  Created by Mauricio Pérez Flores on 11/17/17.
//  Copyright © 2017 wappdevelopers. All rights reserved.
//

import UIKit

class MapVCTableViewCell: UITableViewCell {

    var addressLabel = UILabel()
    var longitudeLabel = UILabel()
    var latitudeLabel = UILabel()

    var isCreated = false
    var cellType: String!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
      
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if !isCreated {
            isCreated = true
            updateLayout()
        }

    }
    
    func updateLayout() {
        
        if cellType == "address" {
                addressLabel.translatesAutoresizingMaskIntoConstraints = false
                contentView.addSubview(addressLabel)
                addressLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
                addressLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        } else {
            latitudeLabel.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview(latitudeLabel)
            longitudeLabel.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview(longitudeLabel)
            latitudeLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
            latitudeLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 50).isActive = true
            longitudeLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
            longitudeLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -50).isActive = true

        }
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
