//
//  TransactionsTopReusableView.swift
//  Task
//
//  Created by Gevorg Avetisyan on 02.02.22.
//

import UIKit

class TransactionsTopReusableView: UICollectionReusableView {

    //MARK: - IBOutlets -
    
    @IBOutlet weak var progressView: UIProgressView!
    
    //MARK: - Configurations -
    
    func configure(progress: Float) {
        progressView.setProgress(progress, animated: false)
    }
}
