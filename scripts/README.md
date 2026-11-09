# Helper scripts

Yêu cầu PowerShell 7. Không có converter hoặc lệnh vbm trong thư mục này.

| Script | Chức năng | Giới hạn |
| --- | --- | --- |
| Test-Kit.ps1 | Skill metadata, local links, schema/examples, PS syntax | Kiểm tra cấu trúc, không kiểm chứng migration |
| Install-Skills.ps1 | Chép skill mới vào project .agents/skills; hỗ trợ WhatIf | Không ghi đè; chưa xác nhận host discovery |
| Get-StaticInventory.ps1 | XML/file inventory sơ bộ, output JSON mới | Experimental; không MSBuild/Roslyn, không resolve hay convert |

~~~powershell
pwsh -NoProfile -File ./scripts/Get-StaticInventory.ps1 -SourcePath 'C:\Projects\LegacyApp' -OutFile 'C:\Reports\inventory.json'
~~~

OutFile phải chưa tồn tại. Helper không chạy build hay restore. Target declarations là XML chưa evaluate; workloadHints cần review. Source có thể chứa dự án lồng nhau, project XML lỗi hoặc references động mà helper không hiểu. Không đưa output có dữ liệu riêng lên repo công khai.
