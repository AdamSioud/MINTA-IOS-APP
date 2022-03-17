//
//  MintView.swift
//  MINTA
//
//  Created by Even Lauvrak on 23/02/2022.
//

import SwiftUI
import Foundation



struct MintView: View {
    
    @State var image: UIImage?
    @State private var title: String = ""
    @Environment(\.presentationMode) private var presentationMode
   
    func getWallet(){
    let headers = ["x-api-key": "bd0d4303-daef-4ee8-ac44-5d4d7f4eed5f"]


    let url = URL(string: "https://api-eu1.tatum.io/v3/solana/wallet")
    guard let requestUrl = url else { fatalError() }
    // Create URL Request
    var request = URLRequest(url: requestUrl)
    // Specify HTTP Method to use
    request.httpMethod = "GET"
    request.allHTTPHeaderFields = headers


    // Send HTTP Request
    let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
        
        // Check if Error took place
        if let error = error {
            print("Error took place \(error)")
            return
        }
        
        // Read HTTP Response Status code
        if let response = response as? HTTPURLResponse {
            print("Response HTTP Status code: \(response.statusCode)")
        }
        
        // Convert HTTP Response Data to a simple String
        if let data = data, let dataString = String(data: data, encoding: .utf8) {
            print("Response data string:\n \(dataString)")
        }
        
    }
    task.resume()
    }
    
    func mintNFT(){
        
        


        let headers = ["content-type": "application/json",
                       "x-api-key": "bd0d4303-daef-4ee8-ac44-5d4d7f4eed5f" ]


        let url = URL(string: "https://api-eu1.tatum.io/v3/nft/mint")
        guard let requestUrl = url else { fatalError() }
        // Prepare URL Request Object
        var request = URLRequest(url: requestUrl)


        let parameters = [
          "chain": "SOL",
          "from": "GcphGFkdBkBPQGS9Sfru8MeGyapd2ZdisWMqnk6pirH",
          "fromPrivateKey": "4YxA9wEvcMe89RfhhaE32vDdCaEbpWD9jADatezkSZaWTdZPsANM8Gkkc12xbFguFqfmpp32EafdKLWvQWHjcLdB",
            "to": "ANjwQsi8hF8LB78vCpai2JWjkYd5VN7ers4qowtoTKe8",
            "metadata": [
                "name": "TODAY",
                "symbol": "MINTA",
                "sellerFeeBasisPoints": 0,
                "creators":      [[
                    "address": "GcphGFkdBkBPQGS9Sfru8MeGyapd2ZdisWMqnk6pirH",
                    "verified": 1,
                    "share": 100
        ]],
                "uri": "https://www.nba.com/celtics/sites/celtics/files/tatum_27.jpg"
            ]
        ]
          as [String : Any]

        let postData =  try! JSONSerialization.data(withJSONObject: parameters, options: [])


        request.httpMethod = "POST"
        request.allHTTPHeaderFields = headers
        request.httpBody = postData as Data


        /// Perform HTTP Request
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                // Check for Error
                if let error = error {
                    print("Error took place \(error)")
                    return
                }
         
                // Convert HTTP Response Data to a String
                if let data = data, let dataString = String(data: data, encoding: .utf8) {
                    print("Response data string:\n \(dataString)")
                }
        }
        task.resume()
        
    }
    
    
    var body: some View {
        ZStack {
            
            Color.xWhite
            
            VStack {
                
                HStack {
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        HStack {
                            Image(systemName: "chevron.backward")
                            
                            Text("Exit")
                        }
                        .font(.system(size: 20))
                        .foregroundColor(.xPurple)
                        .padding()
                    }
                    Spacer()
                }
                
                if image != nil {
                    Image(uiImage: image!)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 300)
                        .cornerRadius(8)
                        .shadow(radius: 8)
                }
                else {
                    Image("image")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 300)
                        .cornerRadius(8)
                        .shadow(radius: 8)
                }
                
                
                TextField("Enter title..", text: $title)
                    .font(.system(size: 40, weight: .bold))
                    .foregroundColor(.xPurple)
                    .padding()
                
                Spacer()
                
                Button {
                    mintNFT()
                } label: {
                    
                    Text("MINT")
                        .fontWeight(.semibold)
                    
                }
                .frame(width: 120, height: 40)
                .tint(.xPurple)
                .background(Color.xWhite)
                .cornerRadius(8)
                .shadow(radius: 8)
                .padding(.bottom, 40)
                
                
                
                
            }
            
        }
        .ignoresSafeArea(edges: .bottom)
    }
}

struct MintView_Previews: PreviewProvider {
    static var previews: some View {
        MintView()
    }
}
