//
//  SessionPickerView.swift
//  Learndex
//
//  Created by 조민지 on 4/21/26.
//

import SwiftUI

struct SessionPickerView: View {
    @Binding var selectedFilter: SessionType
    
    
    var body: some View {
        Picker("Session", selection: $selectedFilter) {

            ForEach(SessionType.allCases) { session in
                Text(session.rawValue).tag(session)
            }
            
                    
        } .pickerStyle(SegmentedPickerStyle())
            .padding(.bottom, 10)
    }
}

#Preview {
    SessionPickerView(selectedFilter: .constant(.morning))
}

