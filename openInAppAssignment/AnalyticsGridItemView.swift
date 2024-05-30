//
//  AnalyticsGridItemView.swift
//  openInAppAssignment
//
//  Created by Ashish Dutt on 29/05/24.
//

import SwiftUI

struct AnalyticsGridItemView: View {
    
    let analyticsType: String
    let analyticsValue: String
    let analyticsImage: Image
    var body: some View {
        ZStack(alignment: .topLeading) {
            VStack(alignment: .leading) {
                analyticsImage
                    .resizable()
                    .frame(width: 32, height: 32)
                Spacer()
                Text(analyticsValue)
                    .font(.custom(Figtree.semiBold, size: 16))
                    .foregroundStyle(.black)
                    .padding(.bottom, 4)
                Text(analyticsType)
                    .font(.custom(Figtree.regular, size: 14))
                    .foregroundStyle(Colors.lightTrunk)
                    .padding(.bottom, 2)
            }
            .padding(0)
            .frame(width: 95, height: 95, alignment: .leading)
            
        }
        .frame(width: 120, height: 120)
        .background(Color.white)
        .cornerRadius(8, corners: .allCorners)
    }
}

struct AnalyticsGridItemView_Previews: PreviewProvider {
    static var previews: some View {
        AnalyticsGridItemView(analyticsType: "Top Source", analyticsValue: "Instagram", analyticsImage: Images.globe)
            .previewLayout(.sizeThatFits)
    }
}
