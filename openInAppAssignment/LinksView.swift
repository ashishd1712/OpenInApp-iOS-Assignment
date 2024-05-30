//
//  LinksListView.swift
//  openInAppAssignment
//
//  Created by Ashish Dutt on 30/05/24.
//

import SwiftUI

struct LinksView: View {
    let linkData: LinkData
    let frameWidth = UIScreen.main.bounds.width - 32
    @State private var showAlert = false
    @State private var alertMessage = ""
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            HStack {
                Image(systemName: "plus.app")
                    .resizable()
                    .frame(width: 48, height: 48)
                    .foregroundStyle(.black)
                    .cornerRadius(8, corners: .allCorners)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(lineWidth: 1)
                            .foregroundStyle(Colors.scrollBackgroundColor)
                    )
                    .padding(.trailing, 12)
                
                VStack(alignment: .leading, spacing: 2) {
                    Text(linkData.title)
                        .font(.custom(Figtree.regular, size: 14))
                        .foregroundStyle(.black)
                        .frame(width: 120, height: 24, alignment: .leading)
                    if let dateString = formatDateString(linkData.createdAt ?? ""){
                        Text(dateString)
                            .font(.custom(Figtree.regular, size: 12))
                            .foregroundStyle(Colors.darkTrunk)
                            .frame(width: 80, height: 18, alignment: .leading)
                    }
                    
                }
                .frame(width: 120, height: 44)
                
                Spacer()
                
                VStack(alignment: .leading, spacing: 2){
                    Text(String(linkData.totalClicks))
                        .font(.custom(Figtree.semiBold, size: 14))
                        .frame(width: 32, height: 24)
                        .foregroundStyle(.black)
                    
                    Text("Clicks")
                        .font(.custom(Figtree.regular, size: 12))
                        .frame(width: 32, height: 18)
                        .foregroundStyle(Colors.darkTrunk)
                }
                .frame(width: 32, height: 44)
                
            }
            .frame(width: frameWidth - 24, height: 48)
            .padding(.top, 12)
            .padding(.bottom, 16)

            HStack {
                Text(linkData.webLink)
                    .frame(width: 216, height: 16, alignment: .leading)
                    .font(.custom(Figtree.regular, size: 14))
                    .foregroundStyle(Colors.headerColor)
                
                Spacer()
                
                Button {
                    copyToClipboard(linkData.webLink)
                    alertMessage = "Link copied to clipboard"
                    showAlert = true
                } label: {
                    Images.copy
                        .resizable()
                        .foregroundStyle(Colors.headerColor)
                        .frame(width: 11.51, height: 14.25)
                }
                .frame(width: 24, height: 24)
            }
            .padding(.leading, 12)
            .padding(.trailing, 12)
            .frame(width: frameWidth, height: 40)
            .background(Color.linkBackground)
            .overlay(
                BottomRoundedRectangle()
                    .stroke(style: StrokeStyle(lineWidth: 1, dash: [3]))
                    .foregroundStyle(Color.linkDashedLine)
            )
            
            
        }
        .frame(width: frameWidth, height: 116)
        .background(Color.white)
        .cornerRadius(8, corners: .allCorners)
        .alert(isPresented: $showAlert) {
                    Alert(title: Text("Copied"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
        }
    }
    
    private func copyToClipboard(_ text: String) {
        UIPasteboard.general.string = text
    }
}

//struct LinksListView_Previews: PreviewProvider {
//    static var previews: some View {
//        LinksView()
//            .previewLayout(.sizeThatFits)
//    }
//}

struct BottomRoundedRectangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height - 1
        let radius: CGFloat = 8
        
        path.move(to: CGPoint(x: 1, y: 1))
        path.addLine(to: CGPoint(x: width - 1, y: 1))
        path.addLine(to: CGPoint(x: width - 1, y: height - radius))
        path.addArc(center: CGPoint(x: width - radius - 1, y: height - radius),
                    radius: radius,
                    startAngle: Angle(degrees: 0),
                    endAngle: Angle(degrees: 90),
                    clockwise: false)
        path.addLine(to: CGPoint(x: radius, y: height))
        path.addArc(center: CGPoint(x: radius + 1, y: height - radius),
                    radius: radius,
                    startAngle: Angle(degrees: 90),
                    endAngle: Angle(degrees: 180),
                    clockwise: false)
        path.addLine(to: CGPoint(x: 1, y: 1))
        
        return path
    }
}
