@echo off
setlocal
title Ativar Plano de Energia - Maximo Desempenho
color 0A

echo ============================================================
echo  Ativar Plano de Energia: Maximo Desempenho
echo  (Ultimate Performance - escondido por padrao no Windows)
echo ============================================================
echo.

echo Ativando plano de energia Ultimate Performance...
powercfg -duplicatescheme e9a42b02-d5df-448d-aa00-03f14749eb61

echo.
echo Para selecionar o plano:
echo  Painel de Controle > Opcoes de energia > Maximo Desempenho
echo.
echo ============================================================
echo  Plano habilitado com sucesso!
echo ============================================================
pause
endlocal
