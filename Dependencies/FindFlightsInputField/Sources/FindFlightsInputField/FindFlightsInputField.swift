//
//  FindFlightsInputField.swift
//  FindFlightsInputField
//
//  Created by Rahul C K on 20/10/23.
//

import SwiftUI

public struct FindFlightsInputField<T: CustomStringConvertible>: View {
    
    var fieldTitle: String
    @Binding var fieldValue: T
    var onTapAction: () -> Void

    public init(fieldTitle: String,
                fieldValue: Binding<T>,
                onTapAction: @escaping () -> Void) {
        self.fieldTitle = fieldTitle
        self._fieldValue = fieldValue
        self.onTapAction = onTapAction
    }

    public var body: some View {
        Group {
            Button(action: {
                onTapAction()
            }, label: {
                fieldView()
            })
        }.background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.white)
                .shadow(color: .gray, radius: 2, x: 0, y: 2)
        )
    }
     
    var fieldEmptyView: some View {
        HStack {
            Text(fieldTitle)
                .font(.title3)
                .fontWeight(.semibold)
                .foregroundColor(.gray)
            Spacer()
        }.padding(.horizontal, 10)
            .padding(.vertical, 20)
    }
    
    var fieldExistView: some View {
        HStack {
            VStack(alignment:.leading, spacing: 5) {
                Text(fieldTitle)
                    .font(.subheadline)
                    .fontWeight(.regular)
                    .foregroundColor(.gray)
                Text(fieldValue.description)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
            }.padding(.horizontal, 10).padding(.vertical, 10)
            Spacer()
        }
    }
    
    @ViewBuilder
    func fieldView() -> some View {
        if fieldValue.description.isEmpty {
            fieldEmptyView
        }  else  {
            fieldExistView
        }
    }
}

#Preview {
    FindFlightsInputField(fieldTitle: "Passengers",
                         fieldValue: .constant("")) {
        
    } .previewLayout(.sizeThatFits).padding(10)
}
