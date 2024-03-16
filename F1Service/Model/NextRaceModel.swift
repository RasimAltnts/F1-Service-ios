// This file was generated from JSON Schema using codebeautify, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//

import Foundation

struct NextRaceModel: Codable {
    let mrData: MRData
    
    enum CodingKeys: String, CodingKey {
        case mrData = "MRData"
    }
    
    // MARK: - MRData
    struct MRData: Codable {
        let xmlns: String
        let series: String
        let url: String
        let limit, offset, total: String
        let raceTable: RaceTable
        
        enum CodingKeys: String, CodingKey {
            case xmlns, series, url, limit, offset, total
            case raceTable = "RaceTable"
        }
    }

    // MARK: - RaceTable
    struct RaceTable: Codable {
        let season, round: String
        let races: [Race]
        
        enum CodingKeys: String, CodingKey {
            case season, round
            case races = "Races"
        }
    }

    // MARK: - Race
    struct Race: Codable {
        let season, round: String
        let url: String
        let raceName: String
        let circuit: Circuit
        let date: String
        let time: String
        let firstPractice: Practice
        let secondPractice: Practice
        let qualifying: Practice
    
        
        enum CodingKeys: String, CodingKey {
            case season, round, url, raceName
            case circuit = "Circuit"
            case date = "date"
            case time = "time"
            case firstPractice = "FirstPractice"
            case secondPractice = "SecondPractice"
            case qualifying = "Qualifying"
        }
    }

    // MARK: - Circuit
    struct Circuit: Codable {
        let circuitID: String
        let url: String
        let circuitName: String
        let location: Location
        
        
        enum CodingKeys: String, CodingKey {
            case circuitID = "circuitId"
            case url, circuitName
            case location = "Location"
        }
    }

    // MARK: - Location
    struct Location: Codable {
        let lat, long, locality, country: String
    }
    
   struct Practice: Codable {
        let date: String
        let time: String
        
        enum CodingKeys: String,CodingKey {
            case date = "date"
            case time = "time"
        }
    }
}

