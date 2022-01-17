//
//  CountryListCoreDataManager.swift
//  Bankin
//
//  Created by ben lassoued sami on 17/01/2022.
//

import UIKit
import CoreData

final class BanksCoreDataManager{
    
    static let shared = BanksCoreDataManager()
    let coreDataManager = CoreDataManager()
    
    func createData(countryListModel:CountryListModel){
        
        //context from this container
        let managedContext = coreDataManager.context
        
        
        let bankCoreDataEntity = NSEntityDescription.entity(forEntityName: "BankCoreData", in: managedContext)!
        let parentBanksCoreDataEntity = NSEntityDescription.entity(forEntityName: "ParentBanksCoreData", in: managedContext)!
        // Loop for all elements
        guard let resources = countryListModel.resources else {return}
        for country in resources {
            let parentbankObject = NSManagedObject(entity: parentBanksCoreDataEntity, insertInto: managedContext)
            parentbankObject.setValue(country.countryCode, forKeyPath: "countryCode")
            guard let parentBanks = country.parentBanks else {return}
            for parentBank in parentBanks{
                guard let logoUrl = parentBank.logoUrl else {return}
                logoUrl.toData { data in
                    if let imageData = data{
                        let bankObject = NSManagedObject(entity: bankCoreDataEntity, insertInto: managedContext)
                        bankObject.setValue(parentBank.id, forKey: "id")
                        bankObject.setValue(parentBank.name, forKeyPath: "name")
                        bankObject.setValue(imageData, forKey: "image")
                        bankObject.setValue(parentBank.countryCode, forKey: "countryCode")
                        //Save all Data to CoreData
                        do {
                            try managedContext.save()
                            
                        } catch let error as NSError {
                            print("Could not save. \(error), \(error.userInfo)")
                        }
                    }
                }
            }
            
        }
    }
    
    func retriveImageData(id:Int)->Data?{
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "BankCoreData")
        do {
            let managedContext = coreDataManager.context
            let result = try managedContext.fetch(fetchRequest)
            for data in result as! [NSManagedObject] {
                if let id = data.value(forKey: "id") as? Int{
                    if id == id , let imageData = data.value(forKey: "image") as? Data{
                        return imageData
                    }
                }
            }
        }
        catch {
            print("Failed")
            return nil
        }
        return nil
    }
    
    
    func retrieveData() -> CountryListModel?{
        //Prepare the request of type NSFetchRequest  for the entity
        let fetchRequestParentBanks = NSFetchRequest<NSFetchRequestResult>(entityName: "ParentBanksCoreData")
        let fetchRequestBanks = NSFetchRequest<NSFetchRequestResult>(entityName: "BankCoreData")

        var countryListModel : CountryListModel!
        var resousrces : [Resources] = []
        var parenBanks : [ParenBanks] = []
        var countryCodes : [String] = []
         do {
            let managedContext = coreDataManager.context
            let result = try managedContext.fetch(fetchRequestParentBanks)
            for data in result as! [NSManagedObject] {
                                
                if let code = data.value(forKey: "countryCode") as? String{
                    countryCodes.append(code)
                }
            }
             
             
             let resultBanks = try managedContext.fetch(fetchRequestBanks)
             for data in resultBanks as! [NSManagedObject] {
                 
                 var parenBank : ParenBanks!
                 if let codefetched = data.value(forKey: "countryCode") as? String,let namefetched = data.value(forKey: "name") as? String,let idfetched = data.value(forKey: "id") as? Int{
                     parenBank = ParenBanks(id: idfetched, name: namefetched, countryCode: codefetched)
                     parenBanks.append(parenBank)
                 }
             }
             
             for code in countryCodes{
                 let resousrce = Resources(countryCode: code, parentBanks: parenBanks)
                 resousrces.append(resousrce)
             }
             countryListModel = CountryListModel(resources: resousrces)
             return countryListModel
        } catch {
            print("Failed")
            return nil
        }
    }
    
    
    func deleteData(){
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "ForecastCoreData")
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        
        do {
            try coreDataManager.context.execute(deleteRequest)
        } catch let error as NSError {
            print(error)
        }
    }
}
