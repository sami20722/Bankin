//
//  HomeViewModel.swift
//  Bankin
//
//  Created by ben lassoued sami on 17/01/2022.
//

import Foundation
import UIKit
class HomeViewModel {
    weak var coordinator : AppCoordinator!
    var apiClient: ServiceProtocol!
    
    var countryListModel : CountryListModel?
    
    init(apiClient: ServiceProtocol) {
        self.apiClient = apiClient
    }
    
    func fechData(completion: @escaping (Bool) -> Void){
        apiClient.callApi { countryListModel in
            guard let countryListModel = countryListModel else {return}
            self.countryListModel = countryListModel
            completion(true)
            DispatchQueue.main.async {
                self.saveData(countryListModel: countryListModel)
            }
        }
    }
    
    func saveData(countryListModel : CountryListModel){
        BanksCoreDataManager.shared.createData(countryListModel: countryListModel)
    }
}
