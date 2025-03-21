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
    }
}

#Preview {
    @Previewable @State var Selected: Int = 0
    ProjectScreen(Selected: Selected)
        .environmentObject(ProjectViewModel())
}
