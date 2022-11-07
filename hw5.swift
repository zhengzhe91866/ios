import SwiftUI

var myText = ["2012/01/12", "2019/08/31",  "2015/05/20",
              "2017/03/09", "2013/11/13", "2016/05/26",
              "2017/11/15", "2016/07/13", "2022/08/20", "2019/12/22"]

struct TitleView: View{
    var body: some View{
        VStack(alignment: .center, spacing: 2){
            Text("音樂遊戲")
                .font(.system(size:30))
            Text("收藏清單")
                .font(.title)
                .foregroundColor(Color(red: 29/255, green: 40/255, blue: 192/255))
        }
    }
}

struct GameView: View{
    var imageName:String
    var numGame:Int
    
    var body: some View{
        ZStack{
            VStack{
                Image(imageName)
                    .resizable()
                    .aspectRatio(contentMode:.fit)
                    .cornerRadius(20)
                    .frame(height: 80, alignment: .top)
                    .overlay(
                        Text(myText[numGame])
                            .font(.system(size: 10))
                            .background(Color.gray)
                            .opacity(0.7)
                            .offset(x:0, y:30)
                    )
                
                Text(imageName.capitalized)
                    .fontWeight(.bold)
                    .font(.system(size: 25))
                    .scaledToFit()
                    .minimumScaleFactor(0.4)
                    .lineLimit(1)
            }
        }
    }
}

struct ContentView: View {
    
    var body: some View {
        VStack {
            TitleView()
            
            VStack{
                Text("判定線式")
                    .font(.system(size: 25))
                    .fontWeight(.bold)
                    .background()
                    .frame(width: 300, height: 50, alignment: .bottom)
                HStack{
                    GameView(imageName: "Cytus", numGame:0)
                    GameView(imageName: "Phigros", numGame:1)
                    GameView(imageName: "Dynamix", numGame:2)
                }
            }
            VStack{
                Text("下落式")
                    .font(.system(size: 25))
                    .fontWeight(.bold)
                    .background()
                    .frame(width: 300, height: 50, alignment: .bottom)
                HStack{
                    GameView(imageName: "Arcaea", numGame:3)
                    GameView(imageName: "Deemo", numGame:4)
                    GameView(imageName: "Voez", numGame:5)
                }
            }
            
            VStack{
                Text("形式自由")
                    .font(.system(size: 25))
                    .fontWeight(.bold)
                    .background()
                    .frame(width: 300, height: 50, alignment: .bottom)
                HStack{
                    GameView(imageName: "Lyrica", numGame:6)
                    GameView(imageName: "Lanota", numGame:7)
                    GameView(imageName: "Hexa hysteria", numGame:8)
                    GameView(imageName: "Ravon", numGame:9)
                }
            }
        }
    }
}
