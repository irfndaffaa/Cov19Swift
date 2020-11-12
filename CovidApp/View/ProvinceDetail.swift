//
//  ProvinceDetail.swift
//  CovidApp
//
//  Created by Irfandio Daffa on 12/11/20.
//

import SwiftUI

struct ProvinceDetail: View {
    
    @ObservedObject var provinceCase = getDataProvince()
    
    var body: some View {
        VStack(alignment: .leading){
            ZStack{
                HStack(spacing: 15){
                    
                    NavigationLink(destination: Home().animation(.easeIn)) {
                        Image(systemName: "chevron.left")
                            .font(.title2)
                            .foregroundColor(.black)
                    }
                    .navigationBarHidden(true)
                    
                    Spacer()
                    
                    Text("Province Cases")
                        .font(.callout)
                        .fontWeight(.medium)
                    
                    Spacer()
                }
            }
            .padding()
            .padding(.top,UIApplication.shared.windows.first?.safeAreaInsets.top)
            
            Spacer(minLength: 0)
            
            List(provinceCase.data){i in
                ZStack{
                    Color(.white)
                        .cornerRadius(20)
                        .shadow(color: Color("shadowMain"), radius: 10, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
                    
                    VStack{
                        Text(i.province)
                            .font(.headline)
                            .fontWeight(.medium)
                            .foregroundColor(.black)
                            .padding(.bottom, 20)
                            .padding([.leading, .trailing], 5)
                        
                        HStack{
                            LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 15), count: 3), spacing: 15){
                                Image(systemName: "circle.fill")
                                    .foregroundColor(.orange)
                                    .shadow(color: .red, radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
                                Image(systemName: "circle.fill")
                                    .foregroundColor(.red)
                                    .shadow(color: .red, radius: 10, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
                                Image(systemName: "circle.fill")
                                    .foregroundColor(.green)
                                    .shadow(color: .green, radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
                            }
                        }
                        
                        HStack{
                            LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 15), count: 3), spacing: 15){
                                Text("\(i.jumlah_kasus)")
                                    .font(.title2)
                                    .fontWeight(.medium)
                                    .foregroundColor(.orange)
                                Text("\(i.jumlah_meninggal)")
                                    .font(.title2)
                                    .fontWeight(.medium)
                                    .foregroundColor(.red)
                                Text("\(i.jumlah_sembuh)")
                                    .font(.title2)
                                    .fontWeight(.medium)
                                    .foregroundColor(.green)
                            }
                        }
                        .padding(.top, 20)
                        
                        HStack{
                            LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 15), count: 3), spacing: 15){
                                Text("Infected")
                                    .font(.caption)
                                    .fontWeight(.heavy)
                                    .foregroundColor(Color("LightGray"))
                                
                                Text("Death")
                                    .font(.caption)
                                    .fontWeight(.heavy)
                                    .foregroundColor(Color("LightGray"))
                                
                                Text("Recovered")
                                    .font(.caption)
                                    .fontWeight(.heavy)
                                    .foregroundColor(Color("LightGray"))
                            }
                        }
                    }.padding(25)
                }
            }
            
            
        }
        .edgesIgnoringSafeArea(.top)
        .navigationBarHidden(true)
        
    }
}
