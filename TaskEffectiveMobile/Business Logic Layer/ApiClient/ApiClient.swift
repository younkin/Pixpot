//
//  File.swift
//  TaskEffectiveMobile
//
//  Created by Евгений Юнкин on 09.12.22.
//

import Foundation
import Combine
import UIKit

enum APIError: Swift.Error, LocalizedError {

}

enum HTTPError: Swift.Error, LocalizedError {
    case invalidURLRequest
    case badServerResponse
    case responseParse
    case unknown

    var errorDescription: String? {
        switch self {
        case .invalidURLRequest:
            return NSLocalizedString("URLRequest вернул nil", comment: "invalidURLRequest")
        case .badServerResponse:
            return NSLocalizedString("Статус код сервера >299", comment: "badServerResponse")
        case .responseParse:
            return NSLocalizedString("Parse error", comment: "look console")
        case.unknown:
            return NSLocalizedString("Неизвестная ошибка", comment: "unknown")
        }
    }
}

class APIClient {

 // MARK: - Private Properties

    let session: URLSession
    let decoder: JSONDecoder

    // MARK: - Public Properties

     let requestBuilder: RequestBuildable

    // MARK: - Initialisers

    init(requestBuilder: RequestBuildable, session: URLSession, decoder: JSONDecoder) {
        self.requestBuilder = requestBuilder
        self.session = session
        self.decoder = decoder
    }

    // MARK: - Public Methods

    func performRequest<T: Decodable>(_ request: URLRequest?) -> AnyPublisher<T, Error> {
        guard let request = request else { return Fail(error: HTTPError.invalidURLRequest).eraseToAnyPublisher() }

        return session.dataTaskPublisher(for: request)
            .tryMap { (data, response) -> T in
                guard let httpResponse = response as? HTTPURLResponse,
                      (200..<300) ~= httpResponse.statusCode else { throw HTTPError.badServerResponse }
                do {
                    let encoded = try self.decoder.decode(T.self, from: data)
                    return encoded
                } catch let decodeError {
                    debugPrint(decodeError)
                    throw HTTPError.responseParse
                }
            }
            .eraseToAnyPublisher()
    }
}
