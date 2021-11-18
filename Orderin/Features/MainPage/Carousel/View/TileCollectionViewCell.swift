//
//  TileCollectionViewCell.swift
//  Orderin
//
//  Created by Pieter Yonathan on 18/11/21.
//

import UIKit

struct TileCollectionViewCellViewModel{
    let name: String
    let image: UIImage
}


class TileCollectionViewCell: UICollectionViewCell {
    static let identifier  = "TileCollectionViewCell"
    
    override init(frame: CGRect){
        super.init(frame: frame)

    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func configure(with viewModel: TileCollectionViewCellViewModel){
        
        
        let width: CGFloat = contentView.frame.size.width

        let nameImage = viewModel.image
        let imageView:UIImageView = UIImageView()
        imageView.contentMode = UIView.ContentMode.scaleToFill
        imageView.frame.size.width = 164
        imageView.frame.size.height = 202
        imageView.center = self.contentView.center
        imageView.image = nameImage
    
        contentView.addSubview(imageView)
//
        
//        contentView.backgroundColor = UIColor(patternImage: viewModel.image)
    }
}
