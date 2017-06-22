# RxTfL for Swift

Unofficial, auto-generated wrapper (observables) around Transport for London's unified API.  Depends on RxSwift & Alamofire.

## Regenerating

To regenerate, simply install Swagger Codegen & run this command

```
swagger-codegen generate -i https://api.tfl.gov.uk/swagger/docs/v1 -o . -l swift3 -t Template --additional-properties responseAs=RxSwift,projectName=RxTfL

swift package generate-xcodeproj
```
