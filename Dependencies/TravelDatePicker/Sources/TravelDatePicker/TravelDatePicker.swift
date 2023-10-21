//
//  TravelDatePicker.swift
//  TravelDatePicker
//
//  Created by Rahul C K on 20/10/23.
//
import SwiftUI

public struct TravelDatePicker: View {
    @Binding var startDate: Date?
    @Binding var returnDate: Date?
    
    @Environment(\.dismiss) var dismiss
    
    @State private var internalStartDate: Date
    @State private var internalReturnDate: Date
    var dateRange: ClosedRange<Date> {
        let startDate = Date()
        let endDate = Calendar.current.date(byAdding: .month, value: 6, to: startDate) ?? startDate
        return startDate...endDate
    }
    var isRoundTrip: Bool
    
    public init(startDate: Binding<Date?>,
                returnDate: Binding<Date?>,
                isRoundTrip: Bool = false) {
        self._startDate = startDate
        self._returnDate = returnDate
        self._internalStartDate = State(initialValue: startDate.wrappedValue ?? Date())
        self._internalReturnDate = State(initialValue: returnDate.wrappedValue ?? Date())
        self.isRoundTrip = isRoundTrip
    }
    
    public var body: some View {
        ScrollView(.vertical) {
            Spacer(minLength: 20)
            DatePicker("Start Date", selection: $internalStartDate,
                       in: dateRange(isRoundTrip: false),
                       displayedComponents: .date)
            .datePickerStyle(.graphical)
            .onChange(of: internalStartDate) { newValue in
                startDate = newValue
            }
            
            if isRoundTrip {
                DatePicker("Return Date", selection: $internalReturnDate,
                           in: dateRange(isRoundTrip: true),
                           displayedComponents: .date)
                .datePickerStyle(.graphical)
                .onChange(of: internalReturnDate) { newValue in
                    returnDate = newValue
                }
            }
            
            Button("Done") {
                startDate = internalStartDate
                if isRoundTrip {
                    returnDate = internalReturnDate
                }
                dismiss()
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
        .padding()
    }
    
    private func dateRange(isRoundTrip: Bool) -> ClosedRange<Date> {
        let startDate = isRoundTrip ? internalStartDate: Date()
        let endDate = Calendar.current.date(byAdding: .month, value: 6, to: startDate) ?? startDate
        return  startDate...endDate
    }
}
