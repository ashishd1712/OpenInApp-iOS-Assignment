//
//  ContentView.swift
//  openInAppAssignment
//
//  Created by Ashish Dutt on 28/05/24.
//

import SwiftUI

struct ContentView: View {
    @State private var greeting = "Good morning"
    @State private var name = "Ashish Dutt"
    var body: some View {
        VStack(spacing: 0) {
            HeaderView()
            ScrollView {
                GreetingsView(greeting: greeting, name: name)
            }
            .background(Colors.scrollBackgroundColor).ignoresSafeArea(.all)
            .cornerRadius(16, corners: [.topLeft, .topRight])
            .padding(.top, -20)
        }
        .ignoresSafeArea(edges: .bottom)
        .onAppear {
            updateGreeting()
        }
    }
    
    func updateGreeting() {
        let hour = Calendar.current.component(.hour, from: Date())
        if hour < 12 {
            greeting = "Good morning"
        } else if hour < 18 {
            greeting = "Good afternoon"
        } else {
            greeting = "Good evening"
        }
    }
    
    func fetchData() {
        APIService.shared.fetchDashboardData { result in
            switch result {
            case .success(let data):
                printData(data: data)
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
            }
        }
    }
    
    func printData(data: Dashboard) {
        print("\n\n\nData in Content View")
        print(data)
    }
}

#Preview {
    ContentView()
}
