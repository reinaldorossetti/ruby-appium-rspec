require 'rubygems'
require 'em/pure_ruby'
require 'appium_lib_core'

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
@core = Appium::Core.for(opts) # create a core driver with `opts`
@driver = @core.start_driver

# Launch iPhone Simulator and `MyiOS.app`
@driver.find_element(:id, "br.com.alura.aluraesporte:id/login_botao_cadastrar_usuario").click
@driver.find_element(:id, "br.com.alura.aluraesporte:id/input_nome").send_keys("gabriel")
@driver.find_element(:id, "br.com.alura.aluraesporte:id/input_senha").send_keys("123Mud@r")
@driver.find_element(:id, "br.com.alura.aluraesporte:id/input_confirmar_senha").send_keys("123Mud@r")
@driver.find_element(:id, "br.com.alura.aluraesporte:id/cadastro_usuario_botao_cadastrar").click


sleep 1000
