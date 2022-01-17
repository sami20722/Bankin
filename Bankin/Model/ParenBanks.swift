//
//  ParenBanks.swift
//  CountryListModel
//
//  Created by ben lassoued sami on 17/01/2022.
//


import Foundation
struct ParenBanks : Codable {
	let name : String?
	let logoUrl : String?
	let banks : [Banks]?
	

	enum CodingKeys: String, CodingKey {

		case name = "name"
		case logoUrl = "logo_url"
		case banks = "banks"
		
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		name = try values.decodeIfPresent(String.self, forKey: .name)
        logoUrl = try values.decodeIfPresent(String.self, forKey: .logoUrl)
		banks = try values.decodeIfPresent([Banks].self, forKey: .banks)
	}
}
