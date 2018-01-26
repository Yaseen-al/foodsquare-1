//
//  FileManagerHelper.swift
//  foodsquare
//
//  Created by C4Q on 1/25/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import Foundation
import UIKit
enum FileManagerResponse: String {
    case alreadyExists
    case addedSuccessfully
}
class FileManagerHelper {
    private init() {}
    let savedCollectionPath = "savedCollections"
    static let manager = FileManagerHelper()
    private var savedCollection = [Collection(venues: nil, title: "My Favorite Restaurants", imageName: "restaurant logo")] {
        didSet {
            saveCollections()
        }
    }
    //This function takes a venue and a collection title and if the venue doesn't exist in a certain collection or if the collection venues is empty it will add the venue other wise it will skip it if it is already existing in the collecion Venues
    func addVenueToExistingCollection(addVenue: Venue, collectionTitle: String) -> FileManagerResponse {
        for i in 0..<savedCollection.count{
            if savedCollection[i].title == collectionTitle{
                guard var savedCollectionVenues = savedCollection[i].venues else{
                    var venues = [Venue]()
                    venues.append(addVenue)
                    savedCollection[i].venues = venues
                    saveCollections()
                    return .addedSuccessfully
                }
                guard !savedCollectionVenues.contains(where: {$0.name == addVenue.name}) else{
                    return .alreadyExists
                }
                
                savedCollectionVenues.append(addVenue)
                savedCollection[i].venues = savedCollectionVenues
                saveCollections()
                return .addedSuccessfully
            }
        }
        return .addedSuccessfully
    }
    func addNew(newCollection: Collection) {
        
        savedCollection.append(newCollection)
        
    }
    func getAllCollections() -> [Collection] {
        
        return savedCollection
    }
    
    private func saveCollections() {
        let propertyListEncoder = PropertyListEncoder()
        do {
            let encodedData = try propertyListEncoder.encode(savedCollection)
            let phoneURL = dataFilePath(withPathName: savedCollectionPath)
            try encodedData.write(to: phoneURL, options: .atomic)
        }
        catch {
            print(error.localizedDescription)
        }
    }
    
    func loadCollections() {
        let propertyListDecoder = PropertyListDecoder()
        do {
            let phoneURL = dataFilePath(withPathName: savedCollectionPath)
            let encodedData = try Data(contentsOf: phoneURL)
            let storedCollection = try propertyListDecoder.decode([Collection].self, from: encodedData)
            savedCollection = storedCollection
        }
        catch {
            print(error.localizedDescription)
        }
    }
    //GET the file path
    private func dataFilePath(withPathName path: String) -> URL {
        return FileManagerHelper.manager.documentsDirectory().appendingPathComponent(path)
    }
    private func documentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    //Saving Image to the desk might be usefull to save the collection Images
    func saveImage(with urlStr: String, image: UIImage) {
        let imageData = UIImagePNGRepresentation(image)
        let imagePathName = urlStr.components(separatedBy: "/").last!
        let url = dataFilePath(withPathName: imagePathName)
        do {
            try imageData?.write(to: url)
        }
        catch {
            print(error.localizedDescription)
        }
    }
    func getImage(with urlStr: String) -> UIImage? {
        do {
            let imagePathName = urlStr.components(separatedBy: "/").last!
            let url = dataFilePath(withPathName: imagePathName)
            let data = try Data(contentsOf: url)
            return UIImage(data: data)
        }
        catch {
            print(error.localizedDescription)
            return nil
        }
    }
}

