//
//  NewsHomeController.swift
//  NewsApp MVVM
//
//  Created by Arslan Kaan AYDIN on 31.05.2022.
//

import UIKit
import SnapKit
import Alamofire

//MARK: - Protocols
protocol NewsOutput {
    func selectedMovies()
}

class NewsHomeController: UIViewController {
    
    private let pageController: UIPageControl = {
        let pc = UIPageControl()
        pc.numberOfPages = 3
        pc.currentPage = 0
        pc.translatesAutoresizingMaskIntoConstraints = false
        pc.pageIndicatorTintColor = .gray
        pc.currentPageIndicatorTintColor = .black
        return pc
    }()
    
    private let scrollView: UIScrollView = {
        let sv = UIScrollView()
        sv.showsHorizontalScrollIndicator = false
        sv.isPagingEnabled = true
        sv.layer.borderWidth = 3
        sv.layer.borderColor = UIColor.lightGray.cgColor
        sv.layer.cornerRadius = 12
        sv.clipsToBounds = true
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.contentMode = .scaleAspectFit
        return sv
    }()
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
    
    private var viewModel: NewsProtocol = NewsHomeViewModel(service: Services())
    private var article = [Article]()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        viewModel.delegate = self
        
        viewModel.fetchTopNews { data in
            guard let data = data else { return }
            self.article = data.articles ?? []
            
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        } onError: { AFError in
            print(AFError)
        }


    }
    
    private func configure() {
        subviews()
        drawDesign()
        makePageController()
        makeScrollView()
        makeCollectionView()
    }
    
    private func drawDesign() {
        view.backgroundColor = .white
        collectionView.register(NewsHomeCollectionViewCell.self, forCellWithReuseIdentifier: NewsHomeCollectionViewCell.Identifier.custom.rawValue)
        collectionView.delegate = self
        collectionView.dataSource = self
        
        scrollView.delegate = self
        scrollView.contentSize = CGSize(width: view.frame.width * 3.6 , height: 0)
        
        
        configureNavigationBar(largeTitleColor: .systemGray, backgoundColor: .white, tintColor: .black, title: "Top News", preferredLargeTitle: false)
    }
    
    private func subviews() {
        view.addSubview(pageController)
        view.addSubview(scrollView)
        view.addSubview(collectionView)
    }
    
}

//MARK: - SnapKit Extension
extension NewsHomeController {
    private func makeScrollView() {
        scrollView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().inset(20)
            make.height.equalToSuperview().multipliedBy(0.32)
        }
    }
    
    private func makePageController() {
        pageController.snp.makeConstraints { make in
            make.top.equalTo(scrollView.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.32)
            make.height.equalTo(20)
        }
    }
    
    private func makeCollectionView() {
        collectionView.snp.remakeConstraints { make in
            make.top.equalTo(pageController.snp.bottom).offset(10)
            make.left.right.equalTo(scrollView)
            make.bottom.equalToSuperview().inset(20)
        }
    }
}

extension NewsHomeController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        article.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell: NewsHomeCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: NewsHomeCollectionViewCell.Identifier.custom.rawValue, for: indexPath) as? NewsHomeCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.layer.cornerRadius = 12
        cell.layer.borderWidth = 3
        cell.configureCellContent(article: article[indexPath.item])
        print("CELL : \(cell)")
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

extension NewsHomeController: UIScrollViewDelegate {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageNumber = round(scrollView.contentOffset.x / scrollView.frame.size.width)
        pageController.currentPage = Int(pageNumber)
    }
}

extension NewsHomeController: NewsOutput {
    func selectedMovies() {
        
    }
}
