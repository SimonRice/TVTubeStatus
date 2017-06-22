# https://github.com/jcampbell05/xcake
# http://www.rubydoc.info/github/jcampbell05/xcake/master/file/docs/Cakefile.md

iOSdeploymentTarget = "9.0"
currentSwiftVersion = "3.0.1" # to set "Use Legacy Swift ..." to "No"
companyIdentifier = "com.simonrice"

#===

project.name = "RxTfL"
project.organization = "Simon Rice"

#=== DEFAULT target settings

project.all_configurations.each do |configuration|

    # for all configurations
    configuration.settings["DEBUG_INFORMATION_FORMAT"] = "dwarf"
    configuration.settings["CODE_SIGN_IDENTITY[sdk=iphoneos*]"] = "iPhone Developer"
    configuration.settings["TARGETED_DEVICE_FAMILY"] = "1,2,3,4"
    configuration.settings["IPHONEOS_DEPLOYMENT_TARGET"] = iOSdeploymentTarget
    configuration.settings["VERSIONING_SYSTEM"] = "apple-generic"

    configuration.settings["GCC_NO_COMMON_BLOCKS"] = "YES"
    configuration.settings["GCC_WARN_ABOUT_RETURN_TYPE"] = "YES_ERROR"
    configuration.settings["GCC_WARN_UNINITIALIZED_AUTOS"] = "YES_AGGRESSIVE"
    configuration.settings["CLANG_WARN_DIRECT_OBJC_ISA_USAGE"] = "YES_ERROR"
    configuration.settings["CLANG_WARN_OBJC_ROOT_CLASS"] = "YES_ERROR"

    configuration.settings["SWIFT_OPTIMIZATION_LEVEL"] = "-Onone"

    configuration.settings["CURRENT_PROJECT_VERSION"] = "1" # just default non-empty value

    configuration.settings["CLANG_WARN_INFINITE_RECURSION"] = "YES" # Xcode 8
    configuration.settings["CLANG_WARN_SUSPICIOUS_MOVE"] = "YES" # Xcode 8
    configuration.settings["ENABLE_STRICT_OBJC_MSGSEND"] = "YES" # Xcode 8
    configuration.settings["SUPPORTED_PLATFORMS"] = "macosx iphoneos iphonesimulator appletvos appletvsimulator watchos watchsimulator"

    configuration.settings["FRAMEWORK_SEARCH_PATHS[sdk=appletvos*]"] = "$(SRCROOT)/Carthage/Build/tvOS";
    configuration.settings["FRAMEWORK_SEARCH_PATHS[sdk=appletvsimulator*]"] = "$(SRCROOT)/Carthage/Build/tvOS";
    configuration.settings["FRAMEWORK_SEARCH_PATHS[sdk=iphoneos*]"] = "$(SRCROOT)/Carthage/Build/iOS";
    configuration.settings["FRAMEWORK_SEARCH_PATHS[sdk=iphonesimulator*]"] = "$(SRCROOT)/Carthage/Build/iOS";
    configuration.settings["FRAMEWORK_SEARCH_PATHS[sdk=macosx*]"] = "$(SRCROOT)/Carthage/Build/Mac";
    configuration.settings["FRAMEWORK_SEARCH_PATHS[sdk=watchos*]"] = "$(SRCROOT)/Carthage/Build/watchOS";
    configuration.settings["FRAMEWORK_SEARCH_PATHS[sdk=watchsimulator*]"] = "$(SRCROOT)/Carthage/Build/watchOS";
    configuration.settings["SDKROOT"] = ""

    #===

    if configuration.name == "Release"

        configuration.settings["DEBUG_INFORMATION_FORMAT"] = "dwarf-with-dsym"
        configuration.settings["SWIFT_OPTIMIZATION_LEVEL"] = "-Owholemodule" # Xcode 8

    end

end

#===

# Imagine we have project folder structure like this:
    #
    # - Cakefile
    # - Info/
    # | - CakeFamework.plist
    # | - CakeFameworkTst.plist
    # - Src/
    # | - ...
    # - Tst/
    # | - ...
    #

#=== TARGETS

target do |target|
    target.name = project.name
    target.type = :framework
    target.language = :swift
    target.platform = :ios
    target.deployment_target = iOSdeploymentTarget
    target.system_frameworks = []

    #=== CUSTOM settings for the target

    target.all_configurations.each do |configuration|

        #=== Build Settings - Core

        configuration.product_bundle_identifier = companyIdentifier + "." + target.name
        configuration.settings["INFOPLIST_FILE"] = "Info/" + target.name + ".plist"
        configuration.settings["PRODUCT_NAME"] = "$(TARGET_NAME)"
        configuration.settings["SWIFT_VERSION"] = currentSwiftVersion # Xcode 8
        configuration.settings["TARGETED_DEVICE_FAMILY"] = "1,2,3,4"
        configuration.settings["SDKROOT"] = ""

    end

    #=== Source Files

    target.include_files = ["RxtfL/Classes/**/*.*"]
end
