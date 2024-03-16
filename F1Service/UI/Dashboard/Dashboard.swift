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
    @StateObject var driverStandingViewModel = DriverStandingViewModel()
    @StateObject var constructorStandingViewModel = ConstructorViewModel()
    @StateObject var raceListViewModel = RaceListViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 8) {
                    AppTitle()
                    //This section goes to the Next Race with the Navigation
                    NavigationLink {
                        if let nextRaceModel = nextRaceViewModel.nextRaceModel?.mrData.raceTable.races[0].raceName {
                            NextRaceUI().navigationTitle("Next Race")
                        }
                    } label: {
                        NextRaceHolder(viewModel: self.nextRaceViewModel).foregroundColor(Color("PrimaryTextColor"))
                    }
                    //--------
                    
                    //This section goes to the Race Results with the Navigation
                  NavigationLink {
                        if let results = raceResultsViewModel.lastRaceResultModel?.mrData.raceTable.races[0] {
                            RaceResults(viewModel: raceResultsViewModel).navigationTitle("Race Results")
                        }
                    } label: {
                        RaceResultHolder(viewModel: raceResultsViewModel).foregroundColor(Color("PrimaryTextColor"))
                    }
                    //--------
                    
                    Title(key: "Standing")
                    SubTitle(key: "Driver Standing")
                
                    //This section goes to the Driver Standing with the Navigation
                    NavigationLink {
                        DriverStandingPage(
                        viewModel: driverStandingViewModel
                        ).navigationTitle("Driver Standings")
                    } label: {
                        DriverStanding(
                        viewModel: driverStandingViewModel
                        ).foregroundColor(Color("PrimaryTextColor"))
                    }
                    //-------
                    
                    Spacer(minLength: 12)
                    SubTitle(key: "Constructor Standing")

                    
                    // This section goes to the Constructor Standing with the Navigation
                    NavigationLink {
                        ConstructorStandingPage(
                        viewModel: constructorStandingViewModel
                        ).navigationTitle("Constructor Standing")
                    } label: {
                        ConstructorsStanding(viewModel: constructorStandingViewModel).foregroundColor(Color("PrimaryTextColor"))
                    }
                    //-------
                    
                    // This section goes the Race List Page with Navigation
                    NavigationLink {
                        RaceList(
                            viewModel: raceListViewModel
                        ).navigationTitle("Race List")
                    } label: {
                        RaceList(viewModel: raceListViewModel).foregroundColor(Color("PrimaryTextColor"))
                    }
                    //--------

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
