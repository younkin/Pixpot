//
//  FooterSupplementaryView.swift
//  Sarawan
//
//  Created by Евгений Юнкин on 22.12.22.
//



import UIKit
import SnapKit


class FooterSupplementaryView: UICollectionReusableView {
    
    private var pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.currentPageIndicatorTintColor = AppColors.green
        pageControl.pageIndicatorTintColor = AppColors.grey
        return pageControl
    }()
    
    override init (frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupView() {
        backgroundColor = AppColors.darkBlue
    addSubview(pageControl)
    }
    
    func configureCurrentPage(currentPage: Int) {
        pageControl.currentPage = currentPage
    }
    func configurePageCount(pageCount: Int) {
        pageControl.numberOfPages = pageCount
    }
    
    func setConstraints() {
        pageControl.snp.makeConstraints {
            $0.centerX.equalTo(self.snp.centerX)
            $0.top.equalToSuperview()
        }
    }
}


