//
//  UIImageView+Extensions.swift
//  Bankin
//
//  Created by ben lassoued sami on 17/01/2022.
//

import UIKit

extension UIImageView {
    func load(urlString: String) {
        DispatchQueue.global().async { [weak self] in
            guard let url = URL(string: urlString) else {return}
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
            else{
                DispatchQueue.main.async {
                    self?.image = UIImage(named: "no-image")
                }
            }
        }
    }
}
