//
//  SupportButton.swift
//  openInAppAssignment
//
//  Created by Ashish Dutt on 30/05/24.
//

import SwiftUI

struct SupportButton: View {
    let screenWidth = UIScreen.main.bounds.width
    var body: some View {
        Button {
            
        } label: {
            HStack{
                Image("WhatsappIcon", bundle: nil)
                Text("Talk with us")
                    .font(.custom(Figtree.semiBold, size: 16))
                    .foregroundStyle(.black)
                    .frame(height: 24)
            }
            .padding(.leading, 12)
            .frame(width: screenWidth - 32, height: 64, alignment: .leading)
            .background((Color(red: 74/255, green: 209/255, blue: 95/255, opacity: 0.16)))
            .cornerRadius(8, corners: .allCorners)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke((Color(red: 74/255, green: 209/255, blue: 95/255, opacity: 0.32)),lineWidth: 1)
            )
        }
    }
}

struct SupportButton_Previews: PreviewProvider {
    static var previews: some View {
        SupportButton()
            .previewLayout(.sizeThatFits)
    }
}
