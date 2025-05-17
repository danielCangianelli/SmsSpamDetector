import Foundation
import Combine
import CoreML

@MainActor
class SpamViewModel: ObservableObject {
    @Published var inputText: String = ""
    @Published var classification: String = ""
    private lazy var model = try! SmsSpamDetectorV1(configuration: MLModelConfiguration())
    
    /// Dispara a classificação de forma assíncrona
    func classify() {
        Task { [inputText] in
            classification = await performClassification(on: inputText)
        }
    }

    /// Executa a predição e retorna o resultado já formatado
    private func performClassification(on text: String) async -> String {
        do {
            let prediction = try model.prediction(text: text)
            return prediction.label.caseInsensitiveCompare("ham") == .orderedSame
                ? "NÃO SPAM"
                : "SPAM"
        } catch {
            print("Classification error: \(error.localizedDescription)")
            return "ERRO AO CLASSIFICAR"
        }
    }
}
