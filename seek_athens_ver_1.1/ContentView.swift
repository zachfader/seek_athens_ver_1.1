//
//  ContentView.swift
//  seek_athens_ver_1.1
//
//  Created by Zach Fader on 11/11/24.
//

import SwiftUI
import AVKit
import RealityKit

struct ContentView: View {
    //Environment Propery Wrapper for open a ImmersiveSpace
    @Environment(\.openImmersiveSpace) private var openImmersiveSpace
    
    //Environment Propery Wrapper for closing a ImmersiveSpace
    @Environment(\.dismissImmersiveSpace) private var dismissImmersiveSpace
    
    //String to track app screen
    @State private var screen: String = "startup"
    
    //Boolean to check if an experience is active
    @State private var inExp: Bool = false
    
    //String to store current experience description
    @State private var curTitle: String = ""
    
    //AVPlayer to store current video clip
    @State var player = AVPlayer(url: Bundle.main.url(forResource: "intro", withExtension: "mov")!) //
    
    var body: some View {
        if screen == "startup" {
            
            //Still on startup screen
            VStack() {
                Image("logo-large")
                 .resizable()
                 .controlSize(.small)
                 .aspectRatio(contentMode: .fit)
                 
                //Button to begin the app
                Button("Begin") {
                    Task {
                        screen = "intro"
                    }
                }
                .padding(.all, 10)
            }
            
        } else if screen == "intro" {
            
            //VideoPlayer for the startup message
            VideoPlayer(player: player, videoOverlay: {
               VStack(alignment: .center) {
                   Text("Introduction")
                       .foregroundColor(Color.gray)
                       .font(.title)
                       .padding(.all, 10)
                   
                   Spacer()
                   
                   //Button to enter the app
                   Button("View Experiences") {
                       Task {
                           screen = "hub"
                       }
                   }
                   .padding(.all, 10)
               }
            })
            .frame(width: 1280, height: 720, alignment: .center)
            .onAppear() {
                player.play()
            }
               
            
        } else if screen == "hub"{ //Clicked through startup screen
            //background(Color.hairyGrey.ignoresSafeArea())
            
            if inExp {
                VideoPlayer(player: player, videoOverlay: {
                   VStack(alignment: .center) {
                       //Title of the current experience (welcome msg)
                       Text(curTitle)
                           .foregroundColor(Color.gray)
                           .font(.title)
                           .padding(.all, 10)
                       
                       Spacer()
                       
                       //Button to leave current experinece
                       Button("Leave Experience") {
                           Task {
                               await dismissImmersiveSpace()
                               inExp = false
                               curTitle = ""
                           }
                       }
                       .padding(.all, 10)
                   }
                })
                .frame(width: 1280, height: 720, alignment: .center)
                .onAppear() {
                    player.play()
                }
                    
            } else {
                HStack() {
                    VStack() {
                        VStack() {
                            //Button to control the Arch experience
                            Button {
                                Task {
                                    await openImmersiveSpace(id: "ArchPlayer360")
                                    inExp = true
                                    curTitle = "Welcome to the Arch!"
                                    player = AVPlayer(url: Bundle.main.url(forResource: "arch", withExtension: "mov")!)
                                }
                            } label: {
                                Image("arch")
                                    .resizable()
                                    .clipShape(Circle())
                            }
                            .controlSize(.regular)
                            .buttonStyle(.plain)
                            .buttonBorderShape(.circle)
                            .padding(.all, 10)
                            
                            Text("The Arch")
                                .font(.subheadline)
                                .padding(.all, 10)
                        }
                        
                        
                        VStack() {
                            //Button to control the Sanford experience
                            Button {
                                Task {
                                    await openImmersiveSpace(id: "BoltonPlayer360")
                                    inExp = true
                                    curTitle = "Welcome to the Bolton Dining Hall!"
                                    player = AVPlayer(url: Bundle.main.url(forResource: "bolton", withExtension: "mov")!)
                                }
                            } label: {
                                Image("bolton")
                                    .resizable()
                                    .clipShape(Circle())
                                
                            }
                            .controlSize(.regular)
                            .buttonStyle(.plain)
                            .buttonBorderShape(.circle)
                            .padding(.all, 10)
                            
                            Text("Bolton Dining Hall")
                                .font(.subheadline)
                                .padding(.all, 10)
                        }
                    }
                    VStack() {
                        VStack() {
                            //Button to control the Tate experience
                            Button {
                                Task {
                                    await openImmersiveSpace(id: "TatePlayer360")
                                    inExp = true
                                    curTitle = "Welcome to the Tate Student Center!"
                                    player = AVPlayer(url: Bundle.main.url(forResource: "tate", withExtension: "mov")!)
                                }
                            } label: {
                                Image("tate")
                                    .resizable()
                                    .clipShape(Circle())
                            }
                            .controlSize(.regular)
                            .buttonStyle(.plain)
                            .buttonBorderShape(.circle)
                            .padding(.all, 10)
                            
                            Text("The Tate Center")
                                .font(.subheadline)
                                .padding(.all, 10)
                        }
                        
                        
                        VStack() {
                            //Button to control the Sanford experience
                            Button {
                                Task {
                                    await openImmersiveSpace(id: "SanfordPlayer360")
                                    inExp = true
                                    curTitle = "Welcome to Sanford Stadium!"
                                    player = AVPlayer(url: Bundle.main.url(forResource: "sanford", withExtension: "mov")!)
                                }
                            } label: {
                                Image("sanford")
                                    .resizable()
                                    .clipShape(Circle())
                                
                            }
                            .controlSize(.regular)
                            .buttonStyle(.plain)
                            .buttonBorderShape(.circle)
                            .padding(.all, 10)
                            
                            Text("Sanford Stadium")
                                .font(.subheadline)
                                .padding(.all, 10)
                        }
                    }
                    VStack() {
                        VStack() {
                            //Button to control the MLC experience
                            Button {
                                Task {
                                    await openImmersiveSpace(id: "MLCPlayer360")
                                    inExp = true
                                    curTitle = "Welcome to the Miller Learning Center!"
                                    player = AVPlayer(url: Bundle.main.url(forResource: "mlc", withExtension: "mov")!)
                                }
                            } label: {
                                Image("mlc")
                                    .resizable()
                                    .clipShape(Circle())
                                
                            }
                            .controlSize(.regular)
                            .buttonStyle(.plain)
                            .buttonBorderShape(.circle)
                            .padding(.all, 10)
                            
                            Text("The MLC")
                                .font(.subheadline)
                                .padding(.all, 10)
                        }
                        
                        VStack() {
                            //Button to control the Brumby experience
                            Button {
                                Task {
                                    await openImmersiveSpace(id: "BrumbyPlayer360")
                                    inExp = true
                                    curTitle = "Welcome to Brumby Hall!"
                                    player = AVPlayer(url: Bundle.main.url(forResource: "brumby", withExtension: "mov")!)
                                }
                            } label: {
                                Image("brumby")
                                    .resizable()
                                    .clipShape(Circle())
                            }
                            .controlSize(.regular)
                            .buttonStyle(.plain)
                            .buttonBorderShape(.circle)
                            .padding(.all, 10)
                            
                            Text("Brumby Hall")
                                .font(.subheadline)
                                .padding(.all, 10)
                        }
                    }
                }
            }
        }
    }
}
