@echo off

echo [INTEL] Voltando tweaks da GPU Intel pro padrao
for /f %%t in ('Reg query "HKLM\System\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}" /t REG_SZ /s /e /f "Intel" ^| findstr "HKEY"') do (

	reg add "%%t" /v "Disable_OverlayDSQualityEnhancement" /t REG_DWORD /d "0" /f
    reg add "%%t" /v "IncreaseFixedSegment" /t REG_DWORD /d "0" /f
    reg add "%%t" /v "AdaptiveVsyncEnabled" /t REG_DWORD /d "1" /f
    reg add "%%t" /v "DisablePFonDP" /t REG_DWORD /d "0" /f
    reg add "%%t" /v "EnableCompensationForDVI" /t REG_DWORD /d "0" /f
    reg add "%%t" /v "NoFastLinkTrainingForeDP" /t REG_DWORD /d "1" /f
)

echo [OK] Restore da Intel aplicado
echo.