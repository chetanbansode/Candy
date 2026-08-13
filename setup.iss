[Setup]
AppId={{CANDY-APP-GUID}}
AppName=Candy
AppVersion=1.0.2
AppVerName=Candy v1.0.2
UninstallDisplayName=Candy
AppPublisher=Chetan Bansode
UninstallDisplayIcon={app}\Candy.exe
DefaultDirName={autopf}\Candy
ArchitecturesInstallIn64BitMode=x64
OutputDir=P:\yt-dlp gui\Output
OutputBaseFilename=CandyInstaller_v1.0.2
Compression=lzma2/ultra64
SolidCompression=yes
SetupIconFile=P:\yt-dlp gui\universal.ico
DisableProgramGroupPage=yes

[Types]
Name: "full"; Description: "Full installation (Recommended)"
Name: "custom"; Description: "Custom installation"; Flags: iscustom

[Components]
Name: "main"; Description: "Candy Application Files"; Types: full custom; Flags: fixed
Name: "ytdlp"; Description: "yt-dlp (Download Engine)"; Types: full
Name: "ffmpeg"; Description: "FFmpeg (Media Remuxer Engine)"; Types: full

[Files]
Source: "P:\yt-dlp gui\bin\Release\net8.0-windows\win-x64\publish\Candy.exe"; DestDir: "{app}"; Flags: ignoreversion; Components: main
Source: "P:\yt-dlp gui\yt-dlp.exe"; DestDir: "{app}\tools"; Flags: ignoreversion skipifsourcedoesntexist; Components: ytdlp
Source: "P:\yt-dlp gui\ffmpeg.exe"; DestDir: "{app}\tools"; Flags: ignoreversion skipifsourcedoesntexist; Components: ffmpeg

[Icons]
Name: "{autoprograms}\Candy"; Filename: "{app}\Candy.exe"
Name: "{autodesktop}\Candy"; Filename: "{app}\Candy.exe"

[Run]
Filename: "{app}\Candy.exe"; Description: "Launch Candy"; Flags: nowait postinstall skipifsilent
