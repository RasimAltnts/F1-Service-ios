//
//  RaceResultHolder.swift
//  F1Service
//
//  Created by Wishi on 31.12.2023.
//

import SwiftUI

struct RaceResultHolder: View {
    
   @StateObject var viewModel = RaceResultViewModel()
    
    var body: some View {
        VStack(spacing: 12) {
            
            if let uiState = viewModel.uiState {
                switch uiState {
                case .loading:
                    ProgressView()
                case .successful:
                    if let results = viewModel.lastRaceResultModel?.mrData.raceTable.races[0] {
                        RaceResultView(
                            results: results,
                            onImageFunc: viewModel.getDriverImage,
                            fastestLapDriver: viewModel.getFastestLapDriverName(),
                            fastestLapTime: viewModel.getFastestLapTime())
                    }
                case .fetchDataError:
                    Text("Someting Goes Wrong").frame(maxWidth: .infinity, maxHeight: 290)
                }
            }
        }.task {
            await viewModel.getLastRaceResults()
        }
    }
}

struct RaceResultView: View {
    var results: LastRaceResultsModel.Race? = nil
    var onImageFunc: ((String) -> String)
    
    var fastestLapDriver: String? = nil
    var fastestLapTime: String? = nil
    
    var body: some View {
        
        if let results = results {
            
            Title(key: results.raceName)
            
            ScrollView(.horizontal) {
                HStack {
                    ForEach(0...results.results.count - 1, id: \.self) { index in
                        RaceResultItem(
                            item: results.results[index],
                            imageURL: onImageFunc(results.results[index].driver.givenName)
                        )
                    }
                }.shadow(radius: 5)
                
            }.padding(.leading,12)
            .padding(.trailing,12)
        }
        
        if(fastestLapDriver != nil && fastestLapTime != nil) {
            ArragmentView(
                driver: fastestLapDriver!,
                time: fastestLapTime!)
        }
    }
}


struct RaceResultItem: View {
    var item: LastRaceResultsModel.Result? = nil
    var imageURL: String? = nil
    var body: some View {
        ZStack() {
            if let imageURL {
                Holder(img: imageURL, gradientState: false)
                RaceResultItemInfo(item: item)
            }
        }.frame(maxWidth: .infinity, maxHeight: 350)
            .cornerRadius(15)
            .padding(.leading,6)
            .padding(.top,6)
            .padding(.bottom,6)
    }
}

struct RaceResultItemInfo: View {
    var item: LastRaceResultsModel.Result? = nil
    var body: some View {
        HStack {
            VStack(alignment: HorizontalAlignment.leading,spacing: 8) {
                if let item {
                    DriverName(name: item.driver.givenName, surname: item.driver.familyName).padding(.leading,12).padding(.top,12)
                    Text(item.constructor.name).font(.custom("KumbhSans-Regular", size: 18)).padding(.leading,12)
                    PointLayer(point: item.points).padding(.leading,12).padding(.top,12)
                }
            }
            Spacer()
        }
    }
}

struct DriverName: View {
    var name: String = ""
    var surname: String = ""
    var body: some View {
        HStack(alignment: VerticalAlignment.center, spacing: 8) {
            Text(name).font(.custom("KumbhSans-Regular", size: 18))
            Text(surname).font(.custom("KumbhSans-Regular", size: 18))

        }
    }
}

struct PointLayer: View {
    var point: String = "asdas"
    var body: some View {
        HStack(alignment: VerticalAlignment.center, spacing: 8) {
            Text(point).font(.custom("KumbhSans-Light", size: 32)).opacity(0.5)
            Text("P").font(.custom("KumbhSans-Light", size: 32)).opacity(0.5)
        }
    }
}

#Preview {
    DriverName()
}

#Preview {
    RaceResultItemInfo()
}

#Preview {
    RaceResultHolder()
}

#Preview {
    RaceResultItem()
}
