//
//  ContentView.swift
//  openInAppAssignment
//
//  Created by Ashish Dutt on 28/05/24.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        VStack {
            Text("OpenInApp")
                .padding()
            Button {
                fetchData()
            } label: {
                Text("Fetch Data")
            }

        }
        .padding()
    }
    
    func fetchData() {
        APIService.shared.fetchDashboardData { result in
            switch result {
            case .success(let data):
                print("Fetched Data: \(data)")
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
            }
        }
    }
}

#Preview {
    ContentView()
}
