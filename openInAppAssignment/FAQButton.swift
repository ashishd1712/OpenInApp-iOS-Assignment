//
//  FAQButton.swift
//  openInAppAssignment
//
//  Created by Ashish Dutt on 30/05/24.
//

import SwiftUI

struct FAQButton: View {
    let screenWidth = UIScreen.main.bounds.width
    var body: some View {
        Button {
            
        } label: {
            HStack{
                Image(systemName: "questionmark.circle")
                    .resizable()
                    .frame(width: 24, height: 24)
                    .foregroundStyle((Color(red: 14/255, green: 111/255, blue: 255/255, opacity: 1)))
                Text("Frequently Asked Question")
                    .font(.custom(Figtree.semiBold, size: 16))
                    .foregroundStyle(.black)
                    .frame(height: 24)
            }
            .padding(.leading, 12)
            .frame(width: screenWidth - 32, height: 64, alignment: .leading)
            .background((Color(red: 232/255, green: 241/255, blue: 255/255, opacity: 1)))
            .cornerRadius(8, corners: .allCorners)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke((Color(red: 14/255, green: 111/255, blue: 255/255, opacity: 0.32)),lineWidth: 0.32)
            )
        }
    }
}

#Preview {
    FAQButton()
}
