//
//  Banks.swift
//  CountryListModel
//
//  Created by ben lassoued sami on 17/01/2022.
//

import Foundation
struct CountryListModel : Decodable {
	let resources : [Resources]?
    let country_code : String?
	enum CodingKeys: String, CodingKey {
		case resources = "resources"
        case country_code = "country_code"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		resources = try values.decodeIfPresent([Resources].self, forKey: .resources)
        country_code = try values.decodeIfPresent(String.self, forKey: .country_code)
	}
}
