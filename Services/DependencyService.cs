using System;
using System.IO;
using System.IO.Compression;
using System.Net.Http;
using System.Threading.Tasks;

namespace YtDlpGui.Services
{
    public class DependencyService
    {
        private const string DenoDownloadUrl = "https://github.com/denoland/deno/releases/latest/download/deno-x86_64-pc-windows-msvc.zip";

        public static Task? EnsureDenoTask { get; private set; }

        public static void Initialize()
        {
            if (EnsureDenoTask == null)
            {
                EnsureDenoTask = EnsureDenoAsync();
            }
        }

        private static async Task EnsureDenoAsync()
        {
            try
            {
                var toolsDir = Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "tools");
                if (!Directory.Exists(toolsDir))
                    Directory.CreateDirectory(toolsDir);

                // Inject tools directory into the current process PATH so yt-dlp inherits it automatically
                var currentPath = Environment.GetEnvironmentVariable("PATH") ?? "";
                if (!currentPath.Contains(toolsDir, StringComparison.OrdinalIgnoreCase))
                {
                    Environment.SetEnvironmentVariable("PATH", toolsDir + Path.PathSeparator + currentPath);
                }

                var denoPath = Path.Combine(toolsDir, "deno.exe");
                if (File.Exists(denoPath))
                    return;

                var zipPath = Path.Combine(toolsDir, "deno.zip");

                using var client = new HttpClient();
                var response = await client.GetAsync(DenoDownloadUrl);
                response.EnsureSuccessStatusCode();

                using (var fs = new FileStream(zipPath, FileMode.Create, FileAccess.Write, FileShare.None))
                {
                    await response.Content.CopyToAsync(fs);
                }

                using (var archive = ZipFile.OpenRead(zipPath))
                {
                    var denoEntry = archive.GetEntry("deno.exe");
                    if (denoEntry != null)
                    {
                        denoEntry.ExtractToFile(denoPath, true);
                    }
                }

                if (File.Exists(zipPath))
                    File.Delete(zipPath);
            }
            catch
            {
                // Ignore silently
            }
        }
    }
}
