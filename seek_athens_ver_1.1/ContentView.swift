//
//  ContentView.swift
//  seek_athens_ver_1.1
//
//  Created by Zach Fader on 11/11/24.
//

import SwiftUI
import RealityKit

struct ContentView: View {
    //Environment Propery Wrapper for open a ImmersiveSpace
    @Environment(\.openImmersiveSpace) private var openImmersiveSpace
    
    //Environment Propery Wrapper for closing a ImmersiveSpace
    @Environment(\.dismissImmersiveSpace) private var dismissImmersiveSpace
    
    //Boolean to check if app has been entered
    @State private var started: Bool = false
    
    //Boolean to check if an experience is active
    @State private var inExp: Bool = false
    
    //String to store current experience description
    @State private var curTitle: String = ""
    @State private var curDesc: String = ""
    
    var body: some View {
        if !started {//Still on startup screen
            //background(Color.georgiaClay.ignoresSafeArea())
            
            VStack() {
                Image("logo-large")
                    .resizable()
                    .controlSize(.large)
                    .aspectRatio(contentMode: .fit)
                //Button to enter the app
                Button("Enter") {
                    Task {
                        started = true
                    }
                }
                .padding(20)
            }
        } else { //Clicked through startup screen
            //background(Color.hairyGrey.ignoresSafeArea())
            
            if inExp {
                VStack() {
                    //Title of the current experience (welcome msg)
                    Text(curTitle)
                        .font(.title)
                        .padding()
                    
                    //Text explaining the current experience
                    Text(curDesc)
                        .font(.subheadline)
                        .padding(20)
                        .frame(width:800)
                    
                    //Button to leave current experinece
                    Button("Leave Experience") {
                        Task {
                            await dismissImmersiveSpace()
                            inExp = false
                            curTitle = ""
                            curDesc = ""
                        }
                    }
                }
                .padding()
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
                                    curDesc = "The Arch description."
                                }
                            } label: {
                                Image("arch")
                                    .resizable()
                                    .clipShape(Circle())
                            }
                            .controlSize(.regular)
                            .buttonStyle(.plain)
                            .buttonBorderShape(.circle)
                            .padding(20)
                            
                            Text("The Arch")
                                .font(.subheadline)
                                .padding(20)
                        }
                        
                        
                        VStack() {
                            //Button to control the Sanford experience
                            Button {
                                Task {
                                    await openImmersiveSpace(id: "BoltonPlayer360")
                                    inExp = true
                                    curTitle = "Welcome to the Bolton Dining Hall!"
                                    curDesc = "Bolton Description."
                                }
                            } label: {
                                Image("bolton")
                                    .resizable()
                                    .clipShape(Circle())
                                
                            }
                            .controlSize(.regular)
                            .buttonStyle(.plain)
                            .buttonBorderShape(.circle)
                            .padding(20)
                            
                            Text("Bolton Dining Hall")
                                .font(.subheadline)
                                .padding(20)
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
                                    curDesc = "The Tate Student Center is a central hub designed specifically for students, serving as the perfect gathering place for study groups, lunch breaks, and movie nights. With a variety of dining options—including Chick-fil-A, Panda Express, Starbucks, Barberitos, and the Market at Tate—students and faculty can always find delicious meals and snacks to keep them energized throughout the day. The center’s welcoming atmosphere encourages social interaction and collaboration, making it an essential part of campus life."
                                }
                            } label: {
                                Image("tate")
                                    .resizable()
                                    .clipShape(Circle())
                            }
                            .controlSize(.regular)
                            .buttonStyle(.plain)
                            .buttonBorderShape(.circle)
                            .padding(20)
                            
                            Text("The Tate Center")
                                .font(.subheadline)
                                .padding(20)
                        }
                        
                        
                        VStack() {
                            //Button to control the Sanford experience
                            Button {
                                Task {
                                    await openImmersiveSpace(id: "SanfordPlayer360")
                                    inExp = true
                                    curTitle = "Welcome to Sanford Stadium!"
                                    curDesc = "Sanford Stadium is home of the 2021-2022 Back-To-Back National Champions and a historic football venue known for its vibrant atmosphere and passionate Bulldog fans. With a capacity of approximately 93,033, it is one of the largest stadiums in the country. Dooley Field, named after the winningest football coach in Georgia history, is famously situated “between the hedges,” a cherished feature that adds to the stadium’s charm."
                                }
                            } label: {
                                Image("sanford")
                                    .resizable()
                                    .clipShape(Circle())
                                
                            }
                            .controlSize(.regular)
                            .buttonStyle(.plain)
                            .buttonBorderShape(.circle)
                            .padding(20)
                            
                            Text("Sanford Stadium")
                                .font(.subheadline)
                                .padding(20)
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
                                    curDesc = "The Miller Learning Center, affectionately known as the MLC, serves as a collaborative workspace for students. With 96 study rooms available—both private and communal—it's an ideal environment for focused learning and group projects. The center also features spacious lecture halls and classrooms designed to facilitate engaging educational experiences. Additionally it is home to the on-campus Jittery Joe’s, which remains open until 10 p.m., offering the perfect spot for a coffee break or study session."
                                }
                            } label: {
                                Image("mlc")
                                    .resizable()
                                    .clipShape(Circle())
                                
                            }
                            .controlSize(.regular)
                            .buttonStyle(.plain)
                            .buttonBorderShape(.circle)
                            .padding(20)
                            
                            Text("The MLC")
                                .font(.subheadline)
                                .padding(20)
                        }
                        
                        VStack() {
                            //Button to control the Brumby experience
                            Button {
                                Task {
                                    await openImmersiveSpace(id: "BrumbyPlayer360")
                                    inExp = true
                                    curTitle = "Welcome to Brumby Hall!"
                                    curDesc = "Brumby Hall stands as one of three prominent high-rise freshmen dorms on the University of Georgia campus. Featuring a total of 30 dormitory suites, Brumby Hall is home to the iconic rotunda, a welcoming space where students can study or connect with friends. With nine floors accommodating 940 freshmen, this residence fosters a lively community and offers a vibrant environment for new students to thrive as they embark on their college journey."
                                }
                            } label: {
                                Image("brumby")
                                    .resizable()
                                    .clipShape(Circle())
                            }
                            .controlSize(.regular)
                            .buttonStyle(.plain)
                            .buttonBorderShape(.circle)
                            .padding(20)
                            
                            Text("Brumby Hall")
                                .font(.subheadline)
                                .padding(20)
                        }
                    }
                }
            }
        }
    }
}

/*#Preview {
    VStack() {
        //Title of the current experience (welcome msg)
        Text("Welcome to Sanford Stadium!")
            .font(.title)
            .padding(20)
        
        //Text explaining the current experience
        Text("Sanford Stadium is home of the 2021-2022 Back-To-Back National Champions and a historic football venue known for its vibrant atmosphere and passionate Bulldog fans. With a capacity of approximately 93,033, it is one of the largest stadiums in the country. Dooley Field, named after the winningest football coach in Georgia history, is famously situated “between the hedges,” a cherished feature that adds to the")
            .font(.subheadline)
            .padding(20)
        
        //Button to leave current experinece
        Button("Leave Experience") {
            Task {
                "stinky"
            }
        }
        .padding(20)
    }
    .padding()
}*/
