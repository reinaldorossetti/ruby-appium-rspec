Foi criado esse projeto com intuito de mostrar o appium lib core e rspec.


Pré-requisito:
[Instalar Ruby](https://github.com/oneclick/rubyinstaller2/releases/download/RubyInstaller-3.0.6-1/rubyinstaller-devkit-3.0.6-1-x64.exe)

### 1. Para subir o servido localmente com NPM

Start Appium server (Appium 2.0 base)  
```sh
npm install --location=global appium  
appium driver install xcuitest  
appium driver install uiautomator2  
appium --base-path=/wd/hub --relaxed-security --allow-cors # To run all tests in local  
```

Para baixar o projeto:  
```sh
git clone https://github.com/reinaldorossetti/ruby-appium-rspec.git  
```

Comando para instalar as bibliotecas:  
```
gem install bundler   
gem update --system  
bundle update --bundler
bundle install  
```

Comando para rodar os testes da feature de usuários:  
```
bundle exec rspec ./spec/tests/**/*.* --format AllureRspecFormatter  
```
Para visualizar o relatório gerado do allure report, segue o link abaixo:
```
https://reinaldorossetti.github.io/ruby-appium-rspec/  
```

Referências:  
https://github.com/appium/ruby_lib_core  
https://appium.readthedocs.io/en/stable/en/commands/README/  
https://appium.readthedocs.io/en/stable/en/commands/element/find-element/  