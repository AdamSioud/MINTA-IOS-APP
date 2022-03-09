//
//  CustomCameraView.swift
//  MINTA
//
//  Created by Even Lauvrak on 21/02/2022.
//

import SwiftUI

struct CustomCameraView: View {
    
    let cameraService = CameraService()
    @Binding var capturedImage: UIImage?
    @State private var isCustomCameraViewPresented = false
    @State var isNavigationBarHidden: Bool = true
    @State var isAnimating: Bool = false
    @Environment(\.presentationMode) private var presentationMode
    
    
    
    var body: some View {
        NavigationView {
            ZStack {
                CameraView(cameraService: cameraService) { result in
                    switch result {
                        
                    case .success(let photo):
                        print("SUCCESS")
                        if let data = photo.fileDataRepresentation() {
                            capturedImage = UIImage(data: data)
                            isCustomCameraViewPresented.toggle()
                        } else {
                            print("Error: no image data found")
                        }
                    case .failure(let err):
                        print("FAILS")
                        print(err.localizedDescription)
                    }
                }
                
                VStack {
                    Spacer ()
                    
                    
                    
                    Button {
                        DispatchQueue.main.async {
                            withAnimation() {
                                isAnimating.toggle()
                                cameraService.capturePhot()
                            }
                        }
                    } label: {
                        
                        
                        if isAnimating {
                            Spinner()
                                .padding()
                        }
                        else {
                            Circle()
                                .strokeBorder(Color("customLightBlue"), lineWidth: 6)
                                .frame(width: 80, height: 80)
                                .clipped()
                                .shadow(radius: 5)
                                .padding()
                        }
                    }
//                    .sheet(isPresented: $isCustomCameraViewPresented) {
//                        if isCustomCameraViewPresented {
//                            MintView(image: capturedImage!)
//                        }
//                    }
                    .sheet(isPresented: $isCustomCameraViewPresented) {
                        isAnimating = false
                        isCustomCameraViewPresented = false
                        capturedImage = nil
                    } content: {
                        if isCustomCameraViewPresented {
                            MintView(image: capturedImage!)
                        }
                    }

                    
                }
            }
            .edgesIgnoringSafeArea(.all)
        }
    }
}
