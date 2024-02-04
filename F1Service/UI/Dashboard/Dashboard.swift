//
//  Dashboard.swift
//  F1Service
//
//  Created by Wishi on 26.12.2023.
//

import SwiftUI

struct Dashboard: View {
    
    @StateObject var nextRaceViewModel = NextRaceViewModel()
    @StateObject var raceResultsViewModel = RaceResultViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 8) {
                    AppTitle()
                    NavigationLink {
                        if let nextRaceModel = nextRaceViewModel.nextRaceModel?.mrData.raceTable.races[0].raceName {
                            NextRaceUI().navigationTitle(nextRaceModel)
                        }
                    } label: {
                        NextRaceHolder(viewModel: self.nextRaceViewModel).foregroundColor(Color("PrimaryTextColor"))
                    }
                    NavigationLink {
                        if let results = raceResultsViewModel.lastRaceResultModel?.mrData.raceTable.races[0] {
                            RaceResults(viewModel: raceResultsViewModel).navigationTitle(results.raceName)
                        }
                    } label: {
                        RaceResultHolder(viewModel: raceResultsViewModel).foregroundColor(Color("PrimaryTextColor"))
                    }

                    Standing()
                    RaceList()

                }
            }.padding(.top,1)
            .background(Color("PrimaryColor"))
            
        }
    }
}

/*
 This view keeps the app title and app icon for Next Race CardView
 */

struct AppTitle: View {
    var body: some View {
        HStack(spacing: 8){            
            Text("F1 Service").font(.custom("KumbhSans-Regular", size: 36))
                .foregroundColor(Color("PrimaryTextColor"))
                .background(Color("Transparent"))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top,30)
                .padding(.leading,30)
        }
    }
}

struct Dashboard_Previews: PreviewProvider {
    static var previews: some View {
        Dashboard()
    }
}
