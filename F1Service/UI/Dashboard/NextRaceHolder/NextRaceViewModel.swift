//
//  NextRaceViewModel.swift
//  F1Service
//
//  Created by Wishi on 15.01.2024.
//

import Foundation

class NextRaceViewModel: ObservableObject {
        
    @Published var nextRaceModel: NextRaceModel? = nil
    
    @Published var isState: Launcher.UIState? = nil
    
    let baseURL = URL(string: "https://ergast.com/api/f1/current/next.json")!
    
    /**
     This variable keeps the firebase services
     */
    
    let firebaseServices = FirebaseServices.firebaseServices
    
    /**
     This function takes the data for next race at Ergast API
     */
    
    func getNextRaceData() async {
        isState = Launcher.UIState.loading
        let request = URLRequest(url: baseURL)
        let task = URLSession.shared.dataTask(with: request) { data , response, error in
            if let data = data {
                let jsonData = Data(data)
                do {
                    let encode = try JSONDecoder().decode(NextRaceModel.self, from: jsonData)
                    DispatchQueue.main.async {
                        self.nextRaceModel = encode
                        self.isState = Launcher.UIState.successful
                    }
                    
                } catch {
                    print(error)
                    self.isState = Launcher.UIState.fetchDataError
                }
            }
            else if let error = error {
                print(error)
                self.isState = Launcher.UIState.fetchDataError
            }
        }
        task.resume()

    }
    
    func getCountryFlagURL(name : String) -> String {
        return firebaseServices.getCountyFlagURL(name: name)
    }
}

