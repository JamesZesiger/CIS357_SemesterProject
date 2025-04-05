//
//  ProjectScreen.swift
//  WorkFolio
//
//  Created by James R. Zesiger and Joe Kaceli on 3/21/25.
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
        .toolbar{
            ToolbarItem(placement: .principal){
                Text("\(ProjectModel.projlist[Selected].title)")
                    .font(.title)
            }
            ToolbarItem(placement: .topBarTrailing){
                Button(){
                    showingSheet.toggle()
                } label: {
                    Image(systemName: "plus")
                }
                .sheet(isPresented: $showingSheet){
                    MeetingSheet(showingSheet: $showingSheet,Selected: Selected)
                }
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
        .environmentObject(ProjectViewModel())
        .environmentObject(MeetingViewModel())
}
