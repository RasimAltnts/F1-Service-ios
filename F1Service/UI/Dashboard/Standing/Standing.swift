//
//  Standing.swift
//  F1Service
//
//  Created by Wishi on 16.01.2024.
//

import SwiftUI

struct Standing: View {
    var body: some View {
        VStack(spacing: 10) {
            Title(key: "Standing")
            SubTitle(key: "Driver Standing")
            DriverStanding()
            Spacer(minLength: 12)
            SubTitle(key: "Constructor Standing")
            ConstructorsStanding()
        }
    }
}

struct DriverStanding: View {
    @StateObject var viewModel = DriverStandingViewModel()
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            if let uiState = viewModel.uiState {
                switch uiState {
                case .loading:
                    ProgressView()
                    
                case .successful:
                    if let result = viewModel.driverStanding?.mrData.standingsTable {
                        DriverStandingView(
                            driverStanding: result,
                            onImageFunc: viewModel.getDriverImage)
                    }
                    
                case .fetchDataError:
                    Text("Someting Goes Wrong").frame(maxWidth: .infinity, maxHeight: 290)
                }
            }
        }.task {
            await viewModel.getDriverStanding()
        }
    }
}


struct DriverStandingView: View {
    var driverStanding:DriverStandingModel.StandingsTable? = nil
    
    var onImageFunc: ((String) -> String)
    
    var body: some View {
        if let results = driverStanding?.standingsLists[0] {
            StandingItem(
                standingImageURL: onImageFunc(results.driverStandings[0].driver.givenName),
                standingName: results.driverStandings[0].driver.givenName + " " + results.driverStandings[0].driver.familyName,
                standingPoint: results.driverStandings[0].points + " P")
            StandingItem(
                standingImageURL: onImageFunc(results.driverStandings[1].driver.givenName),
                standingName: results.driverStandings[1].driver.givenName + " " + results.driverStandings[1].driver.familyName,
                standingPoint: results.driverStandings[1].points + " P")
            StandingItem(
                standingImageURL: onImageFunc(results.driverStandings[2].driver.givenName),
                standingName: results.driverStandings[2].driver.givenName + " " + results.driverStandings[2].driver.familyName,
                standingPoint: results.driverStandings[2].points + " P")
        }
    }
}

struct ConstructorsStanding: View {
    @StateObject var viewModel = ConstructorViewModel()
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            
            if let uiState = viewModel.uiState {
                switch uiState {
                case .loading:
                    ProgressView()
                case .successful:
                    if let results = viewModel.constructorStanding?.mrData.standingsTable {
                        ConstructorStandingView(
                            constructorStanding: results,
                            onImageFunc: viewModel.getConstructorImageURL
                        )
                    }
                case .fetchDataError:
                    Text("Someting Goes Wrong").frame(maxWidth: .infinity, maxHeight: 290)
                }
            }
            
        }.task {
            await viewModel.getConstructorStanging()
        }
    }
}


struct ConstructorStandingView: View {
    
    var constructorStanding: ConstructorStandingModel.StandingsTable? = nil
    
    var onImageFunc: ((String) -> String)
    
    var body: some View {
        if let results = constructorStanding?.standingsLists[0].constructorStandings {
            StandingItem(
                standingImageURL: onImageFunc(results[0].constructor.constructorID),
                standingName: results[0].constructor.name ,
                standingPoint: results[0].points + " P")
            StandingItem(
                standingImageURL: onImageFunc(results[1].constructor.constructorID),
                standingName: results[1].constructor.name ,
                standingPoint: results[1].points + " P")
            StandingItem(
                standingImageURL: onImageFunc(results[2].constructor.constructorID),
                standingName: results[2].constructor.name ,
                standingPoint: results[2].points + " P")
        }
    }
}

#Preview {
    Standing()
}
