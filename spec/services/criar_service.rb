require 'appium_lib_core'

module Android
  opts = {
    capabilities: { # Append capabilities
      platformName: 'android',
      deviceName: 'Nexus6_API30',
      app: "C:\\GitHub\\KotlinAppium\\src\\main\\resources\\alura_esporte.apk",  # Without 'app' capability, an appium session starts with the home screen
      automationName: 'uiautomator2',
      deviceUDID: "emulator-5554",
      autoGrantPermissions: true,
      autoAcceptAlerts: true
    },
    appium_lib: {
      wait: 30
    }
  }

  include Appium::Core.for(opts)
end
