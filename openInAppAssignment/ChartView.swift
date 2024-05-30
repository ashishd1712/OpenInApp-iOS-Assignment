//
//  ChartView.swift
//  openInAppAssignment
//
//  Created by Ashish Dutt on 30/05/24.
//

import SwiftUI
import Charts

struct ChartView: View {
    let data: [Dictionary<String, Int>.Element]
    let xValueMarks = stride(from: 0, to: 23, by: 1).map{String(format: "%02d:00", $0) }
    let yValueMarks = stride(from: 0, to: 50, by: 10).map{$0}
    let screenWidth = UIScreen.main.bounds.width
    var body: some View {
        VStack(alignment: .leading) {
            
            HStack {
                Text("Overview")
                    .font(.custom(Figtree.regular, size: 16))
                    .foregroundStyle(.darkTrunks)
                Spacer()
                Button {
                    
                } label: {
                    HStack {
                        Text("29 May - 30 May")
                            .font(.custom(Figtree.regular, size: 12))
                            .foregroundStyle(.black)
                        Image(systemName: "clock")
                            .resizable()
                            .frame(width: 16, height: 16)
                            .foregroundStyle(.darkTrunks)
                    }
                    .frame(width: 123, height: 28)
                    .overlay(
                        RoundedRectangle(cornerRadius: 6)
                            .stroke(.darkTrunks, lineWidth: 1)
                    )
                }
            }
            .padding(.top, 16)
            .padding(.leading, 12)
            .padding(.trailing, 12)
            Spacer()
            Chart {
                ForEach(data, id: \.key) { (key, value) in
                    LineMark(x: .value("Time", key)
                             , y: .value("Clicks", value))
                    
                    AreaMark(x: .value("Time", key)
                             , y: .value("Clicks", value))
                    .foregroundStyle(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.clear]), startPoint: .top, endPoint: .bottom))
                }
            }
            .padding(.horizontal, 6)
            .frame(width: screenWidth - 32, height: 136)
            .chartYAxis {
                AxisMarks(position: .leading,values: yValueMarks) {
                    AxisGridLine()
                        .foregroundStyle(.darkTrunks)
                    AxisValueLabel()
                        .font(.custom(Figtree.base, size: 10))
                        .foregroundStyle(.darkTrunks)
                }
                
                    
            }
            .chartXAxis {
                AxisMarks(position: .bottom, values: xValueMarks)  { _ in
                    AxisGridLine()
                        .foregroundStyle(.darkTrunks)
                    AxisValueLabel()
                        .font(.custom(Figtree.base, size: 8))
                        .foregroundStyle(.darkTrunks)
                }
            }
        }
        .padding(.bottom, 10)
        .frame(width: screenWidth - 32, height: 200)
        .background(.white)
        .cornerRadius(8, corners: .allCorners)
    
    }
    
}

//struct chartView_Previews: PreviewProvider {
//    static var previews: some View {
//        ChartView()
//            .previewLayout(.sizeThatFits)
//    }
//}
