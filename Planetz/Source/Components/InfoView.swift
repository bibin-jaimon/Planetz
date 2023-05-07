//
//  InfoView.swift
//  Planetz
//
//  Created by Bibin Jaimon on 07/05/23.
//

import UIKit

class InfoView: BaseView {
    
    private let infoMessageLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override func constructView() {
        addSubview(infoMessageLabel)
    }
    
    override func configureView() {
        NSLayoutConstraint.activate([
            infoMessageLabel.safeAreaLayoutGuide.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            infoMessageLabel.safeAreaLayoutGuide.centerYAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerYAnchor)
        ])
    }
    
    func set(message: String) {
        self.infoMessageLabel.text = message
    }

}
