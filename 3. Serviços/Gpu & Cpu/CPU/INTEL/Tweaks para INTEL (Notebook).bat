@echo off

echo - Resfriamento da CPU no modo ATIVO (Notebook na tomada)
powercfg /setACvalueindex scheme_current SUB_PROCESSOR SYSCOOLPOL 1
powercfg /setactive SCHEME_CURRENT

echo - Intervalo de checagem de performance (resposta mais rapida)
powercfg /setacvalueindex scheme_current 54533251-82be-4824-96c1-47b60b740d00 4d2b0152-7d5c-498b-88e2-34345392a2c5 5000
powercfg /setactive scheme_current

echo - Core Parking OFF (Notebook na tomada) - mais estabilidade de FPS
powercfg -setacvalueindex scheme_current sub_processor CPMINCORES 100
powercfg /setactive SCHEME_CURRENT