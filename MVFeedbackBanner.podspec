Pod::Spec.new do |s|
  s.name         = 'MVFeedbackBanner'
  s.version      = '0.1.0'
  s.summary      = 'Ask the user to rate your app or give feedback with a simple customisable banner'
  s.license      = 'MIT'
  s.homepage     = 'https://github.com/bizz84/MVFeedbackBanner'
  s.author       = { 'Andrea Bizzotto' => 'bizz84@gmail.com' }
  s.ios.deployment_target = '9.0'

  s.source       = { :git => "https://github.com/bizz84/MVFeedbackBanner.git", :tag => s.version }

  s.source_files = 'Sources/*.{swift,xib,strings}'

  s.screenshots  = ["https://github.com/bizz84/MVFeedbackBanner/raw/master/screenshots/feedback-flow.png"]

  s.requires_arc = true
end
