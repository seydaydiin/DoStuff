//
//  NoItemsView.swift
//  ToDoList
//
//  Created by Şeyda Aydın on 28.10.2023.
//

import SwiftUI

struct NoItemsView: View {
    @State var animation : Bool = false
    let secondaryAccentColor = Color("SecondaryAccentColor")
    var body: some View {
     
        ScrollView {
            
            VStack(spacing : 10) {
                Text("There are no items!")
                    .font(.title)
                    .fontWeight(.semibold)
                Text ("Come on, it's time to plan something. Click the button and add a new to-do")
                    .padding(.bottom,20)
                NavigationLink (
                destination: AddView(),
                label: {
                    Text("Add Something 🤩")
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(animation ? secondaryAccentColor : Color.accentColor)
                        .cornerRadius(10)
                    
                })
                .padding(.horizontal, animation ? 30 : 50)
                .shadow(
                    color : animation ? secondaryAccentColor.opacity(0.7) :
                        Color.accentColor.opacity(0.7),
                    radius: animation ? 30 : 10,
                    x: 0,
                    y: animation ? 50 : 30)
                .scaleEffect(animation ? 1.1 : 1.0)
                .offset(y: animation ? -7 : 0 )
            }
            .frame(maxWidth: 400)
            .multilineTextAlignment(.center)
            .padding(40)
            .onAppear(perform : addAnimation)
        }
        .frame(maxWidth: .infinity , maxHeight: .infinity)
        
    }
    func addAnimation() {
        guard !animation else {return}
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5)
        {
            withAnimation(
            Animation
                .easeInOut(duration: 2.0)
                .repeatForever()
            ){
                animation.toggle()
                
            }
        }
        
    }
}

#Preview {
    
    NavigationView {
        NoItemsView()
            .navigationTitle("Title")
    }
}
