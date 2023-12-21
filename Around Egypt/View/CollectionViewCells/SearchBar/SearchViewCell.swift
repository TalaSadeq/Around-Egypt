//
//  SearchViewCell.swift
//  Around Egypt
//
//  Created by Tala Sadeq on 12/20/23.
//

import UIKit

class SearchViewCell: UICollectionViewCell {
    
    static let identifier = "SearchViewCell"
    var leftimage = UIImageView()
    var rightimage = UIImageView()
    var searchbar = UISearchBar()
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI(){
        addSubview(searchbar)
        searchbar.placeholder = "Try \"luxor\""
        searchbar.showsCancelButton = false
        searchbar.tintColor = .gray
        let config = UIImage.SymbolConfiguration(scale: .large)
        
        let leftimage = UIImageView(image: UIImage(systemName: "line.horizontal.3",withConfiguration: config))
        let rightimage = UIImageView(image: UIImage(systemName: "line.horizontal.3",withConfiguration: config))
        leftimage.contentMode = .scaleAspectFit
        rightimage.contentMode = .scaleAspectFit
        addSubview(leftimage)
        addSubview(rightimage)
        leftimage.translatesAutoresizingMaskIntoConstraints = false
        rightimage.translatesAutoresizingMaskIntoConstraints = false
        searchbar.translatesAutoresizingMaskIntoConstraints = false
        rightimage.tintColor = .black
        leftimage.tintColor = .black
        
        NSLayoutConstraint.activate([
               // Add constraints for leftimage
               leftimage.topAnchor.constraint(equalTo: topAnchor, constant: 30),
               leftimage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 2),
               
               // Add constraints for searchBar
               searchbar.topAnchor.constraint(equalTo: leftimage.topAnchor),
               searchbar.leadingAnchor.constraint(equalTo: leftimage.trailingAnchor, constant: 10),
               searchbar.trailingAnchor.constraint(equalTo: rightimage.leadingAnchor, constant: -10),
               searchbar.heightAnchor.constraint(equalToConstant: 50), // Adjust the height as needed
               
               // Add constraints for rightimage
               rightimage.topAnchor.constraint(equalTo: leftimage.topAnchor),
               rightimage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -2),
               
               // Ensure that the items have equal heights if needed
               leftimage.heightAnchor.constraint(equalTo: searchbar.heightAnchor),
               rightimage.heightAnchor.constraint(equalTo: searchbar.heightAnchor),
        ])
    }
}
