//
//  ProjectScreen.swift
//  WorkFolio
//
//  Created by James R. Zesiger on 3/21/25.
//

import SwiftUI

struct ProjectScreen: View {
    @EnvironmentObject var ProjectModel: ProjectViewModel
    @EnvironmentObject private var MeetingviewModel: MeetingViewModel
    @Environment(\.dismiss) private var dismiss
    @State private var showingSheet = false
    @State var Selected: Int
    
    var body: some View {
        VStack{
            HStack{
                Spacer()
                Text("\(ProjectModel.projlist[Selected].title)")
                    .font(.title)
                Spacer()
                Button(){
                    showingSheet.toggle()
                } label: {
                    Image(systemName: "plus")
                }
                .sheet(isPresented: $showingSheet){
                    MeetingSheet(showingSheet: $showingSheet,Selected: Selected)
                }
            }
            Text("Description:")
                .font(.headline)
            Text("\(ProjectModel.projlist[Selected].desc)")
            Spacer()
            List(ProjectModel.projlist[Selected].meetings){ meet in
                Text("\(meet.title): \(meet.time.formatted(date: .abbreviated, time: .shortened))")
                }
            Spacer()
            Text("Due: \(ProjectModel.projlist[Selected].DueDate.formatted(date: .abbreviated, time: .shortened))")
                .font(.title2)
        }
        .padding()
    }
}

#Preview {
    ContentView()
        .environmentObject(ProjectViewModel())
        .environmentObject(MeetingViewModel())
}
