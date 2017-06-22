import PackageDescription

let package = Package(
    name: "RxTfL",
    dependencies: [
        .Package(url: "https://github.com/alamofire/alamofire.git", majorVersion: 4),
        .Package(url: "https://github.com/ReactiveX/RxSwift.git", majorVersion: 3),
    ]
)
