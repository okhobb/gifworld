//
//  ContentView.swift
//  gifworld
//
//  Created by dmitri lemmerman on 6/4/21.
//

import SwiftUI
import AVKit


struct ContentView: View {
    var body: some View {
        VStack{

            
            
            ZStack {
                VideoViewContainer()
                    .frame(width: 50, height: 50)
                    .offset(x: 50, y: 20)
                VideoViewContainer()
                    .frame(width: 50, height: 50)
                    .offset(x: -20, y: 40)
            }
            Spacer()
            HStack {
                
                Button {
                    print("Button pressed")
                } label: {
                    Text("Press Me")
                        .padding(20)
                }
                .contentShape(Rectangle())
                
                Button {
                    print("Button smashed")
                } label: {
                    Text("Press 2")
                        .padding(20)
                }
                .contentShape(Rectangle())
                
                
            }

        }

    }
}

struct VideoViewContainer: View {
    var body: some View {
        VideoView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
