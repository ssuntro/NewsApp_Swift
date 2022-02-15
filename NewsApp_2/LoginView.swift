//
//  LoginView.swift
//  NewsApp_2
//
//  Created by Siroratt Suntronsuk on 15/2/2565 BE.
//

import SwiftUI

//struct TextField {
//    var body: some View {}
//    @Binding var text: String
//}
//
//AnnJa(text: <#T##Binding<String>#>)

struct LoginView: View {
    @State var status = ""
    @State var email = ""
    @State var password = ""
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 16) {
                    imagePicker
                    textInput
                    loginButton
                    Text("status message: \(email)").foregroundColor(Color.teal)
                }.padding()
                

            }
            .navigationTitle("Login")
            .background(Color(white: 0, opacity: 0.05))
        }
    }
    
    var imagePicker: some View {
        Button {
            status = "imagePicker did click"
        } label: {
            Image(systemName: "person.fill")
                .font(.system(size: 64))
                .padding()
                .foregroundColor(Color(.label))
                .overlay(Circle().stroke(Color.white, lineWidth: 4))
        }
    }
    
    var textInput: some View {
        Group {
            TextField("Email", text: $email)
                .keyboardType(.emailAddress)
                .autocapitalization(.none)
            SecureField("Password", text: $password)
        }
        .padding(12)
        .background(Color.white)
    }
    
    var loginButton: some View {
        Button {
            email = "Annja"
        } label: {
            Spacer()
            Text("Login")
            Spacer()
        }
        .foregroundColor(.white)
        .padding(.vertical, 10)
        .background(.blue)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
