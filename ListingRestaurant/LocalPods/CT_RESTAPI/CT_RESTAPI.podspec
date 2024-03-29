Pod::Spec.new do |spec|
  spec.name         = 'CT_RESTAPI'
  spec.version      = '1.0.0'
  spec.license      = { :type => 'BSD' }  
  spec.authors      = { 'Canh Tran' => 'hoangcanhsek6@gmail.com' }
  spec.platform     = :ios, "9.0"
  spec.ios.deployment_target = "9.0"
  spec.summary      = 'Common files'  
  spec.source_files = '**/*.{swift}'
  spec.homepage     = 'bitbucket.org/hoangcanhsek6'
  spec.source       = { :path => 'LocalPods/CT_RESTAPI' }

  spec.requires_arc = true
  spec.pod_target_xcconfig = { 'OTHER_LDFLAGS' => '-lObjC' }
   
  spec.dependency 'RxSwift'
  spec.dependency 'Alamofire'
  spec.dependency 'CocoaLumberjack/Swift'
  
end
