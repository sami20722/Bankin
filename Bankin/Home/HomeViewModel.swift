//
//  HomeViewModel.swift
//  Bankin
//
//  Created by ben lassoued sami on 17/01/2022.
//

import Foundation
class HomeViewModel {
    weak var coordinator : AppCoordinator!
    var apiClient: ServiceProtocol!
    
    var countryListModel : CountryListModel?
    
    init(apiClient: ServiceProtocol) {
        self.apiClient = apiClient
    }
    
    func fechData(completion: @escaping (Bool) -> Void){
        apiClient.callApi { countryListModel in
            self.countryListModel = countryListModel
            completion(true)
        }
    }
}
