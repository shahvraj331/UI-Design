//
//  TutorialViewController.swift
//  UIDesign
//
//  Created by Vraj Shah on 04/05/22.
//

import UIKit

class TutorialViewController: UIViewController, Storyboarded {

    //MARK: - Variables
    var tutorialData: [TutorialData] = []
    var coordinator: BaseCoordinator?
    
    //MARK: - Outlets
    @IBOutlet weak var tutorialCollectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var btnSkip: UIButton!
    @IBOutlet weak var btnNext: BaseButton!
    
    //MARK: - UIViewController lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTutorialData()
        pageControl.numberOfPages = tutorialData.count
    }
    
    //MARK: - Actions
    @IBAction func pageControlAction(_ sender: UIPageControl) {
        tutorialCollectionView.scrollToItem(at: IndexPath(item: sender.currentPage, section: 0), at: .centeredHorizontally, animated: true)
        updateSkipStatus()
    }
    
    @IBAction func nextScreenAction(_ sender: BaseButton) {
        if pageControl.currentPage == pageControl.numberOfPages - 1 {
            UserDefaults.standard.setTutorialCompleted()
            coordinator?.startLogInScreen()
        } else {
            pageControl.currentPage = pageControl.currentPage + 1
            tutorialCollectionView.scrollToItem(at: IndexPath(item: pageControl.currentPage, section: 0), at: .centeredHorizontally, animated: true)
            updateSkipStatus()
        }
    }
    
    @IBAction func skipTutorialAction(_ sender: UIButton) {
        UserDefaults.standard.setTutorialCompleted()
        coordinator?.startLogInScreen()
    }
    
    //MARK: - File private functions
    fileprivate func setUpTutorialData() {
        tutorialData.append(TutorialData(image: UIImage(named: "tutorialBackground") ?? UIImage(), description: "Find and get job recommendations, search and save your job vacancies"))
        tutorialData.append(TutorialData(image: UIImage(named: "tutorialBackground") ?? UIImage(), description: "Find and get job recommendations, search and save your job vacancies"))
        tutorialData.append(TutorialData(image: UIImage(named: "tutorialBackground") ?? UIImage(), description: "Find and get job recommendations, search and save your job vacancies"))
        tutorialData.append(TutorialData(image: UIImage(named: "tutorialBackground") ?? UIImage(), description: "Find and get job recommendations, search and save your job vacancies"))
        tutorialData.append(TutorialData(image: UIImage(named: "tutorialBackground") ?? UIImage(), description: "Find and get job recommendations, search and save your job vacancies"))
    }
    
    fileprivate func updateSkipStatus() {
        btnSkip.isHidden = pageControl.currentPage == pageControl.numberOfPages - 1
        btnNext.setTitle(btnSkip.isHidden ? "Start" : "Next" , for: .normal)
    }

}//End of class

//MARK: - UICollectionViewDelegate
extension TutorialViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: tutorialCollectionView.frame.width, height: tutorialCollectionView.frame.height)
    }
    
}//End of extension

//MARK: - UICollectionViewDataSource
extension TutorialViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tutorialData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "tutorialCell", for: indexPath) as? TutorialCollectionViewCell {
            cell.initializeCell(tutorialData[indexPath.row])
            return cell
        } else {
            return UICollectionViewCell()
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        pageControl.currentPage = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
        updateSkipStatus()
    }
    
}//End of extension
