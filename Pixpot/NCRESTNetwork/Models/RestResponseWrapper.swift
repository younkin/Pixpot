//
//  File.swift
//  
//
//  Created by VLADIMIR LEVTSOV on 15.02.2022.
//

import Foundation

struct RestResponseWrapper<T: Decodable>: Decodable {
	let data: T
}
