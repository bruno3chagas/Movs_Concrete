//
//  LocalDataSaving.swift
//  ConcreteChallenge_BrunoChagas
//
//  Created by Bruno Chagas on 27/07/19.
//  Copyright © 2019 Bruno Chagas. All rights reserved.
//

import Foundation


class LocalDataSaving {
    
    static let userDefaults = UserDefaults.standard
    
    static func store(data: Entity, forKey key: String) {
        do {
            let encodedData: Data = try NSKeyedArchiver.archivedData(withRootObject: data, requiringSecureCoding: false)
            try encodedData.write(to: Bundle.main.url(forResource: "FavoriteMovies", withExtension: "plist")!)
//            LocalDataSaving.userDefaults.set(encodedData, forKey: key)
//            LocalDataSaving.userDefaults.synchronize()
        } catch {
            print(error)
        }

    }
    
    static func retrieve(forKey key: String) -> Any? {
        if let decodedData = LocalDataSaving.userDefaults.data(forKey: key) {
            do {
                let decodedType = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(decodedData)
//                let decodedType = try NSKeyedUnarchiver.unarchivedObject(ofClasses: [handler(type.self) as! AnyObject.Type], from: decodedData)
                return decodedType
            } catch {
                print("Retrieving data failed")
            }
        }
        return nil
    }
}
