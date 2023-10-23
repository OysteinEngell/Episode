//
//  TestDataView.swift
//  Episode
//
//  Created by Øystein Engell on 23/10/2023.
//

import SwiftUI

struct TestDataView: View {
    
    let apiClient = APIClient.live
    
    func fetchData(){
        print("Fetching data")
        
        Task {
            do {
                try await apiClient.getTVShows()
            }catch let error{
                print(error)
            }
        }
    }
    
    var body: some View {
        VStack{
            Text("TestDataView")
        }.onAppear{
            fetchData()
        }
       
    }
}

#Preview {
    TestDataView()
}
