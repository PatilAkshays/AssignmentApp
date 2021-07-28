//
//  TableViewCell.swift
//  AssignmentApp
//
//  Created by Manish Ingale on 28/07/21.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var rowTitleLbl: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!

    var imageArray: [UIImage] = []

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        collectionView.delegate = self
        collectionView.dataSource = self

    }
    
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension TableViewCell: UICollectionViewDelegate,
                         UICollectionViewDataSource,
                         UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        
        let image = imageArray[indexPath.row]
        cell.webImageView.image = image
        return cell;
    }
    
    
    
        
}
 

