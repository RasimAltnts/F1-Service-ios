//
//  FirebaseServices.swift
//  F1Service
//
//  Created by Wishi on 12.01.2024.
//

import Foundation
import Firebase

class FirebaseServices {
    
    static let firebaseServices = FirebaseServices()

    init() {
        getDriverImage()
        getCounryFlag()
        getConstructorImage()
    }
    
    struct mappingDict {
        var name: String = ""
        var url: String = ""
    }
    
    
    let db = Firestore.firestore()
    
    /**
     This variable keeps the driver list with array. it takes value from firebase
     */
    private var driverMapping: [mappingDict] = []
    
    /**
     This variable keeps the county flag list with array. it takes value from firebase
     */
    private var countryFlagMapping: [mappingDict] = []
    
    /**
     This variable keeps the constructor list with array. it takes value from firebase
     */
    private var constuctorMapping: [mappingDict] = []
    
    
    /**
     This function gets driver image list from firabase.
     */
    private func getDriverImage() {
        self.db.collection("DriverImageURL").addSnapshotListener { [unowned self] (snapshot, error) in
            guard let snapshot = snapshot else {
                print("Error fetching snapshot results: \(error!)")
                return
            }
            snapshot.documents.map { (queryDocumentSnapshot) in
                let data = queryDocumentSnapshot.data()
                data.forEach { (key: String, value: Any) in
                    driverMapping.append(
                    mappingDict(
                        name: key,
                        url: value as? String ?? ""
                        )
                    )
                }
            }
        }
    }
    
    /**
     This function gets county flag image list from firabase.
     */
    private func getCounryFlag() {
        self.db.collection("CountryFlagURL").addSnapshotListener { [unowned self] (snapshot, error) in
            guard let snapshot = snapshot else {
                print("Error fetching snapshot results: \(error!)")
                return
            }
            snapshot.documents.map { (queryDocumentSnapshot) in
                let data = queryDocumentSnapshot.data()
                data.forEach { (key: String, value: Any) in
                    countryFlagMapping.append(
                    mappingDict(
                        name: key,
                        url: value as? String ?? ""
                        )
                    )
                }
            }
        }
    }
    
    /**
     This function gets county flag image list from firabase.
     */
    private func getConstructorImage() {
        self.db.collection("TeamImageURL").addSnapshotListener { [unowned self] (snapshot, error) in
            guard let snapshot = snapshot else {
                print("Error fetching snapshot results: \(error!)")
                return
            }
            snapshot.documents.map { (queryDocumentSnapshot) in
                let data = queryDocumentSnapshot.data()
                data.forEach { (key: String, value: Any) in
                    constuctorMapping.append(
                    mappingDict(
                        name: key,
                        url: value as? String ?? ""
                        )
                    )
                }
            }
        }
    }
    
    
    /**
     This function return the url for driver image
     
     params: name -> driver name
     return: string url for driver image
     */
    func getDriverImageURL(name : String) -> String {
        if let foundMapping = driverMapping.first(where: {$0.name == name}) {
            return foundMapping.url
        }
        return ""
    }
    
    /**
     This function return the url for counry flag
     
     params: name -> country name
     return: string url for country flag
     */
    func getCountyFlagURL(name: String) -> String {
        if let foundMapping = countryFlagMapping.first(where: {$0.name == name}) {
            return foundMapping.url
        }
        return ""
    }
    
    /**
     This function return the url for counry flag
     
     params: name -> country name
     return: string url for country flag
     */
    func getConstructorURL(name: String) -> String {
        if let foundMapping = constuctorMapping.first(where: {$0.name == name}) {
            return foundMapping.url
        }
        return ""
    }
}
