//
//  seek_athens_ver_1_1App.swift
//  seek_athens_ver_11
//
//  Created by Zach Fader on 11/11/24.
//

import SwiftUI

@main
struct seek_uga_ver_1: App {
    //Select immersionStyle
    @State private var immersionStyle: ImmersionStyle = .full
    var body: some Scene {
        
        //Always-present UI window to allow for nagivation
        WindowGroup {
            ContentView()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.hairyGrey.ignoresSafeArea())
                .opacity(0.7)
        }
        
        //Structs to contain each immersive views
        ImmersiveSpace(id: "ArchPlayer360") {
            ArchVideo360EntityTestRV()
        }.immersionStyle(selection: $immersionStyle, in: .full)
        
        ImmersiveSpace(id: "BoltonPlayer360") {
            BoltonVideo360EntityTestRV()
        }.immersionStyle(selection: $immersionStyle, in: .full)
        
        ImmersiveSpace(id: "BrumbyPlayer360") {
            BrumbyVideo360EntityTestRV()
        }.immersionStyle(selection: $immersionStyle, in: .full)
        
        ImmersiveSpace(id: "MLCPlayer360") {
            MLCVideo360EntityTestRV()
        }.immersionStyle(selection: $immersionStyle, in: .full)
        
        ImmersiveSpace(id: "SanfordPlayer360") {
            SanfordVideo360EntityTestRV()
        }.immersionStyle(selection: $immersionStyle, in: .full)
        
        ImmersiveSpace(id: "TatePlayer360") {
            TateVideo360EntityTestRV()
        }.immersionStyle(selection: $immersionStyle, in: .full)
    }
}
