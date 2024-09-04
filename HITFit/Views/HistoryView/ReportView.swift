//
//  ReportView.swift
//  HITFit
//
//  Created by Manukant Tyagi on 03/09/24.
//

import SwiftUI

struct ReportView: View {
    @EnvironmentObject var history: HistoryStore
    @State private var showBarChat = true
    var body: some View {
        VStack {
            Text("History for Last Week")
                .font(.title)
            BarChartWeekView(markType: showBarChat ? .bar : .line)
            HStack {
                Text("Bar Chart")
                Toggle("", isOn: $showBarChat)
            }
        }
        .padding()
    }
}


struct ReportView_Previews: PreviewProvider {
    static var history = HistoryStore(preview: true)
    static var previews: some View{
        ReportView()
            .environmentObject(history)
    }
}

