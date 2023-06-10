//
//  customCollectionViewCell.swift
//  collectionViewTraining
//
//  Created by ahmetburakozturk on 20.05.2023.
//

import UIKit

protocol customCollectionViewCellProtocol {
    func watchButtonClicked(indexPath: IndexPath)
}

class customCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var rateLabel: UILabel!
    var cellProtocol : customCollectionViewCellProtocol?
    var indexPath : IndexPath?
    
    
    @IBAction func watchButtonClicked(_ sender: Any) {
        cellProtocol?.watchButtonClicked(indexPath: indexPath!)
    }
    
}
