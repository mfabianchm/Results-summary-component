//
//  ContentView.swift
//  Results-summary-component
//
//  Created by Marcos Fabian Chong Megchun on 17/02/24.
//

import SwiftUI

struct Info: Hashable {
    var id = UUID()
    var image: String
    var text: String
    var number: String
    var color: String
}

var data: [Info] = [
    Info(image: "icon-reaction", text: "Reaction", number: "80", color: "light-red"),
    Info(image: "icon-memory", text: "Memory", number: "92", color: "orange-yellow"),
    Info(image: "icon-verbal", text: "Verbal", number: "61", color: "green-teal"),
    Info(image: "icon-visual", text: "Visual", number: "72", color: "cobalt-blue"),
]




struct ContentView: View {
    var body: some View {
        VStack {
            UpCard()
            Spacer()
            SummaryView()
            Button("Continue", action: {})
                .padding()
                .frame(maxWidth: 350)
                .background(Color("dark-gray-blue"))
                .clipShape(Capsule())
                .foregroundColor(.white)
                .font(.custom("HankenGrotesk-Bold", size: 18))
                
        
        }
        .ignoresSafeArea()
    }
}

struct UpCard: View {
    var body: some View {
        VStack {
            Text("Your result")
                .foregroundColor(Color("light-lavender"))
                .font(.custom("HankenGrotesk-Bold", size: 17))
                .padding(.top)
            VStack {
                Text("76")
                    .font(.custom("HankenGrotesk-ExtraBold", size: 50))
                    .foregroundColor(.white)
                Text("of 100")
                    .font(.custom("HankenGrotesk-Bold", size: 18))
                    .foregroundColor(Color("light-lavender"))
            }
                .frame(width: 150, height: 150)
                .background {
                    LinearGradient(gradient: Gradient(colors: [Color("persian-blue"), Color("violet-blue")]), startPoint: .top, endPoint: .bottom)
                                .ignoresSafeArea()
                        }
                .clipShape(Circle())
            
            Text("Great")
                .foregroundColor(.white)
                .font(.custom("HankenGrotesk-Bold", size: 19))
            Text("You scored higher than 65% of the people who have taken these test.")
                .foregroundColor(Color("light-lavender"))
                .font(.custom("HankenGrotesk-Bold", size: 17))
        }
        .padding(40)
        .frame(maxWidth: .infinity)
        .background {
            LinearGradient(gradient: Gradient(colors: [Color("light-slate-blue"), Color("light-royal-blue")]), startPoint: .top, endPoint: .bottom)
                        .ignoresSafeArea()
                }
        .cornerRadius(30)
    }
}

struct SummaryView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Summary")
            VStack {
                ForEach(data, id: \.self) { data in
                    HStack {
                        Image(data.image)
                        Text(data.text)
                            .foregroundColor(Color(data.color))
                        Spacer()
                        Text(data.number)
                        + Text(" / 100")
                            .foregroundColor(.gray)
                    }
                    .padding(20)
                    .background(Color(data.color).opacity(0.1), in: RoundedRectangle(cornerRadius: 10))
                    .padding(.bottom, 10)
                }
            }
            
            Spacer()
        }
        .font(.custom("HankenGrotesk-ExtraBold", size: 20))
        .padding(20)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

