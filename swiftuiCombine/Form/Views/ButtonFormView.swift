//
//  ButtonFormView.swift
//  swiftuiCombine
//
//  Created by Muhammad Faisal Imran Khan on 2022-02-24.
//

import SwiftUI

struct ButtonFormView: View {
    
    internal init(component: ButtonFormComponent, handler: @escaping ButtonFormView.ButtonActionHandler) {
        self.component = component
        self.handler = handler
    }
    
    
    typealias ButtonActionHandler = (_ formId: FormField) -> Void
    
    let component: ButtonFormComponent
    let handler: ButtonActionHandler
    
    var body: some View {
        
        Button(component.title){
            handler(component.formId)
        }
        .frame( maxWidth: .infinity, minHeight: 44,  alignment: .center)
        .background(Color.blue)
        .foregroundColor(.white)
        .font(.system(size: 16, weight: .bold))
        .cornerRadius(8)
    }
}

struct ButtonFormView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonFormView(component: .init(id: .submit, title: "Confirm")){ _ in }
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
