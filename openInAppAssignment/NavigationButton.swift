//
//  AnalyticsButton.swift
//  openInAppAssignment
//
//  Created by Ashish Dutt on 29/05/24.
//

import SwiftUI

struct NavigationButton: View {
    let screenWidth = UIScreen.main.bounds.width
    let title: String
    let image: Image
    let size: CGFloat
    var body: some View {
        Button {
            
        } label: {
            HStack {
                image
                    .resizable()
                    .frame(width: size, height: size)
                Text(title)
                    .font(.custom(Figtree.semiBold, size: 16))
                .foregroundStyle(.black)
            }
            .frame(width: screenWidth - 32, height: 48)
            .cornerRadius(8, corners: .allCorners)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Colors.borderColor, lineWidth: 1.0)
            )
        }
    }
}

struct NavigationButton_Previews: PreviewProvider {
    static var previews: some View {
        NavigationButton(title: "View Analytics", image: Images.analyticsArrow, size: 32)
            .previewLayout(.sizeThatFits)
    }
}
