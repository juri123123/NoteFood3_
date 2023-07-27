//
//  DateValue.swift
//  NoteFood3
//
//  Created by juri on 2023/07/26.
//

import SwiftUI

//Date Value Model

struct DateValue: Identifiable {
    var id = UUID().uuidString
    var day: Int
    var date: Date
}

