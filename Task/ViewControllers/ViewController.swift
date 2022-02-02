//
//  ViewController.swift
//  Task
//
//  Created by Gevorg Avetisyan on 02.02.22.
//

import UIKit

class ViewController: UIViewController {

    //MARK: - IBOutlets -
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    //MARK: - Properties -
    
    private let viewModel = ViewModel()
    
    private let topHeaderHeight: CGFloat = 110
    private let headerHeight: CGFloat = 30
    private let cellHeight: CGFloat = 100
    
    //MARK: - Setup -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureCollectionView()
    }

    //MARK: - Configurations -
    
    private func configureCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UINib(nibName: "TransactionCollectionViewCell", bundle: .main), forCellWithReuseIdentifier: "\(TransactionCollectionViewCell.self)")
        collectionView.register(UINib(nibName: "TransactionDateCollectionReusableView", bundle: .main), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "\(TransactionDateCollectionReusableView.self)")
        collectionView.register(UINib(nibName: "TransactionsTopReusableView", bundle: .main), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "\(TransactionsTopReusableView.self)")
    }
}

//MARK: - UICollectionViewDataSource -

extension ViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        viewModel.numberOfSections
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.numberOfItems(section: section)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(TransactionCollectionViewCell.self)", for: indexPath) as! TransactionCollectionViewCell
        cell.configureCell(model: viewModel.getModel(indexPath: indexPath), position: viewModel.getCellPosition(indexPath: indexPath))
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if indexPath.section == 0 {
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "\(TransactionsTopReusableView.self)", for: indexPath) as! TransactionsTopReusableView
            header.configure(progress: viewModel.progress)
            return header
        } else {
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "\(TransactionDateCollectionReusableView.self)", for: indexPath) as! TransactionDateCollectionReusableView
            header.configure(date: viewModel.sectionTitles[indexPath.section - 1])
            return header
        }
    }
}

//MARK: - UICollectionViewDelegateFlowLayout -

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        section == 0 ? CGSize(width: collectionView.frame.width, height: topHeaderHeight) : CGSize(width: collectionView.frame.width, height: headerHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width, height: cellHeight)
    }
}
