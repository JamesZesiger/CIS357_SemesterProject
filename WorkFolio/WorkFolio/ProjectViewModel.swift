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
    var desc: String?
}

class ProjectViewModel: ObservableObject{
    @Published var projlist: [Project] = []
    @Published var selected: Project? = nil
    
}
