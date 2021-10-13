//
//  FilterFighters.swift
//  SmashFighters
//
//  Created by Allan Melo on 13/10/21.
//

import SwiftUI

struct FilterFighters: View {
    @Environment(\.dismiss) var dismiss
    
    var header: some View {
        VStack {
            HStack(spacing: 0) {
                Button("Close") {
                    dismiss()
                }
                .font(.custom("Helvetica-Regular", size: 17))
                .foregroundColor(Color(hex: 0x212121))
                .frame(width: 52, height: 20)
                .buttonStyle(.plain)
                .padding(.leading, 8)
                Spacer()
                Text("Filters")
                    .font(.custom("HelveticaNeue-Regular", size: 24))
                    .padding(.trailing, 60)
                Spacer()
            }
            .padding([.bottom, .top], 22)
            Divider()
        }
    }
    
    @ObservedObject var slider = CustomSlider(start: 1, end: 1000)
    
    var sortView: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("Sort By")
                .font(.custom("HelveticaNeue-Bold", size: 15))
                .padding(.leading, 22)
                .padding(.bottom, 28)
            
            RadioButtonGroup(items: sortOptions, selectedId: selectedSortOption) { selected in
                print("Selected is: \(selected)")
            }
            .padding(.leading, 53)
            .padding(.trailing, 38)
            .padding(.bottom, 24)
            Divider()
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    var price: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("Price")
                .font(.custom("HelveticaNeue-Bold", size: 15))
                .padding(.leading, 22)
                .padding(.bottom, 28)
            
            VStack {
                HStack {
                    Text(formatPrice(slider.lowHandle.currentValue))
                    Spacer()
                    Text(formatPrice(slider.highHandle.currentValue))
                }
                .padding(.bottom, 18)
                
                SliderView(slider: slider)
                
                    .frame(maxWidth: .infinity, alignment: .center)
            }
            .padding(.leading, 43)
            .padding(.trailing, 25)
            .padding(.bottom, 39)
            
            
            Divider()
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    func formatPrice(_ value: Double) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.decimalSeparator = ","
        formatter.groupingSeparator = "."
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        
        let number = NSNumber(value: value)
        return "$" + (formatter.string(from: number) ?? "")
    }
    
    var starsView: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("Sort By")
                .font(.custom("HelveticaNeue-Bold", size: 15))
                .padding(.leading, 22)
                .padding(.bottom, 28)
            
            StarsView(stars: 4, selectedColor: Color(hex: 0xFFCD00), unselectedColor: Color(hex: 0xB6B6B6), size: .large)
                .frame(maxWidth: .infinity, alignment: .center)
                .padding(.bottom, 27)
            Divider()
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    let sortOptions = ["Ascending", "Descending", "Rate", "Downloads"]
    @State var selectedSortOption: String = "Ascending"
    
    var body: some View {
        VStack {
            header
            sortView
            price
            starsView
            Spacer()
            
            Button(action: {
            
            }) {
                Text("Apply Filters")
                    .font(.custom("HelveticaNeue-Regular", size: 15))
                    .multilineTextAlignment(.center)
                    .frame(height: 39)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .foregroundColor(Color.white)
                    .background(Color.branding)
                    .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
            }
            .frame(maxWidth: .infinity, alignment: .center)
            .padding([.leading, .trailing], 35)
            .padding(.bottom, 73)
            
        }
    }
}

struct FilterFighters_Previews: PreviewProvider {
    static var previews: some View {
        FilterFighters()
    }
}
