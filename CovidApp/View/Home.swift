//
//  Home.swift
//  CovidApp
//
//  Created by Irfandio Daffa on 17/10/20.
//

import SwiftUI

struct Home: View {
    
//    @ObservedObject var fetch = apiServiceCNN()
    @ObservedObject var fetch2 = apiService()
        var body: some View {
    
            VStack{
                VStack{
                    HStack{
                        Image("virus")
                            .resizable()
                            .frame(width: 300, height: 300)
                            .clipped()
                        
                        Spacer()
    
                        HStack{
                            Spacer()
    
                            VStack(alignment: .center){
                                Text("All you need is stay at home")
                                    .font(.title)
                                    .fontWeight(.medium)
                                    .foregroundColor(.white)
    
                            }
                        }
                    }
                }
                .padding(.leading, -120)
                .padding(.trailing, 30)
                .padding(.top, 70)
                .zIndex(0)
                
    
                VStack(alignment: .leading){
                    
                    Text("Case Update")
                        .font(.headline)
                        .fontWeight(.medium)
                        .foregroundColor(Color("Main"))
                        .padding(.bottom, 10)
                        .padding([.leading, .trailing], 5)
                    
                    
                    ZStack{
                        Color(.white)
                            .cornerRadius(20)
                            .shadow(color: Color("shadowMain"), radius: 10, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
                        VStack{
                            Text("Indonesia")
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
                                    ForEach(fetch2.dataTotal){data in
                                        Text("\(data.jumlah_positif)")
                                            .font(.title3)
                                            .fontWeight(.medium)
                                            .foregroundColor(.orange)
                                        Text("\(data.jumlah_meninggal)")
                                            .font(.title3)
                                            .fontWeight(.medium)
                                            .foregroundColor(.red)
                                        Text("\(data.jumlah_sembuh)")
                                            .font(.title3)
                                            .fontWeight(.medium)
                                            .foregroundColor(.green)
                                    }
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
                    
                    HStack{
                        Text("Spread of virus")
                            .font(.headline)
                            .fontWeight(.medium)
                            .foregroundColor(Color("Main"))
                        
                        Spacer(minLength: 0)
                        
                        NavigationLink(destination: ProvinceDetail()) {
                            Text("See details")
                                .font(.caption2)
                                .fontWeight(.thin)
                                .foregroundColor(.black)
                        }.navigationBarHidden(true)
                    }
                    .padding(.top, 20)
                    .padding(.bottom, 10)
                    .padding([.leading, .trailing], 5)
                    
                    NavigationLink(destination: ProvinceDetail()) {
                        ZStack{
                            Color(.white)
                                .cornerRadius(20)
                                .shadow(color: Color("shadowMain"), radius: 10, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
                            
                            Image("map")
                                .resizable()
                                .frame(width: 250, height: 125, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                .padding(20)
                        }
                    }.navigationBarHidden(true)
                    
                }
                .padding(20)
                .background(
                    Color.white
                        .clipShape(CustomCorner())
                        .padding(.top, -10)
                        .padding(.bottom, -100)
                )
                .zIndex(1)
            }
            .padding(.top, 80)
            .padding(.bottom, 200)
            .edgesIgnoringSafeArea(.all)
            .background(Color("mainColor").ignoresSafeArea(.all, edges: .top))
            .background(Color.white.ignoresSafeArea(.all, edges: .bottom))
        }
}



//struct Home_Previews: PreviewProvider {
//    static var previews: some View {
//        Home()
//    }
//}
