//
//  CoreDataManager.swift
//  Bankin
//
//  Created by ben lassoued sami on 17/01/2022.
//

import CoreData
import UIKit

final class CoreDataManager {
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    let persistentContainer = (UIApplication.shared.delegate as! AppDelegate).persistentContainer
}
