//
//  ContentView.swift
//  CarForSwiftUI
//
//  Created by cynfenghanxing on 2020/12/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        NavigationView {
            VStack {
                TCSearchBarView()
            }
            
            
//            NavigationLink (
//                destination: Text("Destination"),
//                label: {
//                    Text("Hello, world!")
//                        .foregroundColor(.blue)
//                        .padding()
//                }
//            )
            .navigationBarTitle(Text("汽车报价大全"), displayMode: .inline)
//            .navigationBarHidden(true)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


