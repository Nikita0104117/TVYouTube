# TV Test App
This test application was first of all developed, taking into account the future expansion of its functionality. The most scalable application modules were laid, as well as things that may be needed in the future also I used code generation based on my templates (DI, Modules, Services, ...), some methods may be described but not yet used, but they will likely be used in the future.

The application provides two schemes Rest and Mock. 

Mock scheme is built on static data, simulating API requests.
Rest scheme is designed to work with rest API, but I could not find a suitable one for implementation in the application.

For better user experiance please to use Mock scheme to run.
 
In the project, you will find:
- Separation of schemes Mock and Prod
- Code generation with SwiftGen (Assets, Colors, Locale)
- Basic design system
- Alamofire session manager with logger and token manager
- Code Style rules with SwiftLint
- Storage Managers(UserDefaults, Keychain)
- VIPER Module architecture
- D.I. Container
- CI/CD with Xcode cloud 
and other features
