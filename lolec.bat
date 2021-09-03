@echo off

:: Nastavenˇ a informace
SET verze=1.0
SET datum=02.09.2021
TITLE Shutdown script by Bazim.cz (v%verze% - %datum%)

:: évodnˇ text
echo 1 = vypnout počítač
echo 2 = zruçit vypnutˇ poźˇtaźe

:: Vynech me ý dek
echo.

:: Script
SET /P prikaz="Vyber pýˇkaz: "

:: Zvolˇme dle zad nˇ u§ivatele
IF %prikaz%==1 (
	cls
	SET /P cas_do_vypnuti_pred="¬as do vypnutˇ (poźet celěch hodiny): "
	goto kontrola
)

IF %prikaz%==2 (
	shutdown.exe /a
)

:: Ukonźˇme script
:konec
exit

:: Kontrola zda-li dojde k vypnutˇ poźˇtaźe za u§ivatelem zvoleně źas
:kontrola
cls
SET /a cas_do_vypnuti_po=%cas_do_vypnuti_pred%*60*60
SET /a cas_do_vypnuti_po_minut=%cas_do_vypnuti_pred%*60
echo Poźˇtaź bude vypnut za %cas_do_vypnuti_po% sekund (= %cas_do_vypnuti_po_minut%m).
echo.
SET /p kontrola="Je to tak spr vnŘ? (a/n): "

IF %kontrola%==a (
	goto vypnout
) ELSE (
	goto konec
)

:: Napl nov nˇ vypnutˇ poźˇtaźe
:vypnout
shutdown.exe /s /f /t %cas_do_vypnuti_po%
