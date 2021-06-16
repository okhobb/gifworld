//
//  ContentView.swift
//  gifworld
//
//  Created by dmitri lemmerman on 6/4/21.
//

import SwiftUI
import AVKit

import GiphyUISDK


class UiState: ObservableObject {
    @Published var isOverlayOpened = false
}

struct ContentView: View {
    
    @ObservedObject var uiState = UiState()

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
                    uiState.isOverlayOpened.toggle()
                } label: {
                    Text("Pik-a-gif")
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
        .sheet(isPresented: $uiState.isOverlayOpened) {
            GiphyUIView() {
                uiState.isOverlayOpened = false
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


struct GiphyUIView: UIViewControllerRepresentable {
    
    var onDismissHandler: () -> Void

    class Coordinator: NSObject, GiphyDelegate {
        
        let parent: GiphyUIView
        
        init(_ parent: GiphyUIView) {
            self.parent = parent
        }
        
        func didDismiss(controller: GiphyViewController?) {
            print("dismissed")
            self.parent.onDismissHandler()
        }
        
        func didSelectMedia(giphyViewController: GiphyViewController, media: GPHMedia)   {
            print("selected some shit", media)
             // your user tapped a GIF!
             giphyViewController.dismiss(animated: true, completion: nil)
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<GiphyUIView>) -> GiphyViewController {
        let gvc = GiphyViewController()
        gvc.delegate = context.coordinator
        return gvc
    }

    func updateUIViewController(_ ctrl: GiphyViewController, context: UIViewControllerRepresentableContext<GiphyUIView>) {
    }
    
    
    init(onDismissHandler: @escaping () -> Void) {
        self.onDismissHandler = onDismissHandler
        
        let config = GiphyConfig()
        config.initGiphyApi()
    }
}

