//
//  RaceListView.swift
//  F1Service
//
//  Created by Wishi on 17.03.2024.
//

import SwiftUI

struct RaceListView: View {
    
    @StateObject var viewModel: RaceListViewModel = RaceListViewModel()
    
    var body: some View {
        if let result = viewModel.raceList?.mrData.raceTable {
            SubTitle(key: result.season + "Season Race Calendar").padding(.top,20)
            Spacer(minLength: 12)
            ScrollView(.vertical) {
                ForEach(0 ... result.races.count - 1,id: \.self) { index in
                    RaceListItem(
                        img_url: viewModel.getCountryFlagURL(name: result.races[index].circuit.location.country),
                        circiut_name: result.races[index].circuit.circuitName,
                        country: result.races[index].circuit.location.country,
                        date: result.races[index].date
                    )
                }
            }
        }
    }
}

#Preview {
    RaceListView()
}
