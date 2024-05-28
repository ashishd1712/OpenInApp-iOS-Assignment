//
//  GreetingsView.swift
//  openInAppAssignment
//
//  Created by Ashish Dutt on 29/05/24.
//

import SwiftUI

struct GreetingsView: View {
    var greeting: String
    var name: String
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(greeting)
                    .frame(height: 20)
                    .font(.custom(Figtree.base, fixedSize: 16))
                    .foregroundStyle(Colors.darkTrunk)
                HStack {
                    Text(name)
                        .font(.custom(Figtree.semiBold, fixedSize: 24))
                        .foregroundStyle(.black)
                    Text("👋")
                        .frame(width: 24, height: 24)
                        .rotation3DEffect(.degrees(180),axis: (x: 0.0, y: 1.0, z: 0.0))
                }
                .frame(height: 30)
            }
            Spacer()
        }
        .padding(EdgeInsets(top: 32, leading: 16, bottom: 0, trailing: 0))
        
    }
}

#Preview {
    GreetingsView(greeting: "Good morning", name: "Ashish Dutt")
        .preferredColorScheme(.light)
}
