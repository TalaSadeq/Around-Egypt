//
//  ConstantLabelViewCell.swift
//  Around Egypt
//
//  Created by Tala Sadeq on 12/19/23.
//

import UIKit

class ConstantLabelViewCell: UICollectionViewCell {
    static let identifier = "ConstantLabelViewCell"
    var label = UILabel()
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI(){
        addSubview(label)
        label.text = "Most Recent"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "GothamRounded", size: 14)
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor = .black
        label.textAlignment = .left
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: topAnchor, constant: 30),
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 2),
           ])
        
    }
}
