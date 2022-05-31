//
//  SearchCollectionViewCell.swift
//  NewsApp MVVM
//
//  Created by Arslan Kaan AYDIN on 31.05.2022.
//

import UIKit
import SnapKit
import Kingfisher

class SearchCollectionViewCell: UICollectionViewCell {
    
    enum Identifier: String {
        case custom = "SearchCollectionViewCell"
    }
    
    private let imageView: UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = .blue
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.layer.borderColor = UIColor.white.cgColor
        iv.layer.borderWidth = 3
        iv.layer.cornerRadius = 12
        iv.clipsToBounds = true
        return iv
    }()
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.text = "Name"
        return label
    }()
    private let ratingLabel: UILabel = {
        let label = UILabel()
        label.text = "Rating"
        label.layer.cornerRadius = 20
        label.clipsToBounds = true
        label.textAlignment = .center
        label.backgroundColor = .white.withAlphaComponent(0.5)

        return label
    }()
    private let releaseDateLabel: UILabel = {
        let label = UILabel()
        label.text = "Release"
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        subviews()
        drawDesign()
        makeImageView()
        makeNameLabel()
        makeRatingLabel()
        makeReleaseDateLabel()
    }
    
    private func drawDesign() {
    }
    
    private func subviews() {
        addSubview(imageView)
        addSubview(nameLabel)
        addSubview(ratingLabel)
        addSubview(releaseDateLabel)
        
    }
    
//    func saveModel(model: Result) {
//        nameLabel.text = model.name
//        ratingLabel.text = String(model.rating)
//        releaseDateLabel.text = model.released
//        imageView.kf.setImage(with: URL(string: model.backgroundImage))
//    }
}

extension SearchCollectionViewCell {
    private func makeImageView() {
        imageView.snp.makeConstraints { make in
            make.top.equalTo(contentView)
            make.left.equalToSuperview()
            make.bottom.equalTo(contentView)
            make.width.equalTo(150)
        }
    }
    
    private func makeNameLabel() {
        nameLabel.snp.makeConstraints { make in
            make.centerY.equalTo(imageView)
            make.left.equalTo(imageView.snp.right).offset(10)
            make.right.equalTo(contentView)
            make.height.equalTo(50)
        }
    }
    
    private func makeRatingLabel() {
        ratingLabel.snp.makeConstraints { make in
            make.bottom.equalTo(imageView).inset(5)
            make.right.equalTo(imageView).inset(5)
            make.width.height.equalTo(40)
        }
    }
    
    private func makeReleaseDateLabel() {
        releaseDateLabel.snp.makeConstraints { make in
            make.bottom.equalTo(contentView).inset(5)
            make.right.equalTo(contentView).inset(5)
            
        }
    }
}

