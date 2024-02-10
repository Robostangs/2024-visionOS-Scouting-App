//
//  ContentView.swift
//  2024 visionOS Scouting App
//
//  Created by Thirak Buch and Jason Kaip on 2/10/24.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {
        @State var StudentID = ""
        @State var TeamNumber = ""
        @State var MatchNumber = ""
        @State var LeftStarting = "No"
        let LeftStartingOptions = ["No", "Yes"]
        @State var LeftStartingValue: String = "0"
        
        @State var autoAmp: Int = 0
        @State var autoAmpValue: String = "0"
        
        @State var autoSpeaker: Int = 0
        @State var autoSpeakerValue: String = "0"
        
        @State var teleAmp: Int = 0
        @State var teleAmpValue: String = "0"
        
        @State var teleSpeaker: Int = 0
        @State var teleSpeakerValue: String = "0"
        
        @State var Defensebot = "No"
        let Defensebotoptions = ["No", "Yes"]
        @State var DefensebotValue: String = "0"
        
        @State var Noteintrap: Int = 0
        @State var NoteintrapValue: String = "0"
        
        @State var Finishingposition = "None"
        let Finishingpositionoptions = ["None", "Parked", "On Chain", "Two on Chain", "Three on Chain"]
        @State var FinishingpositionValue: String = "0"
        
        @State var Comments = ""
        
        @State private var elapsedTime: TimeInterval = 0
        @State private var isTimerRunning = false
        @State private var timer: Timer? = nil
        @State var TimerValue: String = ""
        
            var body: some View {
                NavigationStack{
                    ScrollView{
                        VStack (alignment: .leading, spacing: 15){
                            Group{
                                HStack {
                                    Text("Crescendo Scouting App")
                                        .font(.largeTitle).foregroundColor(Color.orange).multilineTextAlignment(.center).bold().italic()
                                }
                                .padding(.bottom, 0.5)
                                .frame(maxWidth: .infinity, alignment: .center)
                                
                                HStack{
                                    Text("548 Northville Robostangs")
                                        .font(.title3)
                                        .bold()
                                        .frame(maxWidth: .infinity, alignment: .center)
                                }.frame(alignment: .center)
                                HStack{
                                    Text("Student ID:")
                                        .font(.headline)
                                    TextField("Student ID", text:$StudentID)
                                    Text("Team Number:")
                                        .font(.headline)
                                    TextField("Team Number", text:$TeamNumber)
                                    Text("Match Number:")
                                        .font(.headline)
                                    TextField("Match Number", text:$MatchNumber)
                                }
                                .frame(alignment: .center)
                                .padding(.top, 10.0)
                                .padding(.leading, 15)
                                
                            }
                            Group{
                                
                                HStack{
                                    Text("Autonomous")
                                        .font(.title)
                                        .foregroundColor(Color.orange).bold()
                                        .padding(.top,20.0)
                                }.frame(maxWidth: .infinity, alignment: .center)
                                
                                HStack{
                                    Text("Robot Left Starting Area?")
                                        .font(.headline)
                                        .frame(alignment: .center)
                                    
                                    Picker(selection: $LeftStarting,
                                           label: Text("Left Starting?")) {
                                        ForEach(LeftStartingOptions, id: \.self)
                                        {option in Text(option)}
                                            .onChange(of: LeftStarting) { newValue in
                                                switch newValue {
                                                case "Yes":
                                                    LeftStartingValue = "1"
                                                case "No Mobility":
                                                    LeftStartingValue = "0"
                                                default:
                                                    LeftStartingValue = "0"
                                                }
                                            }
                                    }
                                           .accentColor(.orange)
                                           .bold()
                                           .padding(3.0)
                                           .frame(height: 30)
                                           .frame(width: 150)
                                           .pickerStyle(SegmentedPickerStyle())
                                           .frame(alignment: .center)
                                }
                                .padding(.top, 1)
                                .padding(.leading, 15)
                                       
                                HStack{
                                    Text("Amp Notes: \(autoAmp)")
                                        .font(.headline)
                                        .padding(.trailing, 20)
                                    
                                    Stepper("", value:$autoAmp, in: 0...100, step: 1)
                                        .frame(height: 40)
                                        .frame(width: 60)
                                       
                                }
                                .padding(.leading, 15)
                                .onChange(of: autoAmp) { newValue in
                                    autoAmpValue = "\(newValue)"
                                }
                            }
                            HStack{
                                Text("Speaker Notes: \(autoSpeaker)")
                                    .font(.headline)
                                    .padding(.trailing, 20)
                                
                                
                                Stepper("", value:$autoSpeaker, in: 0...100, step: 1)
                                    .fixedSize()
                                    .frame(height: 40)
                                    .frame(width: 60)
                                            
                            }
                            .padding(.leading, 15)
                            .onChange(of: autoSpeaker) { newValue in
                                autoSpeakerValue = "\(newValue)"
                            }
                                  
                            Group{
                                HStack{
                                    Text("Tele-Op")
                                        .font(.title)
                                        .foregroundColor(Color.orange).multilineTextAlignment(.center).bold()
                                        .padding(.top,20.0)
                                }
                                .frame(maxWidth: .infinity, alignment: .center)
                                HStack{
                                    Text("Defense Bot?")
                                        .font(.headline)
                                    
                                    Picker(selection: $Defensebot,
                                           label: Text("Defense Bot?")) {
                                        ForEach(Defensebotoptions, id: \.self)
                                        {option in Text(option)}
                                            .onChange(of: Defensebot) { newValue in
                                                switch newValue {
                                                case "Yes":
                                                    DefensebotValue = "1"
                                                case "No Mobility":
                                                    DefensebotValue = "0"
                                                default:
                                                    DefensebotValue = "0"
                                                }
                                            }
                                    }
                                           .accentColor(.orange)
                                           .bold()
                                           .padding(3.0)
                                           .frame(height: 30)
                                           .frame(width: 150)
                                           .pickerStyle(SegmentedPickerStyle())
                                }
                                .padding(.top, 1)
                                .padding(.leading, 15)
                                
                                HStack{
                                    Text("Amp Notes: \(teleAmp)")
                                        .font(.headline)
                                        .padding(.trailing, 20)
                                    
                                    
                                    Stepper("", value:$teleAmp, in: 0...100, step: 1)
                                        .fixedSize()
                                        .frame(height: 40)
                                        .frame(width: 60)
                                        
                                }
                                .padding(.leading, 15)
                                .onChange(of: teleAmp) { newValue in
                                    teleAmpValue = "\(newValue)"
                                }
                                HStack{
                                    Text("Speaker Notes: \(teleSpeaker)")
                                        .font(.headline)
                                        .padding(.trailing, 20)
                                    
                                    Stepper("", value:$teleSpeaker, in: 0...100, step: 1)
                                        .fixedSize()
                                        .frame(height: 40)
                                        .frame(width: 60)
                                }
                                .padding(.leading, 15)
                                .onChange(of: teleSpeaker) { newValue in
                                    teleSpeakerValue = "\(newValue)"
                                }
                            }
                            
                            Group{
                                HStack{
                                    Text("Endgame")
                                        .font(.title)
                                        .foregroundColor(Color.orange).multilineTextAlignment(.center).bold()
                                        .padding(.top, 10.0)
                                }
                                .frame(maxWidth: .infinity, alignment: .center)
                                
                                HStack {
                                    Button(action: {
                                        if self.isTimerRunning {
                                            self.timer?.invalidate()
                                        } else {
                                            self.timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { _ in
                                                self.elapsedTime += 0.01
                                            }
                                        }
                                        self.isTimerRunning.toggle()
                                    }) {
                                        Text(self.isTimerRunning ? "Stop" : "Start")
                                            //.frame(height: 60)
                                            //.frame(width: 80)
                                            //.foregroundColor(.white)
                                            //.background(self.isTimerRunning ? Color.red : Color.orange)
                                            //.cornerRadius(10)
                                    }
                                    
                                    Text(String(format: "%.2f", elapsedTime))
                                        .font(.title).bold().padding()
                                    
                                    Button(action: {
                                        self.timer?.invalidate()
                                        self.isTimerRunning = false
                                        self.elapsedTime = 0
                                    }) {
                                        Text("Reset")
//                                            .frame(height: 60)
//                                            .frame(width: 80)
//                                            .foregroundColor(.white)
//                                            .background(Color.gray)
//                                            .cornerRadius(10)
                                    }
                                }
                                .frame(maxWidth: .infinity, alignment: .center)
                                .onChange(of: elapsedTime) { newValue in
                                    TimerValue = String(format: "%.2f", newValue)
                                }
                                
                                HStack{
                                    Text("Notes in Trap: \(Noteintrap)")
                                        .font(.headline)
                                        .padding(.trailing, 20)
                                    
                                    Stepper("", value:$Noteintrap, in: 0...100, step: 1)
                                        .fixedSize()
                                        .frame(height: 40)
                                        .frame(width: 60)
                                }
                                .padding(.leading, 15)
                                .padding(.top, -15)
                                .onChange(of: Noteintrap) { newValue in
                                    NoteintrapValue = "\(newValue)" }
                                   
                                HStack{
                                    Text("Finishing Position?")
                                        .font(.headline)

                                    Picker(selection: $Finishingposition,
                                           label: Text("Note in Trap?")) {
                                        ForEach(Finishingpositionoptions, id: \.self)
                                        {option in Text(option)}
                                            .onChange(of: Finishingposition) { newValue in
                                                switch newValue {
                                                case "Three on Chain":
                                                    FinishingpositionValue = "4"
                                                case "Two on Chain":
                                                    FinishingpositionValue = "3"
                                                case "On Chain":
                                                    FinishingpositionValue = "2"
                                                case "Parked":
                                                    FinishingpositionValue = "1"
                                                case "None":
                                                    FinishingpositionValue = "0"
                                                default:
                                                    FinishingpositionValue = "0"
                                                }
                                            }
                                    }
//                                           .padding()
//                                           .frame(height: 40)
//                                           .frame(width: 200)
//                                           .background(Color.gray)
//                                           .cornerRadius(10)
//                                           .accentColor(.white)
//                                           .font(.system(size: 20))
                                           .multilineTextAlignment(.center)
                                }
                                .padding(.leading, 15)
                                HStack{
                                    Text("Comments:")
                                    TextField("Died, Fast Cycles, etc.", text:$Comments)
                                }
                                .font(.headline)
                                .padding(.leading, 15)
                                .padding(.top, 10.0)
                                Group{
                                    HStack{
                                        let data1 = StudentID + ","
                                        + TeamNumber + ","
                                        + MatchNumber + ","
                                        + LeftStartingValue + ","
                                        + autoAmpValue + ","
                                        
                                        let data2 = autoSpeakerValue + ","
                                        + DefensebotValue + ","
                                        + teleAmpValue + ","
                                        + teleSpeakerValue + ","
                                        + TimerValue + ","
                                        
                                        let data3 = NoteintrapValue + ","
                                        + FinishingpositionValue + ","
                                        + Comments
                                        
                                        let data = data1 + data2 + data3
                                        
                                        NavigationLink(destination: QRView(string: data)){
                                            Text("Done")
//                                                .accentColor(.white)
//                                                .padding(20)
//                                                .frame(height: 60)
//                                                .frame(width: 100)
//                                                .background(Color.orange)
//                                                .cornerRadius(10)
//                                                .font(.title2)
                                        }
                                        .frame(maxWidth: .infinity, alignment: .center)
                                        .disabled(TeamNumber.isEmpty || MatchNumber.isEmpty || StudentID.count != 8)
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }

        struct QRView: View {
            @State var showConfirmation = false
            //"string" is the string that we passed over from the other page, I think
            let string: String
            @State var navigateToNextView = false
            var body: some View {
                //Displays an image using the generateQRCode function
                Image(uiImage: generateQRCode(from: string))
                    .interpolation(.none)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 350)
                    .frame(width: 350)
                VStack{
                    Button("Next Match") {
                        navigateToNextView = true
                    }
                    .accentColor(.white)
                    
                    .accentColor(.white)
                    .padding(20)
                    .frame(height: 60)
                    .frame(width: 160)
                    .background(Color.orange)
                    .cornerRadius(10)
                    .padding()
                    .font(.title2)
                    .onTapGesture {
                        navigateToNextView = true
                    }
                    NavigationLink(destination: ContentView(), isActive: $navigateToNextView) {
                        EmptyView()
                    }
                    .navigationTitle("QR Code View")
                    .onDisappear {
                        navigateToNextView = true
                    }
                }
                //.frame(width: UIScreen.main.bounds.width * 0.095)
            }
        }

    //Function that generates the QR code using the string we provide.
    func generateQRCode(from string: String) -> UIImage {
        let data = string.data(using: .ascii)
        guard let filter = CIFilter(name: "CIQRCodeGenerator") else { return UIImage() }
        filter.setValue(data, forKey: "inputMessage")
        guard let qrCodeImage = filter.outputImage else { return UIImage() }
        let transform = CGAffineTransform(scaleX: 10, y: 10)
        let scaledQRCodeImage = qrCodeImage.transformed(by: transform)
        guard let cgImage = CIContext().createCGImage(scaledQRCodeImage, from: scaledQRCodeImage.extent) else { return UIImage() }
        return UIImage(cgImage: cgImage)
    }

#Preview(windowStyle: .automatic) {
    ContentView()
}

struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
