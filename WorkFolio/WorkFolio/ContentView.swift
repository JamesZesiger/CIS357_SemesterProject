//
//  ContentView.swift
//  WorkFolio
//
//  Created by James R. Zesiger on 3/20/25.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var ProjectViewModel: ProjectViewModel
    @EnvironmentObject private var AddviewModel: AddViewModel
    @State private var selected: Int?
    @State private var showingSheet = false
    var body: some View {
        NavigationStack(){
            VStack {
                HStack{
                    Button(){
                        showingSheet.toggle()
                    } label: {
                        Image(systemName: "plus")
                    }
                    .sheet(isPresented: $showingSheet){
                        AddSheet(showingSheet: $showingSheet)
                    }
                    Spacer()
                    Text("Projects")
                        .font(.title)
                    Spacer()

                }
                
                VStack{
                    List(ProjectViewModel.projlist.indices, id:\.self) {i in
                        VStack(alignment: .leading){
                            Text("\(ProjectViewModel.projlist[i].title)")
                                .font(.title3)
                            if (ProjectViewModel.projlist[i].meetings.count > 0){
                                Text(" Next meeting:\n \(ProjectViewModel.projlist[i].meetings[0].time.formatted(date: .abbreviated, time: .shortened))")
                            } else{
                                Text(" No Upcoming meetings")
                            }
                            NavigationLink(" Due: \(ProjectViewModel.projlist[i].DueDate.formatted(date: .abbreviated, time: .omitted))",destination: ProjectScreen(Selected: i))
                        }
                        

                        
    
                    }
                }
                Spacer()
            }
        }
        .padding()
    }
}

extension Date {

    func stripTime() -> Date {
        let components = Calendar.current.dateComponents([.year, .month, .day], from: self)
        let date = Calendar.current.date(from: components)
        return date!
    }

}

#Preview {
    ContentView()
        .environmentObject(ProjectViewModel())
        .environmentObject(AddViewModel())
}
