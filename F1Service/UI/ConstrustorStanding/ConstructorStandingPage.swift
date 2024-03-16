//
//  ConstructorStandingPage.swift
//  F1Service
//
//  Created by Wishi on 5.02.2024.
//

import SwiftUI

struct ConstructorStandingPage: View {
    
    @StateObject var viewModel = ConstructorViewModel()
    
    var body: some View {
        if let result = viewModel.constructorStanding?.mrData.standingsTable.standingsLists[0].constructorStandings {
            ScrollView(.vertical) {
                ForEach(0 ... result.count - 1,id: \.self) { index in
                    StandingItem(
                        standingImageURL: viewModel.getConstructorImageURL(name: result[index].constructor.constructorID),
                        standingName: result[index].constructor.name,
                        standingPoint: result[index].points + " P"
                    )
                }
            }
        }
    }
}

#Preview {
    ConstructorStandingPage()
}
