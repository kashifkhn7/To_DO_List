//
//  NoItemView.swift
//  ToDoList
//
//  Created by MUHAMMAD KASHIF on 03/11/2022.
//

import SwiftUI

struct NoItemView: View {
    @State var animation: Bool = false
    
    var body: some View {
        ScrollView(){
            VStack(spacing: 10){
                Spacer(minLength: 20)
                Text("There are no Items!")
                    .font(.title)
                    .fontWeight(.semibold)
                
                Text("Are you productive person? I think you should click the add button and add the bunch of Items to your Item ToDo list!")
                    .foregroundColor(Color.secondary)
                
                NavigationLink {
                    AddView()
                } label: {
                    Text("Add Items".uppercased())
                        .font(.title2)
                        .frame(maxWidth: .infinity)
                        .foregroundColor(Color.white)
                        .padding()
                        .padding(.horizontal)
                        .background(animation ? Color.purple : Color.accentColor)
                        .cornerRadius(15)
                }
                .padding(.vertical, 20)
                .padding(.horizontal, animation ? 40 : 60)
                .shadow(color: animation ? Color.purple.opacity(0.7) : Color.accentColor.opacity(0.7),
                        radius: animation ? 30 : 10,
                        x: 0,
                        y: animation ?  30 : 40)
                .scaleEffect(animation ? 1.1 : 1.0)
                .offset(y: animation ? -7 : 0)

                
            }
//            .frame(maxWidth: 400)
            .multilineTextAlignment(.center)
            .padding(20)
            .onAppear(perform: addAnimation)
            
        }
    }
    
    func addAnimation(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5){
            withAnimation(.easeInOut(duration: 2.0).repeatForever()) {
                animation.toggle()
            }
        }
    }
    
}

struct NoItemView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            NoItemView()
                .navigationTitle("Title")
        }
    }
}
