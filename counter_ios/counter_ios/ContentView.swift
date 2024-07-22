//
//  ContentView.swift
//  counter_ios
//
//  Created by Cody on 7/22/24.
//

import SwiftUI

import Flutter

struct FlutterViewControllerRepresentable: UIViewControllerRepresentable {
  // Flutter dependencies are passed in through the view environment.
  @Environment(FlutterDependencies.self) var flutterDependencies
  
  func makeUIViewController(context: Context) -> some UIViewController {
    return FlutterViewController(
      engine: flutterDependencies.flutterEngine,
      nibName: nil,
      bundle: nil)
  }
  
  func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {}
}

struct ContentView: View {
    @State private var count = 0
    @State private var showingSheet = false
    var body: some View {
        ZStack {
            Text("\(count)").font(.largeTitle).fontWeight(.bold)
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Button(action: {
                        count += 1
                        if( count % 10 == 0) {
                            showingSheet.toggle()
                        }
                    }) {
                        Image(systemName: "plus")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .clipShape(Circle())
                            .shadow(radius: 10)
                    }.padding()
                }
            }
        }.sheet(isPresented: $showingSheet) {
            FlutterViewControllerRepresentable()
        }
    }
}

#Preview {
    ContentView()
}
