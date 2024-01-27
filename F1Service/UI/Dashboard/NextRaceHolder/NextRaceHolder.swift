//
//  NextRaceHolder.swift
//  F1Service
//
//  Created by Wishi on 28.12.2023.
//

import SwiftUI

struct NextRaceHolder: View {
    
    @StateObject var viewModel = NextRaceViewModel()
    
    var onItemTapped: ((NextRaceModel?) -> Void)?
    
    var body: some View {
        VStack(spacing: 12) {
            
            if let uiState = viewModel.isState {
                switch uiState {
                case .loading:
                    ProgressView()
                case .successful:
                    if let races = viewModel.nextRaceModel?.mrData.raceTable.races[0] {
                        NextRaceResultView(races: races, imageURL: viewModel.getCountryFlagURL(name: races.circuit.location.country))
                    }
                case .fetchDataError:
                    Text("Someting Goes Wrong").frame(maxWidth: .infinity, maxHeight: 290)
                }
            }

        }.frame(maxWidth: .infinity, maxHeight: 290)
            .cornerRadius(15)
            .shadow(radius: 5)
            .padding(10)
            .onTapGesture {
                onItemTapped?(viewModel.nextRaceModel)
            }
            .task {
                await viewModel.getNextRaceData()
             }
    }
}

struct NextRaceResultView: View {
    var races: NextRaceModel.Race? = nil
    var imageURL: String = ""
    var body: some View {
        if let race = races {
            Title(key: race.raceName)
            ZStack() {
                Holder(img: imageURL)
                NextRaceInfoLayer(
                    country: race.circuit.location.country,
                    circuit_name: race.circuit.circuitName,
                    date: race.date).padding(10)
            }.cornerRadius(15)
            //UnderlineView()
        }
    }
}


struct NextRaceInfoLayer: View {
    var country: String = ""
    var circuit_name: String = ""
    var date: String = ""
    var counter: String = "0"
     
    var body: some View {
        HStack {
            VStack(alignment: HorizontalAlignment.leading,spacing: 8) {
                Text(country).font(.custom("KumbhSans-Regular", size: 18))
                Text(circuit_name).font(.custom("KumbhSans-Regular", size: 18))
                Text(date).font(.custom("KumbhSans-Regular", size: 18))
                CountDownTimerScheduleCard()
            }
            Spacer()
        }
    }
}

struct CountDownTimerScheduleCard: View {
    var days: String = "15"
    var hour: String = "15"
    var minutes: String = "15"
    var seconds: String = "15"
    
    var body: some View {
        HStack(spacing:16) {
            TimerScheduleComponent(item: days)
            TimerScheduleComponent(item: hour)
            TimerScheduleComponent(item: minutes)
            TimerScheduleComponent(item: seconds)
        }
    }
}

struct TimerScheduleComponent: View {
    var item: String = "0"
    var body: some View {
        Text(item).font(.custom("KumbhSans-Light", size: 32)).opacity(0.5)
    }
}


#Preview {
    NextRaceHolder()
}
