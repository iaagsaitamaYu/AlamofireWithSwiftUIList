//
//  ContentView.swift
//  QiitaApiWithSwiftUIAlamofire
//
//  Created by 箭内雄 on 2023/09/16.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var getQiitaData =  GetQiitaData()
    
    var body: some View {
        List($getQiitaData.qiitaModels) { $model in
            Text(model.title)
        }.onAppear() {
            getQiitaData.fetchData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
