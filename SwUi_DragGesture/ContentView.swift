//
//  ContentView.swift
//  SwUi_DragGesture
//
//  Created by Marcelo Sampaio on 02/12/22.
//

import SwiftUI

struct ContentView: View {
    @State var viewState = CGSize.zero

    var body: some View {
        ZStack {
            offsetDisplay

            ball
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension ContentView {
    var offsetDisplay: some View {
        VStack {
            Text(String(Double(viewState.width)))
            
            Text(String(Double(viewState.height)))
        }
        .font(.largeTitle)
    }
}


extension ContentView {
    var ball: some View {
        RoundedRectangle(cornerRadius: 40)
            .fill(viewState.height < 0 ? .blue : .red)
            .frame(width: 80, height: 80)
            .offset(x: viewState.width, y: viewState.height)
            .gesture(
                DragGesture().onChanged { value in
                    viewState = value.translation
                }
                .onEnded { value in
                    withAnimation(.spring()) {
                        viewState = .zero
                    }
                }
            )
    }
}
