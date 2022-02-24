//
//  SwiftUIFormView.swift
//  swiftuiCombine
//
//  Created by Muhammad Faisal Imran Khan on 2022-02-24.
//

import SwiftUI

struct SwiftUIFormView: View {
    
    @EnvironmentObject var contentBuilder: FormContentBuilderImpl
    @State private var text = ""
    @State private var error: ValidationError?
    
    let componet: TextFormComponent
    var body: some View {
        
        VStack(alignment: .leading){
            
            TextField("Placeholder here", text: $text)
                .frame(maxWidth: .infinity,  alignment: .center)
                .padding(.leading, 5)
                .keyboardType(componet.keyboardType)
                .background(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(error == nil ? Color.gray.opacity(0.25) : Color.red)
                )
            
            Text(error?.errorDescription ?? "")
                .font(.system(size:12, weight: .semibold))
                .foregroundColor(.red)
            
        }
        .onChange(of: text, perform: {
            value in
            
            contentBuilder.update(text, in: componet)
               error = componet
                   .validations
                   .compactMap{$0.validate(text)}
                   .first
        }) 
    }
}

struct SwiftUIFormView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIFormView(componet: .init(.firstName, placeholder: "Placeholder here"))
            .environmentObject(FormContentBuilderImpl())
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
