//
//  RecommendedViewCell.swift
//  Around Egypt
//
//  Created by Tala Sadeq on 12/19/23.
//

import UIKit

class RecommendedViewCell: UICollectionViewCell {
    static let identifier = "RecommendedViewCell"
    var imageUrl = UIImageView()
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI(){
        imageUrl = UIImageView(image: UIImage(named:"img" ))
        imageUrl.translatesAutoresizingMaskIntoConstraints = false
        imageUrl.contentMode = .scaleAspectFit
        imageUrl.clipsToBounds = true
        addSubview(imageUrl)
        
        NSLayoutConstraint.activate([
            imageUrl.centerYAnchor.constraint(equalTo: centerYAnchor),
            imageUrl.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 0),
            imageUrl.widthAnchor.constraint(equalToConstant: 500),
            imageUrl.heightAnchor.constraint(equalToConstant: 100 ),
            
     ])
        
    }
}
