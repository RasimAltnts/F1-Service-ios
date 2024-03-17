// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? JSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

struct RaceListModel: Codable {
    let mrData: MRData
    
    enum CodingKeys: String, CodingKey {
        case mrData = "MRData"
    }
    
    struct MRData: Codable {
        let xmlns,series,url,limit,offset,total: String
        let raceTable: RaceTable
        
        enum CodingKeys: String, CodingKey {
            case xmlns, series, url, limit, offset, total
            case raceTable = "RaceTable"
            
        }
    }
    
    struct RaceTable: Codable {
        let season: String
        let races: [Race]
        
        enum CodingKeys: String,CodingKey {
            case season
            case races = "Races"
        }
    }
    
    struct Race: Codable {
        let season, round, url, raceName, date, time : String
        let circuit: Circuit
        let firstPractice: Schedule
        let secondPractice: Schedule
        let thirdPractice: Schedule?
        let qualifying: Schedule
        let sprint: Schedule?
        
        enum CodingKeys: String, CodingKey {
            case season, round, url, raceName, date, time
            case circuit = "Circuit"
            case firstPractice = "FirstPractice"
            case secondPractice = "SecondPractice"
            case thirdPractice = "ThirdPractice"
            case qualifying = "Qualifying"
            case sprint = "Sprint"
        }
    }
    
    struct Circuit: Codable {
        let circuitId, url, circuitName: String
        let location: Location
        
        enum CodingKeys: String, CodingKey {
            case circuitId, url, circuitName
            case location = "Location"
        }
    }
    
    struct Schedule: Codable {
        let date,time: String
        
        enum CodingKeys: String, CodingKey {
            case date,time
        }
    }
    
    struct Location: Codable {
        let lat, long, locality, country: String
        
        enum CodingKeys: String, CodingKey {
            case lat, long, locality, country
        }
    }
}
