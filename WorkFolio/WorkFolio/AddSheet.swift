//
//  AddSheet.swift
//  WorkFolio
//
//  Created by James R. Zesiger on 3/21/25.
//

import SwiftUI

struct AddSheet: View {
    @Binding var showingSheet:Bool
    @EnvironmentObject private var viewModel: AddViewModel
    @EnvironmentObject var ProjectViewModel: ProjectViewModel
    @State private var title: String = ""
    @State private var Desc: String = ""
    var body: some View {
        VStack{
            Text("New Project")
                .font(.title)
            TextField("Title",text: $title)
                .font(.title)
                .textFieldStyle(.roundedBorder)
            TextField("Description",text: $Desc)
                .font(.title)
                .textFieldStyle(.roundedBorder)
            Spacer()
            Button("add"){
                if (title == ""){
                    title = "Untitled"
                }
                ProjectViewModel.projlist.append(Project(title: title,desc: Desc))
                showingSheet = false
            }
            .font(.title)

        }
        .padding()
    }
    
}

#Preview {
    @Previewable @State var showingSheet: Bool = true
    AddSheet(showingSheet: $showingSheet)
        .environmentObject (AddViewModel())
        .environmentObject(ProjectViewModel())
}
