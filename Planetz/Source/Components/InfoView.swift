//
//  InfoView.swift
//  Planetz
//
//  Created by Bibin Jaimon on 07/05/23.
//

import UIKit

class InfoView: UIView {
    
    private let infoMessageLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override func layoutSubviews() {
        super.layoutSubviews()
        setupInfoMessageLabel()
    }
    private func setupInfoMessageLabel() {
        addSubview(infoMessageLabel)
        NSLayoutConstraint.activate([
            infoMessageLabel.safeAreaLayoutGuide.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            infoMessageLabel.safeAreaLayoutGuide.centerYAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerYAnchor)
        ])
    }
    
    /// To be used to set a message in InfoView
    func set(message: String) {
        self.infoMessageLabel.text = message
    }

}

#if DEBUG

// MARK: - User for unit test

/// To access private properties and methods for testing
extension InfoView {
    
    var testSupport: TestSupport {
        TestSupport(instance: self)
    }
    
    struct TestSupport {
        private var instance: InfoView
        
        fileprivate init(instance: InfoView) {
            self.instance = instance
        }
        
        var infoMessageLabel: UILabel {
            instance.infoMessageLabel
        }
    }
}

#endif
