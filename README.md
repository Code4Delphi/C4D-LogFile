#  C4D-LogFile - Geração de logs em arquivos
<p align="center">
  <a href="https://github.com/Code4Delphi/Code4D-Wizard/blob/master/Images/C4D-Logo.png">
    <img alt="Code4Delphi" height="100" src="https://github.com/Code4Delphi/Code4D-Wizard/blob/master/Images/c4d-logo-100x100.png">
  </a> 
</p>
Com o C4D-LogFile, você pode gravar logs em arquivos, de forma rápida e simples de qualquer lugar de seu sistema. 



## 📞 Contacts

<p align="left">
  <a href="https://t.me/Code4DelphiDevs" target="_blank">
    <img src="https://img.shields.io/badge/Telegram:-Join%20Channel-blue?logo=telegram">
  </a> 
  &nbsp;
  <a href="mailto:contato@code4delphi.com.br" target="_blank">
    <img src="https://img.shields.io/badge/E--mail-contato%40code4delphi.com.br-yellowgreen?logo=maildotru&logoColor=yellowgreen">
  </a>
   &nbsp;
  <a href="https://go.hotmart.com/U81331747Y?dp=1" target="_blank">
    <img src="https://img.shields.io/badge/Course:-Open%20Tools%20API-F00?logo=delphi">
  </a> 
   &nbsp;
  <a href="https://www.youtube.com/@code4delphi" target="_blank">
    <img src="https://img.shields.io/badge/YouTube:-Join%20Channel-red?logo=youtube&logoColor=red">
  </a> 
</p>



## ⚙️ Instalação

* Instalação usando o [**Boss**](https://github.com/HashLoad/boss):

```
boss install github.com/Code4Delphi/C4D-LogFile
```

* **Instalação manual**: Abra seu Delphi e adicione a seguinte pasta ao seu projeto, em *Project > Options > Resource Compiler > Directories and Conditionals > Include file search path*

```
..\C4D-LogFile\Src
```



## 🚀 Como usar
* Adicione a uses a seu sistema:
```
uses
  C4D.LogFile;
```

* Configure a pasta que recebera os arquivos de logs gerados (esta pasta pode ser setada apenas uma única vez, no Create do projeto por exemplo, ou pode ser alterada sempre que desejado):
```
C4DLogFile.SetDir('C:\PastaDeLogs');
```

* Enviando os dados para serem salvos no arquivo:
```
C4DLogFile.AddLog('Texto adicionado no log para teste');
```


## ⌨️ Demo
* Junto aos fontes do projeto, você encontrara um projeto teste, na pasta:
```
..\C4D-LogFile\Samples\Demo01
```


