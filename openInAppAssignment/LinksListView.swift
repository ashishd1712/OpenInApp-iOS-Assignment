//
//  LinksListView.swift
//  openInAppAssignment
//
//  Created by Ashish Dutt on 30/05/24.
//

import SwiftUI

struct LinksListView: View {
    let links: [LinkData]
    var body: some View {
        VStack(spacing: 20) {
            ForEach(links, id: \.urlID) { link in
                LinksView(linkData: link)
            }
        }
    }
}

//#Preview {
//    LinksListView()
//}
