@echo off

:: Nastavení a informace
SET verze=1.0
SET datum=02.09.2021
TITLE Shutdown script by Bazim.cz (v%verze% - %datum%)

:: Úvodní text
echo 1 = vypnout počítač
echo 2 = zrušit vypnutí počítače

:: Vynecháme řádek
echo.

:: Script
SET /P prikaz="Vyber příkaz: "

:: Zvolíme dle zadání uživatele
IF %prikaz%==1 (
	cls
	SET /P cas_do_vypnuti_pred="Čas do vypnutí (počet celých hodiny): "
	goto kontrola
)

IF %prikaz%==2 (
	shutdown.exe /a
)

:: Ukončíme script
:konec
exit

:: Kontrola zda-li dojde k vypnutí počítače za uživatelem zvolený čas
:kontrola
cls
SET /a cas_do_vypnuti_po=%cas_do_vypnuti_pred%*60*60
SET /a cas_do_vypnuti_po_minut=%cas_do_vypnuti_pred%*60
echo Počítač bude vypnut za %cas_do_vypnuti_po% sekund (= %cas_do_vypnuti_po_minut%m).
echo.
SET /p kontrola="Je to tak správně? (a/n): "

IF %kontrola%==a (
	goto vypnout
) ELSE (
	goto konec
)

:: Naplánování vypnutí počítače
:vypnout
shutdown.exe /s /f /t %cas_do_vypnuti_po%