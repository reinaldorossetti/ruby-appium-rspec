class RegisterUser
  language_yaml = YAML.load_file($LOCATOR_DIR + "/resgister_user_locator.yml")
  @@page = OpenStruct.new(language_yaml)

  def cadastrar_usuario
    $driver.find_element(:id, @@page.btn_cadastrar_usuario).click
    $driver.find_element(:id, "br.com.alura.aluraesporte:id/input_nome").send_keys("gabriel")
    $driver.find_element(:id, "br.com.alura.aluraesporte:id/input_senha").send_keys("123Mud@r")
    $driver.find_element(:id, "br.com.alura.aluraesporte:id/input_confirmar_senha").send_keys("123Mud@r")
    $driver.find_element(:id, "br.com.alura.aluraesporte:id/cadastro_usuario_botao_cadastrar").click
  end

end
