//
//  CharacterListViewModel.swift
//  RickAndMorty
//
//  Created by Nikita Soldatov on 26.11.2019.
//  Copyright © 2019 Nikita Soldatov. All rights reserved.
//

import SwiftUI
import Combine

class CharacterListViewModel: ObservableObject {
  @Published var dataSource: [CharacterRowViewModel] = []
  private var nextPageURL: URL?
  private let characterFetcher: CharacterFetchable
  private var disposables = Set<AnyCancellable>()
  
  init(
    characterFetcher: CharacterFetchable = CharacterFetcher()
  ) {
    self.characterFetcher = characterFetcher
  }
  
  func loadCharacters() {
    characterFetcher.fetchCharacters()
      .map { response in
        response.results.map { charcter in
          CharacterRowViewModel(
            id: charcter.id,
            name: charcter.name,
            avatarURL: charcter.image
          )
        }
    }
    .receive(on: DispatchQueue.main)
    .sink(
      receiveCompletion: { [weak self] value in
        guard let self = self else { return }
        switch value {
        case .failure:
          self.dataSource = []
        case .finished:
          break
        }
      },
      receiveValue: { [weak self] forecast in
        guard let self = self else { return }
        self.dataSource = forecast
    })
    .store(in: &disposables)
  }
}
