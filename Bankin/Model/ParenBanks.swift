//
//  ParenBanks.swift
//  CountryListModel
//
//  Created by ben lassoued sami on 17/01/2022.
//


import Foundation
struct ParenBanks : Codable {
    let id: Int?
	let name : String?
	let logoUrl : String?
	//let banks : [Banks]?
    let countryCode : String?

	enum CodingKeys: String, CodingKey {
        
        case id = "id"
		case name = "name"
		case logoUrl = "logo_url"
		//case banks = "banks"
        case countryCode = "country_code"
		
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
		name = try values.decodeIfPresent(String.self, forKey: .name)
        logoUrl = try values.decodeIfPresent(String.self, forKey: .logoUrl)
	//	banks = try values.decodeIfPresent([Banks].self, forKey: .banks)
        countryCode = try values.decodeIfPresent(String.self, forKey: .countryCode)
	}
    
    init(id:Int,name : String,countryCode : String){
        self.id = id
        self.name = name
        self.countryCode = countryCode
        self.logoUrl = ""
    }
    
}
