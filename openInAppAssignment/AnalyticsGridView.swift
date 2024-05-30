//
//  AnalyticsGridView.swift
//  openInAppAssignment
//
//  Created by Ashish Dutt on 29/05/24.
//

import SwiftUI


struct AnalyticsGridView: View {
    let dashboard: Dashboard
    var body: some View {
        HStack(spacing: 16) {
            AnalyticsGridItemView(analyticsType: "Today's Clicks", analyticsValue: String(dashboard.todayClicks), analyticsImage: Images.click)
            AnalyticsGridItemView(analyticsType: "Top Location", analyticsValue: dashboard.topLocation, analyticsImage: Images.pin)
            AnalyticsGridItemView(analyticsType: "Top source", analyticsValue: dashboard.topSource, analyticsImage: Images.globe)
        }
        .padding(.leading, 16)
    }
}
//
//struct AnalyticsGridView_Previews: PreviewProvider {
//    static var previews: some View {
//        AnalyticsGridView()
//    }
//}
