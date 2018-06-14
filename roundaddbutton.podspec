

Pod::Spec.new do |s|
          #1.
          s.name               = "RoundAddButton"
          #2.
          s.version            = "1.0.1"
          #3.  
          s.summary         = "Use Round Add Button into your project having different colors"
          #4.
          s.homepage        = "http://www.github.com/baquer/RoundAddButton"
          #5.
          s.license              = "MIT"
          #6.
          s.author               = "baquer"
          #7.
          s.platform            = :ios, "10.0"
          #8.
          s.source              = { :git => "https://github.com/baquer/RoundAddButton.git", :tag => "1.0.0" }
          #9.
          s.source_files     = "RoundAddButton", "RoundAddButton/**/*.{h,m,swift}"
    end
