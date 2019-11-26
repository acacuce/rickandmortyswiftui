//
//  CharacterFetchable.swift
//  
//
//  Created by Nikita Soldatov on 26.11.2019.
//

import Combine
import Foundation

protocol CharacterFetchable {
  func fetchCharacters() -> AnyPublisher<PaginationItem<Character>, NetworkError>
}

class CharacterFetcher: CharacterFetchable {
  private let session: URLSession
  
  init(session: URLSession = .shared) {
    self.session = session
  }
}

extension CharacterFetcher {
  func fetchCharacters() -> AnyPublisher<PaginationItem<Character>, NetworkError> {
    guard let url = makeCharacterComponents().url else {
      let error = NetworkError.network(description: "Couldn't create URL")
      return Fail(error: error).eraseToAnyPublisher()
    }
    return session.dataTaskPublisher(for: URLRequest(url: url))
      .mapError { error in
        .network(description: error.localizedDescription)
    }
    .flatMap(maxPublishers: .max(1)) { pair in
      decode(pair.data)
    }
    .eraseToAnyPublisher()
  }
}

// MARK: - CharacterFetcher API
private extension CharacterFetcher {
  struct RickAndMortyAPI {
    static let scheme = "https"
    static let host = "rickandmortyapi.com"
    static let path = "/api"
  }
  
  func makeCharacterComponents() -> URLComponents {
    var components = URLComponents()
    components.scheme = RickAndMortyAPI.scheme
    components.host = RickAndMortyAPI.host
    components.path = "\(RickAndMortyAPI.path)/character"
    return components
  }
}

