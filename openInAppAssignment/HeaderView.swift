//
//  HeaderView.swift
//  openInAppAssignment
//
//  Created by Ashish Dutt on 29/05/24.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        HStack {
            Text("Dashboard")
                .font(.custom(Figtree.semiBold, size: 24))
                .foregroundStyle(.white)
            Spacer()
            Button {
                print("User Profile")
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color.white.opacity(0.12))
                        .frame(width: 40, height: 40)
                    Images.wrench
                        .resizable()
                        .frame(width: 17.5, height: 19)
                }
            }

        }
        .padding(EdgeInsets(top: 0, leading: 16, bottom: 8, trailing: 16))
        .frame(height: 100)
        .background(Colors.headerColor)
    }
}

#Preview {
    HeaderView()
}

