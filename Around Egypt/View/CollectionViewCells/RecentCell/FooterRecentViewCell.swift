//
//  FooterRecentViewCell.swift
//  Around Egypt
//
//  Created by Tala Sadeq on 12/19/23.
//

import UIKit

class FooterRecentViewCell: UICollectionViewCell {
    // Label  // Like button
    static let identifier = "FooterRecentViewCell"
    var placetoVisit = UILabel()
    var likeCount =  UILabel()
    var likeButton = UIButton()
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI(){
        addSubview(likeButton)
        likeButton = UIButton(
            type: .custom,
            primaryAction: UIAction(
                image: UIImage(systemName: "heart"),
                handler: { _ in }))
        addSubview(likeCount)
        placetoVisit.text = "Egypt"
        addSubview(placetoVisit)
        likeCount.textColor = .black
        likeCount.font = UIFont(name: "", size: 15)
    }
    
}
