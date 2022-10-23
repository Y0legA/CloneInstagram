//
//  PostInfoCollectionViewCell.swift
//  CloneInstagram
//
//  Created by Oleg_Yakovlev on 22.10.22.
//

import UIKit

// Ячейка коллекции постов
final class PostInfoCollectionViewCell: UICollectionViewCell {
    // MARK: - Private IBOutlets
    @IBOutlet private weak var postImageView: UIImageView!
    
    // MARK: - Public Properties
    var imageView: InfoPost? {
        didSet {
            postImageView.image = UIImage(named: imageView?.nameImage ?? "")
        }
    }
}
