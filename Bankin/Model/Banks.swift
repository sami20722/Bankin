//
//  Banks.swift
//  Bankin
//
//  Created by ben lassoued sami on 17/01/2022.
//

import Foundation
struct Banks : Codable {
	let id : Int?
	let name : String?


	enum CodingKeys: String, CodingKey {

		case id = "id"
		case name = "name"

	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		id = try values.decodeIfPresent(Int.self, forKey: .id)
		name = try values.decodeIfPresent(String.self, forKey: .name)
	}

}
