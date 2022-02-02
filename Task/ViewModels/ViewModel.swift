//
//  ViewModel.swift
//  Task
//
//  Created by Gevorg Avetisyan on 02.02.22.
//

import UIKit

class ViewModel {

    var data = [String: [TransactionModel]]()
    var sectionTitles = [String]()
    let progress: Float = 0.4
    
    var numberOfSections: Int {
        data.count + 1
    }
    
    init() {
        setupData()
    }
    
    func setupData() {
        data["23 ноября 2021"] = [
            TransactionModel(type: .accrual, amount: 20, description: "Санкт Петербург Московская Площадь")]
        
        data["22 ноября 2021"] = [
            TransactionModel(type: .accrual, amount: 20, description: "Санкт Петербург Московская Площадь"),
            TransactionModel(type: .payment, amount: 20, description: "Санкт Петербург Московская Площадь")]
        
        data["21 ноября 2021"] = [
            TransactionModel(type: .accrual, amount: 20, description: "Санкт Петербург Московская Площадь"),
            TransactionModel(type: .payment, amount: 20, description: "Санкт Петербург Московская Площадь"),
            TransactionModel(type: .accrual, amount: 20, description: "Санкт Петербург Московская Площадь")]
        
        data["20 ноября 2021"] = [
            TransactionModel(type: .accrual, amount: 20, description: "Санкт Петербург Московская Площадь"),
            TransactionModel(type: .payment, amount: 20, description: "Санкт Петербург Московская Площадь"),
            TransactionModel(type: .accrual, amount: 20, description: "Санкт Петербург Московская Площадь"),
            TransactionModel(type: .payment, amount: 20, description: "Санкт Петербург Московская Площадь")]
        
        sectionTitles = data.keys.map { $0 }
    }
    
    func getModel(indexPath: IndexPath) -> TransactionModel {
        data[sectionTitles[indexPath.section - 1]]?[indexPath.row] ?? TransactionModel(type: .accrual, amount: 0, description: "")
    }
    
    func numberOfItems(section: Int) -> Int {
        if section == 0 {
            return 0
        }
        
        return data[sectionTitles[section - 1]]?.count ?? 0
    }
    
    func getCellPosition(indexPath: IndexPath) -> TransactionCollectionViewCellPosition {
        let sectionData = data[sectionTitles[indexPath.section - 1]]
        
        if sectionData?.count == 1 {
            return .all
        }
        
        if indexPath.row == 0 {
            return .top
        }
        
        if indexPath.row == (sectionData?.count ?? 0) - 1 {
            return .bottom
        }
        
        return .center
    }
}
