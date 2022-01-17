//
//  Banks.swift
//  CountryListModel
//
//  Created by ben lassoued sami on 17/01/2022.
//

import Foundation
struct CountryListModel : Decodable {
	let resources : [Resources]?
	enum CodingKeys: String, CodingKey {
		case resources = "resources"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		resources = try values.decodeIfPresent([Resources].self, forKey: .resources)
    }
    
    init(resources : [Resources]){
        self.resources = resources
    }
}
