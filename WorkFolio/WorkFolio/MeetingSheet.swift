//
//  AddSheet.swift
//  WorkFolio
//
//  Created by James R. Zesiger on 3/21/25.
//

import SwiftUI

struct MeetingSheet: View {
    @Binding var showingSheet:Bool
    @EnvironmentObject private var viewModel: MeetingViewModel
    @EnvironmentObject var ProjectViewModel: ProjectViewModel
    @State private var title: String = ""
    @State private var Desc: String = ""
    @State private var time = Date.now
    @State var Selected: Int
    var body: some View {
        VStack{
            Text("New Meeting")
                .font(.title)
            TextField("Title",text: $title)
                .font(.title)
                .textFieldStyle(.roundedBorder)
            TextField("Description",text: $Desc)
                .font(.title)
                .textFieldStyle(.roundedBorder)
            DatePicker("Meeting Time:",selection: $time)
            Spacer()
            Button("add"){
                if (title == ""){
                    title = "Untitled"
                }
                ProjectViewModel.projlist[Selected].meetings.append(meetings(title: title, time: time, desc: Desc))
                ProjectViewModel.projlist[Selected].meetings.sort{
                    $0.time < $1.time
                }
                showingSheet = false
            }
            .font(.title)

        }
        .padding()
    }
    
}

#Preview {
    @Previewable @State var showingSheet: Bool = true
    @Previewable @State var sel: Int = 0
    MeetingSheet(showingSheet: $showingSheet, Selected: sel)
        .environmentObject (MeetingViewModel())
        .environmentObject(ProjectViewModel())
}
