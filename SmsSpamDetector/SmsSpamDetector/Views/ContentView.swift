//
//  ContentView.swift
//  SmsSpamDetector
//
//  Created by Daniel Negreiros Cangianelli on 16/05/25.
//

import SwiftUI

struct SpamDetectorView: View {
    @StateObject private var vm = SpamViewModel()
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Detector de Spam")
                .font(.title2)
                .bold()
            
            TextEditor(text: $vm.inputText)
                .padding(8)
                .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray))
                .frame(height: 150)
                .accessibilityLabel("Caixa de texto para inserir mensagem")
            
            Button("Classificar") {
                vm.classify()
            }
            .buttonStyle(.borderedProminent)
            .accessibilityLabel("Botão para classificar a mensagem")
            
            if !vm.classification.isEmpty {
                Text("Resultado: \(vm.classification)")
                    .font(.headline)
                    .padding(.top)
                    .accessibilityLabel("Resultado da classificação: \(vm.classification)")
            }
            
            Spacer()
        }
        .padding()
    }
}
#Preview {
    SpamDetectorView()
}
