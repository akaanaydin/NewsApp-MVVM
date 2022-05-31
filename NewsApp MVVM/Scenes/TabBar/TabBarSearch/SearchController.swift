//
//  SearchController.swift
//  NewsApp MVVM
//
//  Created by Arslan Kaan AYDIN on 31.05.2022.
//

import UIKit
import SnapKit

class SearchController: UIViewController {
    
    // SearchBar
    private let searchController: UISearchController = UISearchController()
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    private func configure() {
        subviews()
        drawDesign()
        makeCollectionView()
    }
    
    private func drawDesign() {
        view.backgroundColor = .white
        collectionView.register(SearchCollectionViewCell.self, forCellWithReuseIdentifier: SearchCollectionViewCell.Identifier.custom.rawValue)
        collectionView.delegate = self
        collectionView.dataSource = self
        
        configureNavigationBar(largeTitleColor: .systemGray, backgoundColor: .white, tintColor: .black, title: "Search News", preferredLargeTitle: false)
        navigationItem.searchController = searchController
        searchController.searchResultsUpdater = self
    }
    
    private func subviews() {
        view.addSubview(collectionView)
    }
    
    
}

//MARK: - SnapKit Extension
extension SearchController {
    private func makeCollectionView() {
        collectionView.snp.remakeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().inset(20)
            make.bottom.equalToSuperview()
        }
    }
}

extension SearchController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell: SearchCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchCollectionViewCell.Identifier.custom.rawValue, for: indexPath) as? SearchCollectionViewCell else {
            return UICollectionViewCell()}
        
        
        cell.layer.cornerRadius = 12
        cell.layer.borderWidth = 3
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(
            width: collectionView.frame.size.width,
            height: collectionView.frame.size.height / 4
        )
        
    }
}

extension SearchController: UISearchResultsUpdating {
    
    func filterContentForSearchText(_ searchText: String) {
        
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        
    }
}
