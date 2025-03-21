//
//  ContentView.swift
//  WorkFolio
//
//  Created by James R. Zesiger on 3/20/25.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var ProjectViewModel: ProjectViewModel
    @State private var title: String = ""
    var body: some View {
        VStack {
            Text("Projects")
                .font(.title)
            TextField("Title",text: $title)
            Button("add"){
                ProjectViewModel.projlist.append(Project(title: title))
            }
            VStack{
                List(ProjectViewModel.projlist) {itm in
                    Text("\(itm.title)")
                }
            }
            Spacer()
        }
        .padding()
    }
}

#Preview {
    ContentView()
        .environmentObject(ProjectViewModel())
}
