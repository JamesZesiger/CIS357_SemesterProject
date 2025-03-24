//
//  ProjectViewModel.swift
//  WorkFolio
//
//  Created by James R. Zesiger on 3/20/25.
//

import SwiftUI

struct Project: Identifiable {
    var id = UUID()
    var title: String
    var desc: String
    var meetings: [meetings] = []
    var DueDate: Date
}

struct meetings: Identifiable{
    var id = UUID()
    var title: String
    var time: Date
    var desc: String
    
}
class ProjectViewModel: ObservableObject{
    @Published var projlist: [Project] = []
}
