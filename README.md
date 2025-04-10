**Getting Started**

A simple and modern iOS shopping app built with SwiftUI that fetches and displays products from [FakeStoreAPI](https://fakestoreapi.com/). Includes cart functionality, product details, and a polished UI with tab navigation.


### Clone the Repository
ssh: git@github.com:santhoshpamukuntla/SampleAPP.git

https_link: https://github.com/santhoshpamukuntla/SampleAPP.git

**Open in Xcode**

Open the ModernStoreUI.xcodeproj file in Xcode.
 
Make sure your build target is set to an iOS device or simulator running iOS 15+.

**Run the App**
Click the Run button (or Cmd + R) in Xcode to launch the app in the simulator.

**Implementation Notes:**

1. SwiftUI & MVVM: The app is built using the MVVM pattern with @StateObject and @ObservedObject for reactive UI updates. 

2. Networking: Simple URLSession used for fetching data. 

3. State Management: @Published properties in StoreViewModel trigger UI updates (e.g., cart count). 

4. Images: Loaded asynchronously using AsyncImage. 

5. Mock API: The app uses https://fakestoreapi.com/products for demonstration purposes. 
