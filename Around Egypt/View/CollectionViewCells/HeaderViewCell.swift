//
//  HeaderViewCell.swift
//  Around Egypt
//
//  Created by Tala Sadeq on 12/19/23.
//

import UIKit

class HeaderViewCell: UICollectionViewCell {
    
    static let identifier = "HeaderViewCell"
    let title1 = UILabel()
    let title2 = UILabel()
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI(){
        addSubview(title1)
        title1.text = "Welcome!"
        title1.translatesAutoresizingMaskIntoConstraints = false
        title1.font = UIFont(name: "GothamRounded", size: 14)
        title1.font = UIFont.boldSystemFont(ofSize: 14)
        title1.textColor = .black
        title1.textAlignment = .left
        
        addSubview(title2)
        title2.text = "Now you can explore any experience in 360 degrees and get all the details about it all in one place."
        title2.numberOfLines = 0
        title2.translatesAutoresizingMaskIntoConstraints = false
        title2.font = UIFont(name: "GothamRounded", size: 10)
        title2.textColor = .black
        title2.textAlignment = .left
        
        NSLayoutConstraint.activate([
            title1.topAnchor.constraint(equalTo: topAnchor, constant: 30),
            title1.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 2),

            title2.topAnchor.constraint(equalTo: title1.bottomAnchor, constant: 10),
            title2.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 2),
            title2.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
           
            
        ])
        
    }
    
}
