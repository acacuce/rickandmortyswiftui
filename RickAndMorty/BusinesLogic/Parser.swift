//
//  Parser.swift
//  RickAndMorty
//
//  Created by Nikita Soldatov on 26.11.2019.
//  Copyright © 2019 Nikita Soldatov. All rights reserved.
//

import Foundation
import Combine

func decode<T: Decodable>(_ data: Data) -> AnyPublisher<T, NetworkError> {
  let decoder = JSONDecoder()
  decoder.dateDecodingStrategy = .secondsSince1970
  
  return Just(data)
    .decode(type: T.self, decoder: decoder)
    .mapError { error in
      .parsing(description: error.localizedDescription)
  }
  .eraseToAnyPublisher()
}
