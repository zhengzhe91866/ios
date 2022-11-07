import SwiftUI

struct ContentView: View {
    @State var player1:String = "?"
    @State var player1Msg:String = ""
    @State var player2:String = "?"
    @State var player2Msg:String = ""
    @State var c1:Color = Color.white
    @State var c2:Color = Color.white
    
    func jyanken(_ p: inout String, _ i: inout Int){
        i = Int.random(in: 0 ... 2)
        if (i == 0){
            p = "石頭"
        } else if (i == 1) {
            p = "剪刀"
        }
        else {
            p = "布"
        }
    }
    
    func winner(_ p1: Int, _ p2: Int, _ outMsg: inout String, _ color: inout Color){
        if(p1 == p2){
            outMsg = "Tie"
        }
        else if(p1 == 0){
            if(p2 == 1){
                outMsg = "Win"
            }
            else{
                outMsg = "Lose"
            }
        }
        else if(p1 == 1){
            if(p2 == 2){
                outMsg = "Win"
            }
            else{
                outMsg = "Lose"
            }
        }
        else{
            if(p2 == 0){
                outMsg = "Win"
            }
            else{
                outMsg = "Lose"
            }
        }
        
        if(outMsg == "Win"){
            color = Color.red
        } else if (outMsg == "Lose") {
            color = Color.blue
        } else {
            color = Color.gray
        }
    }
    
    var body: some View {
        Text(player1Msg)
            .padding(.all, 10)
            .frame(width: 250, height: 120, alignment: .center)
            .font(.system(size:50))
            .rotationEffect(.degrees(180))
            .foregroundColor(c1)
        
        Text(player1)
            .padding(.all, 10)
            .frame(width: 250, height: 120, alignment: .center)
            .font(.system(size:100))
            .rotationEffect(.degrees(180))
        
        Button(action:{
            var i1:Int = 0
            var i2:Int = 0
            jyanken(&player1, &i1)
            jyanken(&player2, &i2)
            winner(i1, i2, &player1Msg, &c1)
            winner(i2, i1, &player2Msg, &c2)
        }, label:{
            Text("Go")
                .fontWeight(.bold)
                .font(.system(size:50))
                .frame(width: 150, height: 50, alignment: .center)
                .padding()
                .background(Color.green)
                .cornerRadius(40)
                .foregroundColor(.yellow)
                .padding(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 60)
                        .stroke(Color.green, lineWidth: 5)
                )
        })
        
        Text(player2)
            .padding(.all, 10)
            .frame(width: 250, height: 120, alignment: .center)
            .font(.system(size:100))
        
        Text(player2Msg)
            .padding(.all, 10)
            .frame(width: 250, height: 120, alignment: .center)
            .font(.system(size:50))
            .foregroundColor(c2)
    }
}
