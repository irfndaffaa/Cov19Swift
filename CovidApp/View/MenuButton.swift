//
//  MenuButton.swift
//  CovidApp
//
//  Created by Irfandio Daffa on 17/10/20.
//

import SwiftUI

struct MenuButton: View {
    
    var gambarMenu: String
    var textMenu: String
    
    var body: some View {
        
//        Button(action: {}) {
//
//        }
        
        VStack(alignment: .leading, spacing: 6){
            ZStack{
                Color("superLightGray")
                    .cornerRadius(15)
                    .shadow(color: Color.black.opacity(0.1), radius: 5, x: 5, y: 5)
                
                Image(gambarMenu)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(20)
//                    .matchedGeometryEffect(id: phoneData.image, in: animation)
            }
            
            HStack{
                Spacer()
                
                Text(textMenu)
                    .font(.callout)
                    .fontWeight(.semibold)
                    .foregroundColor(Color("mainColor"))
                    .multilineTextAlignment(.center)
                
                Spacer()
            }
        }
        
        
        
    }
}

//struct MenuButton_Previews: PreviewProvider {
//    static var previews: some View {
//        MenuButton()
//    }
//}
