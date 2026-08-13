[Setup]
AppId={{CANDY-PLUS-APP-GUID}}
AppName=Candy Plus
AppVersion=1.0.2 Beta
AppVerName=Candy Plus v1.0.2
UninstallDisplayName=Candy Plus
AppPublisher=Chetan Bansode
UninstallDisplayIcon={app}\CandyPlus.exe
DefaultDirName={autopf}\Candy Plus
ArchitecturesInstallIn64BitMode=x64
OutputDir=P:\yt-dlp gui\Output
OutputBaseFilename=CandyPlusInstaller_v1.0.2_Beta
Compression=lzma2/ultra64
SolidCompression=yes
SetupIconFile=P:\yt-dlp gui\universal.ico
DisableProgramGroupPage=yes

[Types]
Name: "full"; Description: "Full installation (Recommended)"
Name: "custom"; Description: "Custom installation"; Flags: iscustom

[Components]
Name: "main"; Description: "Candy Plus Application Files"; Types: full custom; Flags: fixed
Name: "ytdlp"; Description: "yt-dlp (Download Engine)"; Types: full
Name: "ffmpeg"; Description: "FFmpeg (Media Remuxer Engine)"; Types: full

[Files]
Source: "P:\yt-dlp gui\bin\ReleasePlus\net8.0-windows\win-x64\publish\CandyPlus.exe"; DestDir: "{app}"; Flags: ignoreversion; Components: main
Source: "P:\yt-dlp gui\yt-dlp.exe"; DestDir: "{app}\tools"; Flags: ignoreversion skipifsourcedoesntexist; Components: ytdlp
Source: "P:\yt-dlp gui\ffmpeg.exe"; DestDir: "{app}\tools"; Flags: ignoreversion skipifsourcedoesntexist; Components: ffmpeg

[Icons]
Name: "{autoprograms}\Candy Plus"; Filename: "{app}\CandyPlus.exe"
Name: "{autodesktop}\Candy Plus"; Filename: "{app}\CandyPlus.exe"

[Run]
Filename: "{app}\CandyPlus.exe"; Description: "Launch Candy Plus"; Flags: nowait postinstall skipifsilent
