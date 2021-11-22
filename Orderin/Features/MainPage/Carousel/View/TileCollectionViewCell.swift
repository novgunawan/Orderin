//
//  TileCollectionViewCell.swift
//  Orderin
//
//  Created by Pieter Yonathan on 18/11/21.
//

import UIKit

//TODO: - move struct data to model
struct TileCollectionViewCellViewModel{
    let name: String
    let image: UIImage
}


class TileCollectionViewCell: UICollectionViewCell {
    static let identifier  = "TileCollectionViewCell"
    
    //MARK: - Componenet
    var viewCart: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 96, y: 160, width: 63, height: 38)
        view.layer.cornerRadius = 13
        view.backgroundColor = UIColor(red: 0.91, green: 0.3, blue: 0.2, alpha: 0.8)
        return view
    }()
    
    var labelQuantity: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 33, y: 8, width: 27, height: 22)
        label.textColor = .white
        label.font = UIFont(name: C.fontPoppinsBold, size: C.fontsizeBody)
        //TODO: get data quantity in database
        label.text = "20"
        return label
    }()
    
    let cartImage: UIImageView = {
        let image = UIImageView()
        image.frame = CGRect(x: 7, y: 10, width: 20, height: 18)
        image.image  = UIImage(systemName: "cart")
        image.tintColor = .white
        return image
    }()
    
    override init(frame: CGRect){
        super.init(frame: frame)

    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    //MARK: - Function Configure Cell Collection View
    func configure(with viewModel: TileCollectionViewCellViewModel){
        
        let nameImage = viewModel.image
        let imageView:UIImageView = UIImageView()
        imageView.contentMode = UIView.ContentMode.scaleAspectFill
        imageView.frame.size.width = 164
        imageView.frame.size.height = 202
        imageView.center = self.contentView.center
        imageView.image = nameImage
        imageView.layer.cornerRadius = 13
        
        viewCart.addSubview(cartImage)
        viewCart.addSubview(labelQuantity)
        imageView.addSubview(viewCart)
        contentView.addSubview(imageView)

        
    }
}
