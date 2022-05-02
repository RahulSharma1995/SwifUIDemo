//
//  ListRawView.swift
//  SwifUIDemo
//
//  Created by Rahul Sharma on 01/05/22.
//

import SwiftUI

struct ListRawView: View {
    let item: ItemModel
    var body: some View {
        HStack {
            Image(systemName: item.isComplited ? "checkmark.circle" : "circle")
                .foregroundColor(item.isComplited ? .green : .red)
            Text(item.title)
            Spacer()
        }
        .font(.title2)
        .padding(.vertical, 8)
    }
}

struct ListRawView_Previews: PreviewProvider {
    static let item1 = ItemModel(title: "This is First Item !", isComplited: false)
    static let item2 = ItemModel(title: "This is secound !!!", isComplited: true)
    static var previews: some View {
        Group {
            ListRawView(item: item1)
            ListRawView(item: item2)
        }
        .previewLayout(.sizeThatFits)
    }
}
