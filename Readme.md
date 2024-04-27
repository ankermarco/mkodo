Much appreciated for spending your time reading my code. I'll be so grateful for any feedbacks.

# Tasks completed

## Essential Tasks
1. Parse JSON Data
2. Display Lottery Draws
3. Unit and Integration testing

## Additional Tasks
1. Detail View fro Each Draw
2. Add basic Navigation
3. Additional Tests
4. Interactive Navigation
5. Local storage
6. UI/UX Enhancements

# Architecture

1. I have modularised the entire application using 4 frameworks
2. Following Uncle Bob's clean architecture, and SOLID principles, I have sliced the entire project into different layers. I use protocol to describe the dependencies between layers. I inject protocols as dependencies by following Dependency inversion principle. I create compositional layers by following Single Responsibility principle, and open-close principle.
`MKLotterySwiftUI` is the UI layer, it contains all views and their view models. Views are buit using SwiftUI.
`MKLotteryCore` contains the definitions of application models, which are the models are using by the application. I also using protocol to define the modular dependencies for the UI layer and its dependencies, such as Networking and Caching layer. 
`MKNetworking` contains all the code for managing network request, e.g. Restful request with backend services.
`MKStorage` contains all the code for managing caches. Including caching policies, caching strategies, and different caching techniques - Core Data, Swift Data, file etc.

3. The benefits of the clean architecture clearly define the dependencies, separations of concerns, so the entire code base becomes easier to maintain, easier to understand and extend.

I use this opportunity to demo a small set of my understandings of clean architecture and testing. Doesn't mean that I will or only could use this architecture. Of course in real life, I will choose the most appropriate architecture to fit the purpose.



