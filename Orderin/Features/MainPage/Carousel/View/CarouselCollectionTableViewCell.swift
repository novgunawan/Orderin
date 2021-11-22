//
//  CarouselCollectionTableViewCell.swift
//  Orderin
//
//  Created by Pieter Yonathan on 18/11/21.
//

import UIKit

struct CarouselCollectionTableViewCellViewModel{
    let viewModels: [TileCollectionViewCellViewModel]
}


class CarouselCollectionTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    static let identifier = "CarouselCollectionTableViewCell"
    private var viewModels: [TileCollectionViewCellViewModel] = []

    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 2, left: 2, bottom: 2, right: 2)
        let collectionView = UICollectionView(
            frame: .zero, collectionViewLayout: layout
        )
        //Register Collection View Cell
        collectionView.register(
            TileCollectionViewCell.self, forCellWithReuseIdentifier: TileCollectionViewCell.identifier
        )
        collectionView.backgroundColor = .systemBackground
        return collectionView
    }()
    
    //MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .systemBackground
        contentView.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    //MARK: - Layout
    
    override func layoutSubviews() {
        super.layoutSubviews()
        collectionView.frame = contentView.bounds
    }  
    
    //MARK: - CollectionView
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TileCollectionViewCell.identifier, for: indexPath) as? TileCollectionViewCell else{
            fatalError()
        }
        cell.contentView.layer.cornerRadius = 13
        cell.contentView.layer.masksToBounds = true
        cell.configure(with: viewModels[indexPath.row])
        return cell
    }
    
    func configure(with viewModel: CarouselCollectionTableViewCellViewModel){
        self.viewModels = viewModel.viewModels
        collectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let width: CGFloat = contentView.frame.size.width/2.5
        return CGSize(width: 164, height: 202)
    }
}
