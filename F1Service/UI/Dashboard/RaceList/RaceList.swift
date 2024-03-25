//
//  RaceList.swift
//  F1Service
//
//  Created by Wishi on 20.01.2024.
//

import SwiftUI

struct RaceList: View {
     @StateObject var viewModel = RaceListViewModel()
        
    var body: some View {
        VStack{
            Title(key: "Race Calendar")
            if let uiState = viewModel.uiState {
                switch uiState {
                case .loading:
                    ProgressView()
                case .successful:
                    if let results = viewModel.raceList?.mrData.raceTable {
                        RaceListHolder(results: results, onImageFunc: viewModel.getCountryFlagURL)
                    }
                case .fetchDataError:
                    Text("Someting Goes Wrong").frame(maxWidth: .infinity, maxHeight: 290)
                }
            }
        }.task {
            await viewModel.getRaceList()
        }
    }
    
}

struct RaceListHolder: View {
    var results: RaceListModel.RaceTable? = nil
    var onImageFunc: ((String) -> String)
    var body: some View {
        if let result = results {
            RaceListItem(img_url: onImageFunc(result.races[0].circuit.location.country),
                         circiut_name: result.races[0].circuit.circuitName,
                         country: result.races[0].circuit.location.country,
                         date: result.races[0].date)
            
            RaceListItem(img_url: onImageFunc(result.races[1].circuit.location.country),
                         circiut_name: result.races[1].circuit.circuitName,
                         country: result.races[1].circuit.location.country,
                         date: result.races[1].date)
            
            RaceListItem(img_url: onImageFunc(result.races[2].circuit.location.country),
                         circiut_name: result.races[2].circuit.circuitName,
                         country: result.races[2].circuit.location.country,
                         date: result.races[2].date)
        }
    }
}

#Preview {
    RaceList()
}
