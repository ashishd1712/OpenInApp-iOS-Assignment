//
//  ContentView.swift
//  openInAppAssignment
//
//  Created by Ashish Dutt on 28/05/24.
//

import SwiftUI

struct ContentView: View {
    @State private var greeting = ""
    @State private var name = "User"
    @State private var selectedTab: LinkTab = .topLinks
    @State var dashboard: Dashboard?
    @State var isLoading = true
    @State var chartData = [Dictionary<String, Int>.Element]()
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    var body: some View {
        VStack(spacing: 0) {
            HeaderView()
            if isLoading {
                ProgressView("Loading...")
                    .frame(width: screenWidth, height: screenHeight - 173)
                    .background(Colors.scrollBackgroundColor).ignoresSafeArea(.all)
                    .cornerRadius(16, corners: [.topLeft, .topRight])
                    .padding(.top, -20)
            } else {
                ScrollView {
                    GreetingsView(greeting: greeting, name: name)
                        .padding(.bottom, 20)
                    
                    ChartView(data: chartData)
                        .padding(.bottom, 20)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                       AnalyticsGridView(dashboard: dashboard!)
                        
                    }
                    .padding(.bottom, 20)

                    NavigationButton(title: "View Analytics", image: Images.analyticsArrow, size: 32)
                        .padding(.bottom, 25)
                    
                    LinksNavigationBarView(selectedTab: $selectedTab)
                        .padding(.bottom, 28)
                    
                    if selectedTab == .topLinks {
                        LinksListView(links: dashboard!.data.topLinks)
                            .padding(.bottom, 20)
                    } else {
                        LinksListView(links: dashboard!.data.recentLinks)
                            .padding(.bottom, 20)
                    }

                    
                    NavigationButton(title: "View all Links", image: Images.link, size: 19)
                        .padding(.bottom, 20)
                    
                    SupportButton()
                        .padding(.bottom, 20)
                    
                    FAQButton()
                        .padding(.bottom, 20)
                }
                .scrollIndicators(.hidden)
                .background(Colors.scrollBackgroundColor).ignoresSafeArea(.all)
                .cornerRadius(16, corners: [.topLeft, .topRight])
                .padding(.top, -20)
            }
        }
        .onAppear {
            fetchData()
            updateGreeting()
            if chartData.isEmpty {
                chartData = generateChartData().sorted(by: {$0.key < $1.key})
            }
        }
        .ignoresSafeArea(edges: .bottom)
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
                dashboard = data
                isLoading = false
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
            }
        }
    }

}

#Preview {
    ContentView()
}
