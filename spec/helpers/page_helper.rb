Dir[File.join(File.dirname(__FILE__),'../tests/screens/*.rb')].each { |file| require file }

# Modulos para chamar as classes instanciadas
module Pages

  puts "Pages"
  def page_register
    RegisterUser.new
  end
end
