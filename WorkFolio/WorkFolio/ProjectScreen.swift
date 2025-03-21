//
//  ProjectScreen.swift
//  WorkFolio
//
//  Created by James R. Zesiger on 3/21/25.
//

import SwiftUI

struct ProjectScreen: View {
    @EnvironmentObject var ProjectModel: ProjectViewModel
    
    @Environment(\.dismiss) private var dismiss
    @State var Selected: Int
    var body: some View {
        
        Text("\(ProjectModel.projlist[Selected].title)")
            .font(.title)
        Text("Description:")
            .font(.headline)
        Text("\(ProjectModel.projlist[Selected].desc)")
        Spacer()
    }
}

#Preview {
    ContentView()
        .environmentObject(ProjectViewModel())
        .environmentObject(AddViewModel())
}
