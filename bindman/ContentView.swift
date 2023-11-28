//
//  ContentView.swift
//  bindman
//
//  Created by test on 2023/11/14.
//

import SwiftUI
import PhotosUI
struct emojiDisplay{
    var emoji: String
    var emojix: CGFloat
    var emojiy: CGFloat
}
var emojiList = [
    "😀", "❤️", "😄", "😁", "😆", "😅", "🤣", "😂", "🙂", "🙃",
    "😉", "😊", "😇", "🥰", "😍", "🤩", "😘", "😗", "😙", "😚",
    "😋", "😛", "😝", "😜", "🤪", "🤨", "🧐", "🤓", "😎", "🥸",
    "🤠", "🤡", "🥳", "🥴", "😵", "🤯", "🤢", "🤮", "🤧", "😷",
    "🤒", "🤕", "🥵", "🥶", "😴", "💤", "🥱", "😴", "🤤", "🥴",
    "😵", "🤯", "🤢", "🤮", "🤧", "😷", "🤒", "🤕", "🥵", "🥶"
  ];

struct ContentView: View {
    @State private var displayList = [emojiDisplay]()
    @State private var selectedPhoto: PhotosPickerItem?
    @State private var mode = ""
    @State private var selectedImageData: Data?
    @State private var itemAmount = 0
    @State private var emojinow = "😀"
    @State private var photoIsSet = false
    @State private var showcCaption = false
    @State private var caption = "輸入文字"
    @State private var captionx = 0
    @State private var captiony = 100
    @State private var showingAlert = false
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
//                            .onAppear(perform: {
//                                itemAmount = 6
//                                for _ in 0..<10{
//                                    displayList.append(emojiList.randomElement()!)
//                                }
//                                //
//                                print(displayList)
//                            })
                    }
                    else{
                        Text("請在下方點選選擇照片上傳")
                            .background()
                    }
                    if photoIsSet == true {
                        if mode == "右下角"{
                            Text(emojinow)
                                .font(.system(size: 40))

                                .offset(x: 155, y: 100)
                        }
                        else if mode == "環繞"{
                            ZStack {
//                                ForEach(0 ..< itemAmount, id: \.self){i in//要加id.self
//                                    Image("hp")
//                                        .resizable()
//                                    //.scaledToFit()
//                                        .frame(width: 50, height: 50)
//                                        .foregroundColor(.red)
//                                        .offset(x: CGFloat(-165 + 65 * i), y: CGFloat(-100))
//                                }
//
                                
                                ForEach(0 ..< 6, id: \.self){i in//要加id.self
                                    
                                    Text(emojinow)
                                        .font(.system(size: 35))

                                        .offset(x: CGFloat(-165 + 65 * i), y: CGFloat(-100))
                                    
                                }
                                ForEach(0 ..< 6, id: \.self){i in//要加id.self
                                    
                                    Text(emojinow)
                                        .font(.system(size: 35))

                                        .offset(x: CGFloat(-165 + 65 * i), y: CGFloat(100))
                                    
                                }
                                ForEach(0 ..< 2, id: \.self){i in//要加id.self
                                    
                                    Text(emojinow)
                                        .font(.system(size: 35))

                                        .offset(x: CGFloat(-165), y: CGFloat(-35 + 65*i))
                                    
                                }

                                ForEach(0 ..< 2, id: \.self){i in//要加id.self
                                    
                                    Text(emojinow)
                                        .font(.system(size: 35))

                                        .offset(x: CGFloat(-165 + 325), y: CGFloat(-35 + 65*i))
                                    
                                }
                            }

                        }
                        else if mode == "隨機環繞"{
                            ZStack {
//                                ForEach(0 ..< itemAmount, id: \.self){i in//要加id.self
//                                    Image("hp")
//                                        .resizable()
//                                    //.scaledToFit()
//                                        .frame(width: 50, height: 50)
//                                        .foregroundColor(.red)
//                                        .offset(x: CGFloat(-165 + 65 * i), y: CGFloat(-100))
//                                }
//
                                
//                                ForEach(0 ..< 6){i in//要加id.self
//                                    
//                                    Text(emojiList[i].emoji)
//                                        .font(.system(size: 35))
//
//                                        .offset(x: CGFloat(-165 + 65 * i), y: CGFloat(-100))
//                                    
//                                }
//                                ForEach(0 ..< 6){i in//要加id.self
//                                    
//                                    Text(emojiList[i].emoji)
//                                        .font(.system(size: 35))
//
//                                        .offset(x: CGFloat(-165 + 65 * i), y: CGFloat(100))
//                                    
//                                }
//                                ForEach(0 ..< 2){i in//要加id.self
//                                    
//                                    Text(emojiList[i].emoji)
//                                        .font(.system(size: 35))
//
//                                        .offset(x: CGFloat(-165), y: CGFloat(-35 + 65*i))
//                                    
//                                }
//
//                                ForEach(0 ..< 2){i in//要加id.self
//                                    
//                                    Text(emojiList[i].emoji)
//                                        .font(.system(size: 35))
//
//                                        .offset(x: CGFloat(-165 + 325), y: CGFloat(-35 + 65*i))
//                                    
//                                }
                            }

                        }
                        else if mode == "隨機加入"{
                            HStack {
//                                ForEach(0 ..< itemAmount, id: \.self){_ in//要加id.self
//                                    
//                                    Image("hp")
//                                        .resizable()
//                                    //.scaledToFit()
//                                        .frame(width: 50, height: 50)
//                                        .foregroundColor(.red)
//                                        .offset(x: CGFloat.random(in: -100...100), y: CGFloat.random(in: -100...100))
//                                }
                                
                                
                            }
                            ForEach(0 ..< 10, id: \.self){i in//要加id.self
                                Text(displayList[i].emoji)
                                    .font(.system(size: 40))

                                    .offset(x: displayList[i].emojix, y: displayList[i].emojiy)
                            }
                        }
                        if showcCaption{
                            Text(caption)
                                .font(.system(size: 35))
                                .foregroundStyle(Color.white)
                                
                                .offset(x:CGFloat(captionx), y:CGFloat(captiony))
                                .animation(.easeInOut(duration: 1), value: caption)
                                .animation(.easeInOut(duration: 2), value: captionx)
                                .animation(.easeInOut(duration: 2), value: captiony)
                        }
                        
                        
                            
                    }
                    
                    
                    
                }.frame(width: 380, height: 380)
                Spacer()
                //Text("輸入文字")
                HStack{
                    TextField("輸入文字", text: $caption)
                        .foregroundColor(.red)
                        .offset(x:CGFloat(50))
                        .overlay(
                            RoundedRectangle(cornerRadius: 40)
                                .stroke(Color.white, lineWidth:2)
                        )
                    Toggle("顯示文字", isOn: $showcCaption)
                }
                
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
                Text("表情符號位置: ")
                HStack{
                    
                    Button {
                        if photoIsSet{
                            mode = "右下角"
                        }
                        else{
                            showingAlert = true
                        }
                    } label: {
                        Text("右下角")
                    }.buttonStyle(.borderedProminent)
                    Button {
                        if photoIsSet{
                            mode = "環繞"
                        }
                        else{
                            showingAlert = true
                        }
                        
                    } label: {
                        
                        Text("環繞")
                    }.buttonStyle(.borderedProminent)
                    Button {
                        if photoIsSet{
                            for i in 0..<16{
                                displayList[i].emoji = emojiList.randomElement()!
                                displayList[i].emojix = CGFloat.random(in: -170...170)
                                displayList[i].emojiy = CGFloat.random(in: -100...100)
                            }
                            mode = "隨機環繞"
                        }
                        else{
                            showingAlert = true
                        }
                        
                    } label: {
                        
                        Text("隨機環繞")
                    }.buttonStyle(.borderedProminent)

                    Button {
                        
                        if photoIsSet{
                            for i in 0..<16{
                                displayList[i].emoji = emojiList.randomElement()!
                                displayList[i].emojix = CGFloat.random(in: -170...170)
                                displayList[i].emojiy = CGFloat.random(in: -100...100)
                            }
                            mode = "隨機加入"
                        }
                        else{
                            showingAlert = true
                        }
                        
                    } label: {
                        
                        Text("隨機加入")
                    }.buttonStyle(.borderedProminent)

                }.onAppear(perform: {
                    itemAmount = 6
                    for _ in 0..<16{
                        displayList.append(emojiDisplay(emoji: emojiList.randomElement()!, emojix: CGFloat.random(in: -170...170), emojiy: CGFloat.random(in: -100...100)))
                            
                    }
                    //
                    
                    
                })

                HStack{
                    
                    Button {
                        if  captionx < 190{
                            captionx += 10
                        }
                        if !photoIsSet{
                            showingAlert = true
                        }
                    } label: {
                        Text("🫸")
                    }.buttonStyle(.bordered)
                    Button {
                        if  captiony > -150{
                            captiony -= 10
                        }
                        if !photoIsSet{
                            showingAlert = true
                        }
                    } label: {
                        
                        Text("👆")
                    }.buttonStyle(.bordered)
                    Button {
                        if captiony < 150{
                            captiony += 10
                        }
                        if !photoIsSet{
                            showingAlert = true
                        }
                    } label: {
                        
                        Text("👇")
                    }.buttonStyle(.bordered)

                    Button {
                        if  captionx > -190{
                            captionx -= 10
                        }
                        if !photoIsSet{
                            showingAlert = true
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
        }.alert(isPresented: $showingAlert) { // 3
            Alert( // 4
                title: Text("沒有照片"),
                message: Text("請在下方點選選擇照片上傳"),
                dismissButton: .cancel()
            )
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
