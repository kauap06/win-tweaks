@echo off
setlocal
title Timer Resolution - Melhorar Latencia
color 0E

echo ============================================================
echo  Timer Resolution - Melhorar Latencia do Sistema
echo  Combina: Melhorar Latencia.bat + Diminuir Tempo Resposta.cmd
echo  (eram identicos - agora unificados)
echo ============================================================
echo.

echo [1/3] Ativando platform tick (timer de hardware preciso)...
bcdedit /set useplatformtick yes
echo.

echo [2/3] Desativando dynamic tick (evita variacao no timer)...
bcdedit /set disabledynamictick yes
echo.

echo [3/3] Removendo platform clock (usa tick de hardware em vez de HPET)...
bcdedit /deletevalue useplatformclock
echo.

echo ============================================================
echo  Timer Resolution aplicado! Reinicie o PC para ativar.
echo ============================================================
pause
endlocal
