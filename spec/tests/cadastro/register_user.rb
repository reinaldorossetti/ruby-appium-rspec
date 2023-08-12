describe 'Realizando testes da feature de usuario.' do

  it 'Cadastrar usuário de usuario no APP' do
    @driver.find_element(:id, "br.com.alura.aluraesporte:id/login_botao_cadastrar_usuario").click
    @driver.find_element(:id, "br.com.alura.aluraesporte:id/input_nome").send_keys("gabriel")
    @driver.find_element(:id, "br.com.alura.aluraesporte:id/input_senha").send_keys("123Mud@r")
    @driver.find_element(:id, "br.com.alura.aluraesporte:id/input_confirmar_senha").send_keys("123Mud@r")
    @driver.find_element(:id, "br.com.alura.aluraesporte:id/cadastro_usuario_botao_cadastrar").click
    #expect(@response_create_user.code).to eq 201
  end

end
