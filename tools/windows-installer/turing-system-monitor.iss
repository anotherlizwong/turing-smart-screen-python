; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

#define SourceDir "..\..\dist\turing-system-monitor\"
#define IconDir "..\..\res\icons\monitor-icon-17865\"
#define WizardDir "..\..\tools\windows-installer\"

#define MyAppName "Turing System Monitor"
#define MyAppVersion GetStringFileInfo(SourceDir + "main.exe", PRODUCT_VERSION)
#define MyAppPublisher "Matthieu Houdebine"
#define MyAppURL "https://github.com/mathoudebine/turing-smart-screen-python"

[Setup]
; NOTE: The value of AppId uniquely identifies this application. Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{5D52BFDE-9A40-4BFA-84F8-89A64B01A2AC}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}/wiki
AppUpdatesURL={#MyAppURL}/releases
DefaultDirName={autopf}\{#MyAppName}
DefaultGroupName={#MyAppName}
OutputBaseFilename=turing-system-monitor-{#MyAppVersion}
AllowNoIcons=yes
PrivilegesRequired=lowest
Compression=lzma
SolidCompression=yes
WizardStyle=modern
WizardImageFile={#WizardDir}*.bmp
WizardSmallImageFile={#IconDir}*.bmp
SetupIconFile={#IconDir}icon.ico
LicenseFile=..\..\LICENSE
InfoBeforeFile={#WizardDir}Disclaimer.rtf

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"
Name: "armenian"; MessagesFile: "compiler:Languages\Armenian.isl"
Name: "brazilianportuguese"; MessagesFile: "compiler:Languages\BrazilianPortuguese.isl"
Name: "bulgarian"; MessagesFile: "compiler:Languages\Bulgarian.isl"
Name: "catalan"; MessagesFile: "compiler:Languages\Catalan.isl"
Name: "corsican"; MessagesFile: "compiler:Languages\Corsican.isl"
Name: "czech"; MessagesFile: "compiler:Languages\Czech.isl"
Name: "danish"; MessagesFile: "compiler:Languages\Danish.isl"
Name: "dutch"; MessagesFile: "compiler:Languages\Dutch.isl"
Name: "finnish"; MessagesFile: "compiler:Languages\Finnish.isl"
Name: "french"; MessagesFile: "compiler:Languages\French.isl"
Name: "german"; MessagesFile: "compiler:Languages\German.isl"
Name: "hebrew"; MessagesFile: "compiler:Languages\Hebrew.isl"
Name: "icelandic"; MessagesFile: "compiler:Languages\Icelandic.isl"
Name: "italian"; MessagesFile: "compiler:Languages\Italian.isl"
Name: "japanese"; MessagesFile: "compiler:Languages\Japanese.isl"
Name: "norwegian"; MessagesFile: "compiler:Languages\Norwegian.isl"
Name: "polish"; MessagesFile: "compiler:Languages\Polish.isl"
Name: "portuguese"; MessagesFile: "compiler:Languages\Portuguese.isl"
Name: "russian"; MessagesFile: "compiler:Languages\Russian.isl"
Name: "slovak"; MessagesFile: "compiler:Languages\Slovak.isl"
Name: "slovenian"; MessagesFile: "compiler:Languages\Slovenian.isl"
Name: "spanish"; MessagesFile: "compiler:Languages\Spanish.isl"
Name: "turkish"; MessagesFile: "compiler:Languages\Turkish.isl"
Name: "ukrainian"; MessagesFile: "compiler:Languages\Ukrainian.isl"

[Types]
Name: "default"; Description: "Default installation"; Flags: iscustom

[Components]
Name: "program"; Description: "Turing System Monitor software"; Flags: fixed; Types: default
Name: "themes"; Description: "Default themes (local changes will be lost! - custom themes are preserved)"; Types: default
Name: "config"; Description: "Default configuration"; Types: default

[Files]
Source: "{#SourceDir}*"; Excludes: "config.yaml,themes"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs; Components: program
Source: "{#SourceDir}config.yaml"; DestDir: "{app}"; Flags: ignoreversion; Components: config
Source: "{#SourceDir}res\themes\*"; Excludes: "--Theme examples"; DestDir: "{app}\res\themes\"; Flags: ignoreversion recursesubdirs; Components: themes
; NOTE: Don't use "Flags: ignoreversion" on any shared system files

[Icons]
Name: "{group}\{cm:ProgramOnTheWeb,{#MyAppName}}"; Filename: "{#MyAppURL}"
Name: "{group}\{cm:UninstallProgram,{#MyAppName}}"; Filename: "{uninstallexe}"
Name: "{group}\Turing System Monitor"; Filename: "{app}\configure.exe"

[Code]
function IsUpgrade: Boolean;
var
    Value: string;
    UninstallKey: string;
begin
    UninstallKey := 'Software\Microsoft\Windows\CurrentVersion\Uninstall\' +
        ExpandConstant('{#SetupSetting("AppId")}') + '_is1';
    Result := (RegQueryStringValue(HKLM, UninstallKey, 'UninstallString', Value) or
        RegQueryStringValue(HKCU, UninstallKey, 'UninstallString', Value)) and (Value <> '');
end;

(* Skip components page when first installation: install all components *)
function ShouldSkipPage(PageID: Integer): Boolean;
begin
  Result := (PageID = wpSelectComponents) and not IsUpgrade;
end;

procedure InitializeWizard;
begin
  if IsUpgrade then begin
    Log('Upgrade detected');
    WizardSelectComponents('program !themes, !config');
    end
  else begin
    Log('First installation');
    WizardSelectComponents('program themes config');
  end;
end;
