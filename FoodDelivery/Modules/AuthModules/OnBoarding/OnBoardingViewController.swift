//
//  OnBoardingViewController.swift
//  FoodDelivery
//
//  Created by Hassan Sayed on 15/07/2025.
//  
//

import UIKit

class OnBoardingViewController: UIViewController {
    
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var btnNext: UIButton!
    @IBOutlet weak var btnSkip: UIButton!
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()

    }

    // MARK: - Properties
    var presenter: ViewToPresenterOnBoardingProtocol!
    
    func setupView() {
        presenter?.getOnBoarding()
    }
    
    func scrollToNextBoarding(_ protocol: OnBoardingElementsProtocols?) {
        img.image = UIImage(named: `protocol`?.image ?? "onboarding1")
        lblTitle.text = `protocol`?.title
        lblDescription.text = `protocol`?.description
        setupPageController()
    }
    
    func setupPageController() {
        pageControl.numberOfPages = presenter.onBoardingImageCount()
        pageControl.currentPage = presenter.getCurrentRow()
        if pageControl.currentPage == presenter.onBoardingImageCount() - 1 {
            btnNext.setImage(nil, for: .normal)
            btnNext.setTitle("Get Started", for: .normal)
            btnNext.contentEdgeInsets = UIEdgeInsets(top: 20, left: 30, bottom: 20, right: 30)
            btnSkip.isHidden = true

        }
        (0 ..< pageControl.numberOfPages).forEach { (index) in
            let pageIcon = index == presenter.getCurrentRow() ? UIImage(named: "onBoardingSelected") : UIImage(named: "onBoardingUnSelected")
            if #available(iOS 14.0, *) {
                pageControl.setIndicatorImage(pageIcon, forPage: index)
                pageControl.pageIndicatorTintColor = UIColor(hex: 0xE6DEDB)
                pageControl.currentPageIndicatorTintColor = .primaryGreen
            }
        }
    }
    
    @IBAction func actionSkip(_ sender: Any) {
        presenter.didClickToSkip()
    }
    
    @IBAction func actionNext(_ sender: Any) {
        presenter.didChangeCurrentRow()
    }
}

extension OnBoardingViewController: PresenterToViewOnBoardingProtocol{
    func showLoading() {
//        showRefresher(view: view)
    }
    
    func hideLoading() {
//        hideRefresher()
    }
    
    func presentNetworkError() {
//        showNetworkErrorScreen(self, view)
    }
    
    func dismissNetworkError() {
//        closeNetworkErrorScreen()
    }
}

