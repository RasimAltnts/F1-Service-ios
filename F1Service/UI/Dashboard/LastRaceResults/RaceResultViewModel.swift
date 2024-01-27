//
//  RaceResultViewModel.swift
//  F1Service
//
//  Created by Wishi on 13.01.2024.
//

import Foundation

class RaceResultViewModel: ObservableObject {
    
    @Published var lastRaceResultModel: LastRaceResultsModel? = nil
    
    @Published var uiState: Launcher.UIState? = nil
    
    /**
     This variable keeps the url of last race results
     */
    
    let baseURL = URL(string: "https://ergast.com/api/f1/current/last/results.json")!
    
    /**
     This variable keeps the firebase services
     */
    
    let firebaseServices = FirebaseServices.firebaseServices
    
    /**
     This function gets the last race result from ergast service
     */
    
    func getLastRaceResults() async {
        self.uiState = Launcher.UIState.loading
        let request = URLRequest(url: baseURL)
        let task = URLSession.shared.dataTask(with: request) { data , response, error in
            if let data = data {
                let jsonData = Data(data)
                do {
                    let encode = try JSONDecoder().decode(LastRaceResultsModel.self, from: jsonData)
                    DispatchQueue.main.async {
                        self.uiState = Launcher.UIState.successful
                        self.lastRaceResultModel = encode
                    }
                    
                } catch {
                    print(error)
                    self.uiState = Launcher.UIState.fetchDataError
                }
            }
            else if let error = error {
                print(error)
                self.uiState = Launcher.UIState.fetchDataError
            }
        }
        task.resume()
    }
    
    /**
     This function gets driver image url from firebase services
     */
    
    func getDriverImage(name: String) -> String {
        return firebaseServices.getDriverImageURL(name: name)
    }
    
    
    /**
     This function gets the fastest lap time from ergast services
     */
    func getFastestLapTime() -> String {
        var result: String = ""
        if let rank = self.lastRaceResultModel?.mrData.raceTable.races[0].results.first(where: {$0.fastestLap.rank == "1"}) {
            result = rank.fastestLap.time.time + " s"
        }
        return result
    }
    
    
    /**
     This function gets the drivername for fastest lap
     */
    
    func getFastestLapDriverName() -> String {
        var result: String = ""
        if let rank = self.lastRaceResultModel?.mrData.raceTable.races[0].results.first(where: {$0.fastestLap.rank == "1"}) {
            result = rank.driver.givenName + " " + rank.driver.familyName
        }
        return result
    }

}
