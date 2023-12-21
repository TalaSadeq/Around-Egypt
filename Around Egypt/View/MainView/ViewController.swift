 //
//  ViewController.swift
//  Around Egypt
//
//  Created by Tala Sadeq on 12/18/23.
//

import UIKit
import SwiftUI

let screenwidth = UIScreen.main.bounds.size.width
let screenHeight = UIScreen.main.bounds.size.height


class ViewController: UIViewController {
    var viewModel = RecentViewModel()
    let searchbar = UISearchBar()
    var collectionView : UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        //collectionView.dataSource = self
        //configureCollectionView()
        updateAndreloadUI()
        
    }
    
    
    func updateAndreloadUI(){
        viewModel.fetchData { error in
            if let error = error {
          // Handle error
            print("Error fetching data: \(error.localizedDescription)")
            } else {
            // Reload collection view after data fetch
            DispatchQueue.main.async {
           self.configureCollectionView()
           self.collectionView.reloadData()
            self.collectionView.dataSource = self
                }
            }
        }
    }
    
    
    
    private func configureCollectionView(){
        
        let collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createFlowLayout())
        collectionView.register(SearchViewCell.self, forCellWithReuseIdentifier: SearchViewCell.identifier)
        collectionView.register(HeaderViewCell.self, forCellWithReuseIdentifier: HeaderViewCell.identifier)
        collectionView.register(ConstantLabelViewCell.self, forCellWithReuseIdentifier: ConstantLabelViewCell.identifier)
        collectionView.register(RecentViewCell.self, forCellWithReuseIdentifier: RecentViewCell.identifier)
        collectionView.register(FooterRecentViewCell.self, forCellWithReuseIdentifier: FooterRecentViewCell.identifier)
        collectionView.register(RecommendedViewCell.self, forCellWithReuseIdentifier: RecommendedViewCell.identifier)
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.register(FooterRecentViewCell.self, forCellWithReuseIdentifier: FooterRecentViewCell.identifier)
        view.addSubview(collectionView)
        collectionView.delegate = self
        //collectionView.dataSource = self
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        
        self.collectionView = collectionView
    }
    private func createFlowLayout() -> UICollectionViewLayout {
        // Divide the screen into multiple sections
        // 0 is for the Navigation bar/ Search
        // 1 is for the Two titles
        // 3 is for the Recommended Horizontal layout
        // 4 is for the Recent Vertical layout
        
        let layout = UICollectionViewCompositionalLayout{ sectionIndex , layoutEnv in
            if sectionIndex == 0 {
                return self.createSearchbarLayout()
            }
            else if sectionIndex == 1 {
                return self.createHeaderLayout()
            }
            else if sectionIndex == 2 {
                return self.createLabel()
            }else if sectionIndex == 3 {
                return self.createRecommendedLayout()
            }else {
                return self.createRecentLayout()
            }
            
        }
        return layout
    }
    
    private func createSearchbarLayout() -> NSCollectionLayoutSection {
        //item
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.6), heightDimension: .absolute(100))
        let headerItem = NSCollectionLayoutItem(layoutSize: itemSize)
        //group
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(100))
        let headerGroup = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: headerItem, count: 1)
        //section
        let SearchbarSection = NSCollectionLayoutSection(group: headerGroup)
        return SearchbarSection
    }
    
    
    private func createLabel()-> NSCollectionLayoutSection{
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(100))
        let headerItem = NSCollectionLayoutItem(layoutSize: itemSize)
        //group
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(100))
        let headerGroup = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: headerItem, count: 1)
        //section
        let labelSection = NSCollectionLayoutSection(group: headerGroup)
        return labelSection
    }
        
    private func createHeaderLayout() -> NSCollectionLayoutSection {
        // Header layout
        
        //item
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(100))
        let headerItem = NSCollectionLayoutItem(layoutSize: itemSize)
        //group
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(100))
        let headerGroup = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: headerItem, count: 1)
        //section
        let headerSection = NSCollectionLayoutSection(group: headerGroup)
        return headerSection
    }
    private func createRecommendedLayout() -> NSCollectionLayoutSection {
        // Create the size of the recommended places
        let recomItemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0), // Takes the full width of the container
            heightDimension: .absolute(100) // Set a fixed height of 100
        )
        
        let recomItem = NSCollectionLayoutItem(layoutSize: recomItemSize)
         
        // Group size to create a single horizontal row
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0), // Takes the full width of the container
            heightDimension: .absolute(100) // Set a fixed height of 100
        )
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [recomItem])
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        
        return section
    }

    private func createRecentLayout() -> NSCollectionLayoutSection {
        // create an item for each one of the main recent layout VERTICAL
        
        
        let RecentImage = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.8), heightDimension: .absolute(300)) )
       // let RecentSubTitle = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(50)) )
        
        // Group
        let feedGroup = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(50)), subitems: [RecentImage])
        
        // Section
        let feedSection = NSCollectionLayoutSection(group: feedGroup)
        return feedSection
    }
    
}


extension ViewController : UICollectionViewDelegate , UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }else if section == 1 {
            return 1
        }else if section == 2 {
            return 1
        }else if section == 3{
            return 8
        }else {
            return viewModel.data?.data.count ?? 0
        }
    }
            
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.section == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchViewCell.identifier, for: indexPath)
            cell.backgroundColor = .white
            return cell
        }
        else if indexPath.section == 1 {
            // The title View
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HeaderViewCell.identifier, for: indexPath)
            cell.backgroundColor = .white
            return cell
         }
        
        else if indexPath.section == 2 {
            // The title View
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ConstantLabelViewCell.identifier, for: indexPath)
            cell.backgroundColor = .white
            
            return cell
         }
        
        else if indexPath.section == 3 {
             // The Recommended Cell
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RecommendedViewCell.identifier, for: indexPath)
             cell.backgroundColor = .white
            
                      
              cell.layer.cornerRadius = 6
                 return cell
          }
        else {
                // Your RecentViewCell configuration
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RecentViewCell.identifier, for: indexPath) as! RecentViewCell
                
                if let dataCount = viewModel.data?.data.count {
                    let index = indexPath.row % dataCount // Calculate the index based on the count of data
                    
                    if let imageData = viewModel.data?.data[index] {
                        // Load image
                        if let imageURL = imageData.cover_photo {
                            cell.loadImage(from: imageURL)
                        }
                        
                        // Update labels and configure heart button based on your ViewModel data
                        if let likesNo = viewModel.data?.data[index]?.likesNo {
                            cell.leftLabel.text = "\(likesNo)"
                        }
                        cell.rightLabel.text = viewModel.data?.data[index]?.title
                        
                        
                        // Configure heart button based on viewModel data (assuming you have a property for heart button state)
                       // cell.heartButton.setImage(viewModel.isLiked ? UIImage(systemName: "heart.fill") : UIImage(systemName: "heart"), for: .normal)
                       // cell.heartButton.tintColor = viewModel.isLiked ? .red : .black
                        
                        cell.tapAction = { [weak self] in
                            // Present the SwiftUI sheet here using the data from the cell
                            
                            guard let imageID = self?.viewModel.data?.data[index]?.id,
                                  let imageName = self?.viewModel.data?.data[index]?.title else {
                                return
                            }
                            
                            let imageDetailsView = SheetView(imageId: (self?.viewModel.data?.data[index]?.id)!)
                            let host = UIHostingController(rootView: imageDetailsView)
                            self?.present(host, animated: true, completion: nil)
                        }
                    }
                }
                
                return cell
            }
        }
            
           
            
                   
                    
 
  


}

