# Planetz App

<table>
<td width="25%">
<img src="Screenshots/iphone.png"></img>
</td>
<td width="50%">
<img src="Screenshots/ipad.png"></img>
</td>
<td width="20%">
<img src="Screenshots/record.gif"></img>
</td>
</tr>
<table>

- Tech Used - Swift | UIKit | XCTestCase | Programatic AutoLayout
- The app displays list of Planets data from `https://swapi.dev/api/planets`. 
- Added project level and target level xcconfigs.
- `Testcoverage - 89.1%`
- Used persistance UserDefault to store the data for offline support.
- Architecture used is MVC. No third party libraries are used in the app.
- Used Dependency injection for decoupling, testability, reusability etc.
- Used progrmatic UI with UIKit and AutoLayout for constructing and configuring the views.
- To run unit tests, open Xcode and select `Product > Test`
- Basic project stucture
    
    - AppAsset
    - Main
    - Source
        - Features
            - Feature1
                - ViewModel 
                - Models
                - Views
                - Controllers
        - Networking
            - Adapters
        - Components
        - Utils
        - DataStore
        - Resources 

# To Run The Planetz App
Clone this repo
```bash
git clone git@github.com:bibin-jaimon/Planetz.git
cd Planetz
xed Planetz
```

Make sure you are in `development` brach to run the app with latest changes.

# Future features and improvements
- Autoloading more data when reach end of list.
- Add more screens like planet details, people list & details, etc.
- Pagination for showing more data.
- Loading state improvements. Eg: Skelton View
- Improve the loacal store from UserDefault to CoreData
- Splitscreen for iPad flow.


Open `Planetz.xcodeproj/` and select `Planetz` scheme to run the app.

---
Contact: bibinjaimon@gmail.com
