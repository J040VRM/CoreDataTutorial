//
//  DateComponent.swift
//  CoreDataProducts
//
//  Created by João Vitor Rocha Miranda on 18/06/25.
//

import Foundation


extension Date {
    var onlyDate: Date {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.year, .month, .day], from: self)
        return calendar.date(from: components)!
    }
}
