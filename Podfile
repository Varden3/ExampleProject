# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'
platform :ios, '10.0'

def rx_swift
    pod 'RxSwift'
end

def rx_cocoa
    pod 'RxCocoa'
end

target 'ExampleProject' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!
  pod 'Alamofire'
  pod 'RxAlamofire'
  rx_cocoa
  rx_swift
  # Pods for ExampleProject

  target 'ExampleProjectTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'ExampleProjectUITests' do
    # Pods for testing
  end

end
