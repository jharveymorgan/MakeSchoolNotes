//
//  Date+convertToString.swift
//  MakeSchoolNotes
//
//  Created by Chris Orcutt on 1/10/16.
//  Copyright © 2016 MakeSchool. All rights reserved.
//

import Foundation

extension NSDate {
    func convertToString() -> String {
        return DateFormatter.localizedString(from: self as Date, dateStyle: DateFormatter.Style.medium, timeStyle: DateFormatter.Style.medium)
    }
}
