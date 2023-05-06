//
//  PlanetListCell.swift
//  Planetz
//
//  Created by Bibin Jaimon on 06/05/23.
//

import UIKit

class PlanetListCell: UITableViewCell {
    
    static let identifier: String = "PlanetListCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setupCell(planet: Planet) {
        var content = defaultContentConfiguration()
        content.text = planet.name
        content.secondaryText = planet.terrain
        
        if UIDevice().userInterfaceIdiom == .pad {
            content.textProperties.font = .systemFont(ofSize: 32)
            content.secondaryTextProperties.font = .systemFont(ofSize: 24, weight: .regular)
        }
        
        content.image = UIImage(systemName: "chevron.forward")
        content.imageProperties.cornerRadius = bounds.height / 2.0
        content.imageProperties.reservedLayoutSize.width = bounds.height
        content.imageProperties.reservedLayoutSize.height = bounds.height
        contentConfiguration = content
    }

}

