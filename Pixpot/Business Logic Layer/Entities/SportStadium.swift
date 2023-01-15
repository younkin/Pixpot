//
//  SportStadium.swift
//  Pixpot
//
//  Created by Евгений Юнкин on 15.01.23.
//

import Foundation


// MARK: - Welcome
struct SportStadium: Codable {
    let type: String?
    let features: [Feature]
}

// MARK: - Feature
struct Feature: Codable {
    let type: String?
    let properties: Properties
    let geometry: Geometry
}

// MARK: - Geometry
struct Geometry: Codable {
    let type: String?
    let coordinates: [Double]
}

// MARK: - Properties
struct Properties: Codable {
    let name, country, countryCode, state: String
    let city, postcode, suburb, street: String
    let housenumber: String
    let lon, lat: Double
    let stateCode, formatted, addressLine1, addressLine2: String
    let categories, details: [String]
    let datasource: Datasource
    let placeID: String

    enum CodingKeys: String, CodingKey {
        case name, country
        case countryCode = "country_code"
        case state, city, postcode, suburb, street, housenumber, lon, lat
        case stateCode = "state_code"
        case formatted
        case addressLine1 = "address_line1"
        case addressLine2 = "address_line2"
        case categories, details, datasource
        case placeID = "place_id"
    }
}

// MARK: - Datasource
struct Datasource: Codable {
    let sourcename, attribution, license: String
    let url: String
    let raw: Raw
}

// MARK: - Raw
struct Raw: Codable {
    let name, sport: String
    let height, osmID: Int
    let leisure, nameEn, nameKo: String
    let website: String
    let osmType, wikidata, wikipedia, addrStreet: String
    let addrPostcode: Int
    let buildingPart: String
    let addrHousenumber: Int

    enum CodingKeys: String, CodingKey {
        case name, sport, height
        case osmID = "osm_id"
        case leisure
        case nameEn = "name:en"
        case nameKo = "name:ko"
        case website
        case osmType = "osm_type"
        case wikidata, wikipedia
        case addrStreet = "addr:street"
        case addrPostcode = "addr:postcode"
        case buildingPart = "building:part"
        case addrHousenumber = "addr:housenumber"
    }
}
