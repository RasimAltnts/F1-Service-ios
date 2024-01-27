// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? JSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Welcome
struct ConstructorStandingModel: Codable {
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
        let standingsTable: StandingsTable

        enum CodingKeys: String, CodingKey {
            case xmlns, series, url, limit, offset, total
            case standingsTable = "StandingsTable"
        }
    }

    // MARK: - StandingsTable
    struct StandingsTable: Codable {
        let season: String
        let standingsLists: [StandingsList]

        enum CodingKeys: String, CodingKey {
            case season
            case standingsLists = "StandingsLists"
        }
    }

    // MARK: - StandingsList
    struct StandingsList: Codable {
        let season, round: String
        let constructorStandings: [ConstructorStanding]

        enum CodingKeys: String, CodingKey {
            case season, round
            case constructorStandings = "ConstructorStandings"
        }
    }

    // MARK: - ConstructorStanding
    struct ConstructorStanding: Codable {
        let position, positionText, points, wins: String
        let constructor: Constructor

        enum CodingKeys: String, CodingKey {
            case position, positionText, points, wins
            case constructor = "Constructor"
        }
    }

    // MARK: - Constructor
    struct Constructor: Codable {
        let constructorID: String
        let url: String
        let name, nationality: String

        enum CodingKeys: String, CodingKey {
            case constructorID = "constructorId"
            case url, name, nationality
        }
    }
}

