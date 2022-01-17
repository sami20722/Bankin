//
//  Sevice.swift
//  Bankin
//
//  Created by ben lassoued sami on 17/01/2022.
//

import Foundation

protocol ServiceProtocol {
    func callApi(completion: @escaping (CountryListModel?) -> Void)
}

class Service :ServiceProtocol{
   
    
    static let shared = Service()

    func callApi( completion: @escaping (CountryListModel?) -> Void){
        var coutrys : CountryListModel!
        guard let url = URL(string: "https://sync.bankin.com/v2/banks?limit=100&client_id=dd6696c38b5148059ad9dedb408d6c84&client_secret=56uolm946ktmLTqNMIvfMth4kdiHpiQ5Yo8lT4AFR0aLRZxkxQWaGhLDHXeda6DZ") else { return
            completion(nil)
            }
        var request = URLRequest(url: url)
        request.setValue("2018-06-15", forHTTPHeaderField: "Bankin-Version")
        let task = URLSession.shared.dataTask(with: request) { data, _, _ in
            if let data = data{
                let decoder = JSONDecoder()
                do{
                    coutrys = try decoder.decode(CountryListModel.self, from: data)
                    completion(coutrys)
                }catch(let errorString){
                    print(errorString)
                    completion(nil)
                }
            }
        }
        
        task.resume()
    }
}
