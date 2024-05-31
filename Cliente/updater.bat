@echo off
set "source_folder=SPMP3"
set "destination_folder=%~dp0"

:: Terminar o processo SPMP3.exe
taskkill /f /im SPMP3.exe >nul 2>&1

:: Aguardar um momento para garantir que o processo seja encerrado completamente
timeout /t 2 /nobreak >nul

:: Criar a pasta de destino, se não existir
rem if not exist "%destination_folder%" mkdir "%destination_folder%"

:: Copiar os arquivos da pasta de origem para a pasta de destino, sobrescrevendo sem perguntar
xcopy /s /i /y "%source_folder%\*" "%destination_folder%"

:: Excluir a pasta SPMP3 e todo o seu conteúdo
rmdir /s /q "%source_folder%"

:: Excluir o arquivo SPMP3.zip sem perguntar
del /q "%destination_folder%\SPMP3.zip"

:: Executar o arquivo SPMP3.exe
start "" "%destination_folder%\SPMP3.exe"
