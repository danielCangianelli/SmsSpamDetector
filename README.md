# SMS Spam Detector

Este projeto consiste em um aplicativo iOS em SwiftUI para detecção de mensagens de spam utilizando um modelo de Machine Learning treinado com Create ML.

## Visão Geral

O **SMS Spam Detector** adota uma arquitetura MVVM, seguindo boas práticas de Clean Code, com uso de Combine e async/await para o fluxo assíncrono de classificação. O modelo de classificação de texto (`SmsSpamDetectorV1.mlmodel`) foi gerado pelo Create ML (template **Tabular Classification**) a partir do dataset **SMS Spam Collection**.

## Funcionalidades

* Inserção de texto livre para classificação de mensagens SMS.
* Classificação em tempo real (SPAM / NÃO SPAM).
* Feedback de resultado exibido de forma clara na interface.

## Estrutura do Projeto

```
Scripts
├── spam_processed.csv
├── train.csv
├── test.csv
└── proccess_sms_ds.py
SmsSpamDetector/
├── SmsSpamDetector.mlproj
├── SmsSpamDete.xcodeproj
├── SmsSpamDetector/
│   ├── Models/
│   │   └── SmsSpamDetectorV1.mlmodel
│   ├── ViewModels/
│	│	└── SpamViewModel.swift      
│	├── Views/
│   	└── SpamDetectorView.swift
└── README.md
```

## Requisitos

* Xcode 15 ou superior
* iOS 18.0+
* Swift 6

## Instalação e Execução

1. Clone este repositório:

   ```bash
   git clone https://github.com/seu-usuario/SmsSpamDetector.git
   ```
2. Abra `SmsSpamDetector.xcodeproj` no Xcode.
3. Verifique se o modelo `SMSSpamClassifier.mlmodel` está na pasta **Models**.
4. Se necessário, ajuste o target de implantação para iOS 18.0+.
5. Execute no simulador ou em dispositivo real.

## Treinamento do Modelo

Caso queira regenerar o modelo no Create ML App:

1. Abra **Create ML** e crie um novo documento **Tabular Classification**.
2. Importe `spam.csv` como **Training Data**. As colunas devem ser `label` e `message`.
3. Ajuste o split (ex.: 80/20) e clique em **Train**.
4. Exporte o modelo como `SMSSpamClassifier.mlmodel` e substitua na pasta **Models**.
