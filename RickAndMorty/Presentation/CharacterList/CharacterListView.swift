//
//  CharacterListView.swift
//  RickAndMorty
//
//  Created by Nikita Soldatov on 26.11.2019.
//  Copyright © 2019 Nikita Soldatov. All rights reserved.
//

import SwiftUI

struct CharacterListView: View {
  @ObservedObject var viewModel: CharacterListViewModel
  
  init(viewModel: CharacterListViewModel) {
    self.viewModel = viewModel
  }
  
  var body: some View {
    NavigationView {
      List {
        if viewModel.dataSource.isEmpty {
          loading
        } else {
          rows
        }
      }
      .onAppear(perform: viewModel.loadCharacters)
      .navigationBarTitle("Characters")
      .listStyle(GroupedListStyle())
    }
  }
}

extension CharacterListView {
  
  var rows: some View {
    Section { 
      ForEach(viewModel.dataSource, content: CharacterRow.init(viewModel:))
    }
  }
  
  var loading: some View {
    Section {
      Text("Loading's charcters...")
        .foregroundColor(.gray)
    }
  }
}

struct CharacterListView_Previews: PreviewProvider {
  static var previews: some View {
    CharacterListView(viewModel: CharacterListViewModel(characterFetcher: CharacterFetcher()))
  }
}

