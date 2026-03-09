@echo off
setlocal
title Desativar Servicos Desnecessarios
color 0A

echo ============================================================
echo  Desativar Servicos Desnecessarios
echo  Combina dois scripts originais + adiciona sc stop
echo ============================================================
echo.

echo [1/7] Telemetria e diagnostico...
sc config "DiagTrack" start= disabled && sc stop "DiagTrack" >nul 2>&1
sc config "dmwappushservice" start= disabled && sc stop "dmwappushservice" >nul 2>&1
sc config "diagsvc" start= disabled && sc stop "diagsvc" >nul 2>&1
sc config "DPS" start= disabled && sc stop "DPS" >nul 2>&1
sc config "diagnosticshub.standardcollector.service" start= disabled >nul 2>&1
sc config "WdiServiceHost" start= disabled >nul 2>&1
sc config "WdiSystemHost" start= disabled >nul 2>&1
echo [OK]

echo [2/7] Relatorio de erros e compatibilidade...
sc config "WerSvc" start= disabled && sc stop "WerSvc" >nul 2>&1
sc config "PcaSvc" start= disabled && sc stop "PcaSvc" >nul 2>&1
sc config "Wecsvc" start= disabled && sc stop "Wecsvc" >nul 2>&1
echo [OK]

echo [3/7] Gerenciador de mapas e busca...
sc config "MapsBroker" start= disabled && sc stop "MapsBroker" >nul 2>&1
sc config "wsearch" start= disabled && sc stop "wsearch" >nul 2>&1
echo [OK]

echo [4/7] Performance visual e biometria...
sc config "WbioSrvc" start= disabled && sc stop "WbioSrvc" >nul 2>&1
sc config "FontCache" start= disabled && sc stop "FontCache" >nul 2>&1
sc config "GraphicsPerfSvc" start= disabled && sc stop "GraphicsPerfSvc" >nul 2>&1
sc config "stisvc" start= disabled && sc stop "stisvc" >nul 2>&1
echo [OK]

echo [5/7] Superfetch / SysMain...
sc config "SysMain" start= disabled && sc stop "SysMain" >nul 2>&1
echo [OK]

echo [6/7] Xbox (descomente se nao usar Xbox/Game Pass)...
rem sc config "XblGameSave" start= disabled
rem sc config "XboxNetApiSvc" start= disabled
rem sc config "XboxGipSvc" start= disabled
rem sc config "XblAuthManager" start= disabled
echo [SKIP] Xbox services mantidos (descomente no script para desativar)

echo [7/7] Impressora e Bluetooth (descomente se nao usar)...
rem sc config "Spooler" start= disabled
rem sc config "PrintNotify" start= disabled
rem sc config "BTAGService" start= disabled
rem sc config "bthserv" start= disabled
echo [SKIP] Impressora/Bluetooth mantidos (descomente no script para desativar)

echo.
echo ============================================================
echo  Concluido! Reinicie o PC para aplicar completamente.
echo ============================================================
pause
endlocal
