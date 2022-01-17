//
//  String+Extensions.swift
//  Bankin
//
//  Created by ben lassoued sami on 17/01/2022.
//

import Foundation
import UIKit

extension String {
    /// convert  image to DATA
    func toData(completion: @escaping ((Data?) -> Void)){
        if let url = URL(string: self){
            DispatchQueue.global().async {
                if let data = try? Data(contentsOf: url){
                    DispatchQueue.main.async {
                       completion(data)
                   }
                }
            }
        }
        completion(nil)
    }
}
