cask :v1 => 'sublime-text-dev' do
  version '3073'
  sha256 'eb9a136eefc0d820f3c0400ede2b71f6a19a339c72b771d57bbb59593a6f179e'

  # rackcdn.com is the official download host per the vendor homepage
  url "http://c758482.r82.cf2.rackcdn.com/Sublime%20Text%20Build%20#{version}.dmg"
  appcast 'http://www.sublimetext.com/updates/3/dev/appcast_osx.xml',
          :sha256 => '13d474c1ab90f6b9d78277d05b4593dffd6b4b822742004aebf80dc15ecccbe5'
  name 'Sublime Text'
  homepage 'http://www.sublimetext.com/3dev'
  license :closed

  app 'Sublime Text.app'
  binary 'Sublime Text.app/Contents/SharedSupport/bin/subl'

  uninstall :quit => 'com.sublimetext.3'

  zap :delete => [
                  '~/Library/Application Support/Sublime Text 3',
                  '~/Library/Caches/com.sublimetext.3',
                  '~/Library/Preferences/com.sublimetext.3.plist',
                  '~/Library/Saved Application State/com.sublimetext.3.savedState'
                 ]

  conflicts_with :cask => 'caskroom/versions/sublime-text3'

  caveats do
    files_in_usr_local
  end
end
