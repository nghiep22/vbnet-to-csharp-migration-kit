# Cài bộ skill

## Codex

Installer PowerShell 7 chép toàn bộ skill vào <project>/.agents/skills, hoặc chọn danh sách bằng -Skills. Nó chỉ cài mới và không ghi đè skill đã tồn tại. Dùng -WhatIf trước khi cần xem đích. Mở phiên mới hoặc tải lại skill theo host nếu cần.

~~~powershell
pwsh -NoProfile -File ./scripts/Install-Skills.ps1 -ProjectPath 'C:\Projects\LegacyApp' -Skills vb-assess,vb-plan -WhatIf
~~~

Có thể đọc SKILL.md trực tiếp rồi đưa đường dẫn cho agent, không cần chạy installer. Mỗi skill mang reference riêng để hoạt động sau khi chép.

## Host khác

Agent Skills dùng SKILL.md với name/description top-level. Với Claude/Copilot/Cursor, tham khảo đường dẫn discovery hiện hành của host rồi chép đúng folder skill. Bản đầu chưa thử host-specific discovery, agent file hoặc MCP integration; không hứa tương thích chỉ vì cùng định dạng Markdown.

Không có marketplace manifest được chứng nhận hay bộ converter tự cài. Không dán credential vào skill. Cài skill không đồng nghĩa đã cấp quyền push/deploy/chuyển dữ liệu của ứng dụng.

Nguồn cấu trúc skill: [OpenAI Docs](https://developers.openai.com/plugins/concepts/skills).
