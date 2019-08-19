//
//  SFSymbols.swift
//  Reddit-macOS
//
//  Created by Carson Katri on 8/16/19.
//  Copyright © 2019 Carson Katri. All rights reserved.
//

import SwiftUI

struct SFSymbol {
    static func named(_ name: String) -> AnyView {
        switch name {
        case "arrow.up":
            return AnyView(UpArrow())
        case "arrow.down":
            return AnyView(DownArrow())
        case "pin.fill":
            return AnyView(Pin())
        case "text.bubble":
            return AnyView(Bubble())
        case "clock":
            return AnyView(Clock())
        default:
            return AnyView(Text(""))
        }
    }
    
    struct UpArrow : View {
        var body: some View {
            ZStack {
                Rectangle()
                    .frame(width: 15, height: 15)
                    .foregroundColor(Color.primary.opacity(0.1))
                    .cornerRadius(4)
                Rectangle()
                    .frame(width: 1, height: 8)
                    .cornerRadius(0.5)
                Rectangle()
                    .frame(width: 1, height: 5)
                    .cornerRadius(0.5)
                    .offset(x: -3, y: -1)
                    .rotationEffect(Angle(degrees: 45))
                Rectangle()
                    .frame(width: 1, height: 5)
                    .cornerRadius(0.5)
                    .offset(x: 3, y: -1)
                    .rotationEffect(Angle(degrees: -45))
            }
        }
    }
    struct DownArrow : View {
        var body: some View {
            UpArrow()
                .rotationEffect(Angle(degrees: 180))
        }
    }
    
    struct Pin : View {
        var body: some View {
            ZStack {
                Path { path in
                    path.move(to: CGPoint(x: 4, y: 0))
                    path.addLine(to: CGPoint(x: 8, y: 0))
                    path.addLine(to: CGPoint(x: 6, y: 2))
                    path.addLine(to: CGPoint(x: 5.5, y: 4))
                    path.addLine(to: CGPoint(x: 7, y: 6))
                    path.addLine(to: CGPoint(x: 4.5, y: 6))
                    path.addLine(to: CGPoint(x: 4.5, y: 10))
                    path.addLine(to: CGPoint(x: 3.5, y: 10))
                    path.addLine(to: CGPoint(x: 3.5, y: 6))
                    path.addLine(to: CGPoint(x: 1, y: 6))
                    path.addLine(to: CGPoint(x: 2.5, y: 4))
                    path.addLine(to: CGPoint(x: 2, y: 2))
                    path.addLine(to: CGPoint(x: 0, y: 0))
                }
            }
        }
    }
    
    struct Bubble : View {
        var body: some View {
            ZStack {
                Rectangle()
                    .frame(width: 8, height: 7)
                    .foregroundColor(Color.primary.opacity(0))
                    .border(Color.primary)
                    .cornerRadius(2)
                Rectangle()
                    .frame(width: 1, height: 2)
                    .offset(x: -2, y: 4)
            }
        }
    }
    
    struct Clock : View {
        var body: some View {
            ZStack {
                Rectangle()
                    .frame(width: 10, height: 10)
                    .foregroundColor(Color.primary.opacity(0))
                    .border(Color.primary)
                    .cornerRadius(3)
                Rectangle()
                    .frame(width: 1, height: 5)
                    .offset(y: -2.5)
                Rectangle()
                    .frame(width: 1, height: 5)
                    .offset(y: -2.5)
                    .rotationEffect(Angle(degrees: 90))
            }
        }
    }
}

#if DEBUG
struct SFSymbols_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SFSymbol.UpArrow()
                .frame(width: 10, height: 10)
            SFSymbol.DownArrow()
                .frame(width: 10, height: 10)
            SFSymbol.Pin()
                .frame(width: 10, height: 10)
            SFSymbol.Bubble()
                .frame(width: 10, height: 10)
            SFSymbol.Clock()
                .frame(width: 10, height: 10)
        }
    }
}
#endif
