//
//  DriverStandingModel.swift
//  F1Service
//
//  Created by Wishi on 18.01.2024.
//

import Foundation

class DriverStandingModel: Codable {
    let mrData: MRData
    
    enum CodingKeys: String, CodingKey {
        case mrData = "MRData"
    }
    
    
    struct MRData: Codable {
        let xmlns: String
        let series: String
        let url: String
        let limit: String
        let offset: String
        let total: String
        let standingsTable: StandingsTable
        
        enum CodingKeys: String, CodingKey {
            case xmlns,series,url,limit,offset,total
            case standingsTable = "StandingsTable"
        }
    }
    
    struct StandingsTable: Codable {
        let season: String
        let standingsLists: [StandingsLists]
        
        enum CodingKeys: String, CodingKey {
            case season
            case standingsLists = "StandingsLists"
        }
    }
    
    struct StandingsLists: Codable {
        let season: String
        let round: String
        let driverStandings : [DriverStanding]
        
        enum CodingKeys: String, CodingKey {
            case season, round
            case driverStandings = "DriverStandings"
        }
    }
    
    struct DriverStanding: Codable {
        let position: String
        let positionText: String
        let points: String
        let wins: String
        let driver: drivers
        let constructors: [constructors]
        
        enum CodingKeys: String, CodingKey {
            case position, positionText, points, wins
            case driver = "Driver"
            case constructors = "Constructors"
        }
    }
    
    struct drivers: Codable {
        let driverId: String
        let permanentNumber: String
        let code: String
        let url: String
        let givenName: String
        let familyName: String
        let dateOfBirth: String
        let nationality: String
        
        
        enum CodingKeys: String, CodingKey {
            case driverId, permanentNumber, code, url , givenName, familyName, dateOfBirth, nationality
        }
    }
    
    struct constructors: Codable {
        let constructorId: String
        let url: String
        let name: String
        let nationality: String
        
        enum CodingKeys: String, CodingKey {
            case constructorId, name, url, nationality
        }

    }
}
 
