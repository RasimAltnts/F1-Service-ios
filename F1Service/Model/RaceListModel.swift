// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? JSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Welcome
struct RaceListModel: Codable {
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
        let season: String
        let races: [Race]

        enum CodingKeys: String, CodingKey {
            case season
            case races = "Races"
        }
    }

    // MARK: - Race
    struct Race: Codable {
        let season, round: String
        let url: String
        let raceName: String
        let circuit: Circuit
        let date, time: String
        let firstPractice, secondPractice: FirstPractice
        let thirdPractice: FirstPractice?
        let qualifying: FirstPractice
        let sprint: FirstPractice?

        enum CodingKeys: String, CodingKey {
            case season, round, url, raceName
            case circuit = "Circuit"
            case date, time = ""
            case firstPractice = "FirstPractice"
            case secondPractice = "SecondPractice"
            case thirdPractice = "ThirdPractice"
            case qualifying = "Qualifying"
            case sprint = "Sprint"
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

    // MARK: - FirstPractice
    struct FirstPractice: Codable {
        let date, time: String
    }

}

