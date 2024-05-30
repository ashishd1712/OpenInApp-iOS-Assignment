//
//  LinksNavigationBarView.swift
//  openInAppAssignment
//
//  Created by Ashish Dutt on 29/05/24.
//

import SwiftUI

enum LinkTab {
    case topLinks
    case recentLinks
}

struct LinksNavigationBarView: View {
    let screenWidth = UIScreen.main.bounds.width
    @Binding var selectedTab: LinkTab
    var body: some View {
        HStack {
            HStack(spacing: 20) {
                Button {
                    selectedTab = .topLinks
                } label: {
                    ZStack {
                        if selectedTab == .topLinks {
                            Capsule()
                                .fill(Color.linkTab)
                        }
                        Text("Top Links")
                            .font(.custom(Figtree.semiBold, size: 16))
                            .foregroundStyle(selectedTab == .topLinks ? .white : .lightTrunks)
                    }
                    .frame(width: 101, height: 36)
                }
                Button {
                    selectedTab = .recentLinks
                } label: {
                    ZStack {
                        if selectedTab == .recentLinks {
                            Capsule()
                                .fill(Color.linkTab)
                        }
                        Text("Recent Links")
                            .font(.custom(Figtree.semiBold, size: 16))
                            .foregroundStyle(selectedTab == .recentLinks ? .white : .lightTrunks)
                    }
                    .frame(width: selectedTab == .recentLinks ? 111 : 101, height: 36)
                }
            }
            Spacer()
            ZStack {
                Color.lightBeerus
                    .frame(width: 36, height: 36)
                    .cornerRadius(8, corners: .allCorners)
                Image(systemName: "magnifyingglass")
                    .foregroundStyle(Color.black.opacity(0.4))
            }
        }
        .frame(width: screenWidth - 32, height: 36)
    }
}

struct LinksNavigationBarView_Previews: PreviewProvider {
    static var previews: some View {
        LinksNavigationBarView(selectedTab: .constant(.topLinks))
            .previewLayout(.sizeThatFits)
    }
}
