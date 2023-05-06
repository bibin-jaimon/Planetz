//
//  BaseView.swift
//  Planetz
//
//  Created by Bibin Jaimon on 06/05/23.
//

import UIKit

protocol BaseViewConstrucable {
    func constructView()
    func configureView()
}

class BaseView: UIView, BaseViewConstrucable {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        constructView()
        configureView()
    }
    
    func constructView() { }
    
    func configureView() { }
    
}
