/*
See LICENSE folder for this sample’s licensing information.

Abstract:
A view showing a list of landmarks.
*/

import SwiftUI

struct LandmarkList: View {
    @EnvironmentObject var userData:UserData
   // @State var Isfavour:Bool = false
    var body: some View {
        NavigationView {
            List{
                Toggle(isOn: self.$userData.IsFavour){ // binding whit ?? @state! add a Toggle to view  clouser <= what to do/show for this toggle
                    Text("Filter")
                }
                
                //if haveing static or dynamic view using ForEach for shwoing the row
                //else we can using List(data,id:..){ to instead the forEach list haveing lot of style??
                ForEach(self.userData.Landmark) { landmark in
                    if !self.userData.IsFavour || landmark.isFavorite { //if false != => always true.
                        
                        NavigationLink(destination: LandmarkDetail(landmark: landmark)) {
                             LandmarkRow(landmark: landmark)
                         }
                        .navigationBarTitle(Text("Landmarks"),displayMode: .inline)
                    }
                }
            }
            
            // 2 type of list using list or ForEach (for loop?)

        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone SE", "iPhone XS Max"], id: \.self) { deviceName in
            LandmarkList()
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }.environmentObject(UserData())
    }
}
