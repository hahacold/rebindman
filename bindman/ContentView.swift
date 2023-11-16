//
//  ContentView.swift
//  bindman
//
//  Created by test on 2023/11/14.
//

import SwiftUI
import PhotosUI
var emojiList = [
    "😀", "😃", "😄", "😁", "😆", "😅", "🤣", "😂", "🙂", "🙃",
    "😉", "😊", "😇", "🥰", "😍", "🤩", "😘", "😗", "😙", "😚",
    "😋", "😛", "😝", "😜", "🤪", "🤨", "🧐", "🤓", "😎", "🥸",
    "🤠", "🤡", "🥳", "🥴", "😵", "🤯", "🤢", "🤮", "🤧", "😷",
    "🤒", "🤕", "🥵", "🥶", "😴", "💤", "🥱", "😴", "🤤", "🥴",
    "😵", "🤯", "🤢", "🤮", "🤧", "😷", "🤒", "🤕", "🥵", "🥶"
  ];
struct ContentView: View {
    @State private var selectedPhoto: PhotosPickerItem?
    @State private var mode = ""
    @State private var selectedImageData: Data?
    @State private var itemAmount = 0
    @State private var emojinow = "😀"
    @State private var photoIsSet = false
    @State private var caption = "Test"
    @State private var captionx = 0
    @State private var captiony = 100
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [.black, .gray, .white]), startPoint: .top, endPoint: .bottom)
                 .ignoresSafeArea()
                 .opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
            VStack {
                ZStack{
                    
                    if let selectedImageData,let uiImage = UIImage(data: selectedImageData) {
                        Image(uiImage: uiImage)
                            .resizable()
                            .scaledToFit()
                            
                            
                            //.frame(width: 250, height: 250)
                            .onAppear(perform: {
                                itemAmount = Int.random(in: 3...6)
                            })
                    }
                    if photoIsSet == true {
                        if mode == "右下角"{
                            Text(emojinow)
                                .font(.system(size: 40))

                                .offset(x: 155, y: 100)
                        }
                        else if mode == "環繞"{
                            HStack {
                                ForEach(0 ..< itemAmount, id: \.self){_ in//要加id.self
                                    Image("hp")
                                        .resizable()
                                    //.scaledToFit()
                                        .frame(width: 50, height: 50)
                                        .foregroundColor(.red)
                                        .offset(x: CGFloat.random(in: -50...50), y: CGFloat.random(in: -50...50))
                                }
                                
                                
                            }
                            ForEach(0 ..< itemAmount, id: \.self){_ in//要加id.self
                                Text(emojinow)
                                    .font(.system(size: 40))

                                    .offset(x: CGFloat.random(in: -100...100), y: CGFloat.random(in: -100...100))
                            }
                        }
                        else if mode == "隨機加入"{
                            HStack {
                                ForEach(0 ..< itemAmount, id: \.self){_ in//要加id.self
                                    
                                    Image("hp")
                                        .resizable()
                                    //.scaledToFit()
                                        .frame(width: 50, height: 50)
                                        .foregroundColor(.red)
                                        .offset(x: CGFloat.random(in: -50...50), y: CGFloat.random(in: -50...50))
                                }
                                
                                
                            }
                            ForEach(0 ..< itemAmount, id: \.self){_ in//要加id.self
                                Text(emojinow)
                                    .font(.system(size: 40))

                                    .offset(x: CGFloat.random(in: -100...100), y: CGFloat.random(in: -100...100))
                            }
                        }
                        Text(caption)
                            .font(.system(size: 40))
                            .foregroundStyle(Color.white)
                            .offset(x:CGFloat(captionx), y:CGFloat(captiony))
                            
                    }
                    
                    
                    
                }.frame(width: 380, height: 380)
                Spacer()
                Text("表情符號: ")
                HStack {
                    Picker("選擇表情",selection: $emojinow) {
                        Text(emojiList[0]).tag(emojiList[0])
                        Text(emojiList[5]).tag(emojiList[5])
                        Text(emojiList[6]).tag(emojiList[6])
                        Text(emojiList[8]).tag(emojiList[8])
                    }.pickerStyle(SegmentedPickerStyle())
                    Picker("選擇表情", selection: $emojinow) {
                        ForEach(emojiList.indices, id: \.self) { index in
                            Text(emojiList[index]).tag(emojiList[index])
                        }
                    }
                    
                }
                Text("表情符號位置")
                HStack{
                    
                    Button {
                        mode = "右下角"
                    } label: {
                        Text("右下角")
                    }.buttonStyle(.borderedProminent)
                    Button {
                        mode = "環繞"
                    } label: {
                        
                        Text("環繞")
                    }.buttonStyle(.borderedProminent)
                    Button {
                        mode = "隨機環繞"
                    } label: {
                        
                        Text("隨機環繞")
                    }.buttonStyle(.borderedProminent)

                    Button {
                        mode = "隨機加入"
                    } label: {
                        
                        Text("隨機加入")
                    }.buttonStyle(.borderedProminent)

                }
                HStack{
                    
                    Button {
                        if photoIsSet && captionx < 190{
                            captionx += 10
                        }
                    } label: {
                        Text("🫸")
                    }.buttonStyle(.bordered)
                    Button {
                        if photoIsSet && captiony < 190{
                            captiony += 10
                        }
                    } label: {
                        
                        Text("👆")
                    }.buttonStyle(.bordered)
                    Button {
                        if photoIsSet && captiony > -190{
                            captiony -= 10
                        }
                    } label: {
                        
                        Text("👇")
                    }.buttonStyle(.bordered)

                    Button {
                        if photoIsSet && captionx > -190{
                            captionx -= 10
                        }
                        
                    } label: {
                        
                        Text("🫷")
                    }.buttonStyle(.bordered)

                }
                PhotosPicker(selection: $selectedPhoto) {
    //                Rectangle()
    //                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
                    Text("選擇照片上傳")
                }.onChange(of: selectedPhoto) { oldValue, newValue in
                    Task {
                        // Retrive selected asset in the form of Data
                        if let data = try? await newValue?.loadTransferable(type: Data.self) {
                            selectedImageData = data
                            photoIsSet = true
                        }
                    }
                }
                
    //            onChange(of: selectedPhoto) { newItem in
    //                Task {
    //                    // Retrive selected asset in the form of Data
    //                    if let data = try? await newItem?.loadTransferable(type: Data.self) {
    //                        selectedImageData = data
    //                    }
    //                }
    //            }
    //
                
            }
            
            .padding()
        }
        
        
        
        
    }
}


#Preview {
    ContentView()
}
/*
 struct ContentView: View {
 @State private var selectedPhoto: PhotosPickerItem?
 @State private var image: Image?
 
 var body: some View {
 NavigationStack {
 ZStack {
 image?
 .resizable()
 .scaledToFit()
 }
 .toolbar {
 PhotosPicker(selection: $selectedPhoto) {
 Image(systemName: "pencil")
 }
 }
 }
 }
 }
 */
