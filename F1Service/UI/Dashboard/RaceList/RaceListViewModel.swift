//
//  RaceListViewModel.swift
//  F1Service
//
//  Created by Wishi on 20.01.2024.
//

import Foundation


class RaceListViewModel: ObservableObject {
    
    @Published var raceList: RaceListModel? = nil
    
    @Published var uiState: Launcher.UIState? = nil
    
    let baseURL: URL = URL(string: "https://ergast.com/api/f1/current.json")!
    
    private var firebase = FirebaseServices.firebaseServices
    
    func getRaceList() async {
        self.uiState = Launcher.UIState.loading
        let request = URLRequest(url: baseURL)
        let task = URLSession.shared.dataTask(with: request) {data , response, error in
            if let data = data {
                let jsonData = Data(data)
                do {
                    let encode = try JSONDecoder().decode(RaceListModel.self,from: jsonData)
                    DispatchQueue.main.async {
                        self.raceList = encode
                        self.uiState = Launcher.UIState.successful
                    }
                }catch {
                    print(error)
                    self.uiState = Launcher.UIState.fetchDataError
                }
            }
            
        }
        task.resume()
    }
    
    
    func getCountryFlagURL(name: String) -> String {
        return self.firebase.getCountyFlagURL(name: name)
    }
}
