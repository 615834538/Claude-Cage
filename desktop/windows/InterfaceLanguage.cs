using System.Text.Json;

namespace Cage.Windows;

internal static class InterfaceLanguage
{
    private static Dictionary<string, string> messages = new();

    public static async Task Refresh()
    {
        try
        {
            var (exit, data) = await Backend.Json(["interface-language", "--json"], deadline: TimeSpan.FromSeconds(3)).ConfigureAwait(false);
            if (exit == 0 && data.TryGetProperty("messages", out var value))
                messages = value.Deserialize<Dictionary<string, string>>() ?? new();
        }
        catch (Exception error) when (error is IOException or UnauthorizedAccessException or OperationCanceledException or JsonException or System.ComponentModel.Win32Exception)
        {
            // An incomplete installation can still display the recovery UI.
        }
    }

    public static string Text(string source) => messages.GetValueOrDefault(source, source);
}
