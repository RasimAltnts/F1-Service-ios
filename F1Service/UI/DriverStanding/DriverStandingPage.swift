//
//  DriverStandingPage.swift
//  F1Service
//
//  Created by Wishi on 4.02.2024.
//

import SwiftUI

struct DriverStandingPage: View {
    
    @StateObject var viewModel: DriverStandingViewModel = DriverStandingViewModel()
    
    var body: some View {
        if let result = viewModel.driverStanding?.mrData.standingsTable.standingsLists[0].driverStandings {
            ScrollView(.vertical) {
                ForEach(0 ... result.count - 1,id: \.self) { index in
                    StandingItem(
                        standingImageURL: viewModel.getDriverImage(name: result[index].driver.givenName),
                        constructorImageURL: viewModel.getConstructorImage(name: result[index].constructors[0].constructorId),
                        standingName: result[index].driver.givenName + " " + result[index].driver.familyName,
                        standingPoint: result[index].points + " P"
                    )
                }
            }
        }
    }
}

#Preview {
    DriverStandingPage()
}
