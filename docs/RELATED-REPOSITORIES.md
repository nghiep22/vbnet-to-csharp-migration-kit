# Phân tích repo liên quan

Đọc tài liệu/source được dẫn tại thời điểm 09/11/2026; chưa cài và benchmark các repo dưới đây cho một ứng dụng khách hàng.

| Repo | Ưu điểm | Thiếu đối với mục tiêu VB → C# đa workload | Áp dụng |
| --- | --- | --- | --- |
| [LegacyDotnetAgentKit](https://github.com/Mohrimn/legacy-dotnet-agent-kit) | Behavior map, risk register, chia migration nhỏ | Scanner còn là kế hoạch; thiếu conversion engine riêng | Khảo sát có bằng chứng |
| [dotnet/skills](https://github.com/dotnet/skills) | Skill chuyên biệt, hạ tầng eval | Chưa là pipeline VB → C# hoàn chỉnh; [issue phạm vi](https://github.com/dotnet/skills/issues/380) | Skill gọn, eval thực tế |
| [DEFRA](https://github.com/DEFRA/lap-modernisation-agents) | Upgrade path, NuGet, build/report, profile đa loại | Instruction-only; metadata riêng ở file đã đọc; cần VB semantics/parity | Profile và artifact có cấu trúc |
| [Deep Wiki](https://github.com/microsoft/skills/blob/main/.github/plugins/deep-wiki/skills/wiki-researcher/SKILL.md) | Trace code, phân biệt fact/inference | Không phải converter/verifier migration | Chuẩn bằng chứng |
| [Tagout](https://github.com/phmatray/tagout/blob/main/skills/migrate-legacy/SKILL.md) | Baseline, gate, state và report | Dependency host/MCP; hỗ trợ ngữ nghĩa VB chưa được xác lập qua tài liệu đã đọc | Resume và checkpoint |
| [CodeConverter](https://github.com/icsharpcode/CodeConverter) | Roslyn VB/C#, chuyển project/solution | Chuyển ngôn ngữ chưa chuyển runtime/workload hay chứng minh nghiệp vụ | Adapter ứng viên, ghim phiên bản |
| [Microsoft upgrade agent](https://github.com/microsoft/upgrade-agent-plugins) | Assessment-plan-execution | Chưa xác lập converter VB/C# portable cho lõi của kit này | Workflow và adapter tùy chọn |

CodeConverter thay đổi yêu cầu runtime và hỗ trợ Framework giữa các bản CLI; VS extension có thể khác. [Changelog](https://github.com/icsharpcode/CodeConverter/blob/master/CHANGELOG.md) và [README](https://github.com/icsharpcode/CodeConverter/blob/master/README.md) là đầu vào của POC, chưa là kết quả kiểm chứng.

Khoảng trống cần giải quyết: inventory chuẩn; ngữ nghĩa VB; profile riêng; toolchain matrix; old/new parity; per-file accounting; state invalidation. Những nhận xét này giới hạn trong tài liệu đã xem, không thay thế đánh giá toàn bộ mã nguồn bên ngoài.
