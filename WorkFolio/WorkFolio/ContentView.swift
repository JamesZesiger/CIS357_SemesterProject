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
                        NavigationLink("\(ProjectViewModel.projlist[i].title)",destination: ProjectScreen(Selected: i))
    
                    }
                }
                Spacer()
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
        .environmentObject(ProjectViewModel())
        .environmentObject(AddViewModel())
}
