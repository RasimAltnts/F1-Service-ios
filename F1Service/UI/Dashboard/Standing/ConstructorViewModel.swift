//
//  ConstructorViewModel.swift
//  F1Service
//
//  Created by Wishi on 19.01.2024.
//

import Foundation

class ConstructorViewModel: ObservableObject {
    /**
     This variable keeps the model of driver standings
     */
    @Published var constructorStanding: ConstructorStandingModel? = nil
    
    @Published var uiState: Launcher.UIState? = nil
    
    
    /**
     This variable keeps the url for driver standing
     */
    let driverStandingURL = URL(string: "https://ergast.com/api/f1/current/constructorStandings.json")!
    
    /**
     This variable keeps the firebase services
     */
    let firebaseServices = FirebaseServices.firebaseServices
    
    /**
     This variable gets the driver standing results
     */
    
    func getConstructorStanging() async {
        self.uiState = Launcher.UIState.loading
        let request = URLRequest(url: driverStandingURL)
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                let jsonData = Data(data)
                do {
                    let encode = try JSONDecoder().decode(ConstructorStandingModel.self, from: jsonData)
                    DispatchQueue.main.async {
                        self.constructorStanding = encode
                        self.uiState = Launcher.UIState.successful
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
    
    func getConstructorImageURL(name: String) -> String {
        return firebaseServices.getConstructorURL(name: name)
    }
}
