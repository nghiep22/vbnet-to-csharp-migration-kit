# VB.NET → C# .NET 8 Migration Kit

**Bản thiết kế v0.1 — chưa kiểm chứng migration thực tế.** Bộ skill và tài liệu cho agent khảo sát, lập kế hoạch và hướng dẫn chuyển ứng dụng VB.NET sang C# .NET 8, theo các profile WinForms, web, service và class library.

Repo hiện cung cấp **12 skill, tài liệu kỹ thuật, schema, mẫu báo cáo, script kiểm tra cấu trúc và script khảo sát tĩnh thử nghiệm**. CLI migration, converter adapter, kiểm chứng tương đương và chuyển UI/service end-to-end là đặc tả cần triển khai. Các ví dụ JSON là dữ liệu tổng hợp; chúng không phải kết quả migration thành công.

## Bắt đầu

1. Đọc [phạm vi hỗ trợ](docs/SUPPORT-MATRIX.md) và [trạng thái kiểm chứng](docs/VALIDATION-STATUS.md).
2. Clone repo và kiểm tra cấu trúc bằng PowerShell 7:

~~~powershell
pwsh -NoProfile -File ./scripts/Test-Kit.ps1
~~~

3. Xem trước việc cài skill vào một dự án Codex:

~~~powershell
pwsh -NoProfile -File ./scripts/Install-Skills.ps1 -ProjectPath 'C:\Projects\LegacyApp' -WhatIf
pwsh -NoProfile -File ./scripts/Install-Skills.ps1 -ProjectPath 'C:\Projects\LegacyApp'
~~~

Installer chép skill vào thư mục dự án **.agents/skills/**; dừng nếu tên skill đã tồn tại. Không sửa source ứng dụng. Mở phiên agent mới nếu host chưa tải skill vừa cài. Với host khác, xem [hướng dẫn cài](docs/INSTALLATION.md).

4. Bắt đầu bằng yêu cầu khảo sát:

~~~text
Dùng $vb-assess để khảo sát solution này cho mục tiêu C# .NET 8.
Chỉ tạo hồ sơ khảo sát trong thư mục migration; ghi rõ bằng chứng,
reference chưa resolve và phần chưa kiểm chứng. Chưa chuyển đổi source.
~~~

## Bộ skill

| Skill | Mục đích |
| --- | --- |
| [vb-migrate](skills/vb-migrate/SKILL.md) | Điều phối toàn bộ quá trình và resume |
| [vb-assess](skills/vb-assess/SKILL.md) | Kiểm kê source, phụ thuộc, chức năng và rủi ro |
| [vb-baseline](skills/vb-baseline/SKILL.md) | Ghi nhận hành vi VB tham chiếu |
| [vb-plan](skills/vb-plan/SKILL.md) | Lập task và thứ tự theo phụ thuộc |
| [vb-convert](skills/vb-convert/SKILL.md) | Hướng dẫn chuyển VB sang C# có bảo toàn ngữ nghĩa |
| [vb-port-net8](skills/vb-port-net8/SKILL.md) | Chuyển project, API và package lên .NET 8 |
| [vb-port-winforms](skills/vb-port-winforms/SKILL.md) | Designer, event, resource, binding và startup |
| [vb-port-web](skills/vb-port-web/SKILL.md) | MVC/Web API/Web Forms theo đích đã chọn |
| [vb-port-services](skills/vb-port-services/SKILL.md) | Windows Service, batch, WCF và ASMX |
| [vb-port-data-interop](skills/vb-port-data-interop/SKILL.md) | DataSet, DB, COM/native và reporting |
| [vb-verify](skills/vb-verify/SKILL.md) | Đối chiếu kết quả, hợp đồng và side effect |
| [vb-report](skills/vb-report/SKILL.md) | Tổng hợp bằng chứng và phạm vi hoàn thành |

Các skill thực thi cần được gọi trong phạm vi người dùng đã giao. Repo này không chứng nhận agent hoặc converter có thể xử lý mọi dự án. Không có lệnh **vbm** được cài từ repo; đó là [giao diện dự kiến](docs/CLI-CONTRACT.md).

## Đầu ra ứng dụng

- C# trên **net8.0**, hoặc **net8.0-windows** nếu cần Windows.
- WinForms giữ UI WinForms; web và service chọn kiến trúc theo hợp đồng thực tế.
- Hồ sơ khảo sát, risk register, plan, mapping file và báo cáo đối chiếu.
- Build thành công và kiểm chứng hành vi là hai mốc riêng.

Ngày đối chiếu nguồn: **09/11/2026**. Theo [lịch Microsoft](https://dotnet.microsoft.com/en-us/platform/support/policy/dotnet-core), .NET 8 hết hỗ trợ ngày **10/11/2026**. Target vẫn giữ theo cấu hình người dùng; không tự chuyển sang phiên bản mới.

## Tài liệu

- [Thiết kế tổng thể](docs/ARCHITECTURE.md)
- [Phân tích repo tham khảo](docs/RELATED-REPOSITORIES.md)
- [Quy trình và các mốc kiểm chứng](docs/WORKFLOW.md)
- [Hợp đồng artifact](docs/ARTIFACTS.md)
- [Ngữ nghĩa VB](docs/VB-SEMANTICS.md)
- [Quản lý toolchain](docs/TOOLCHAIN.md)
- [Lộ trình triển khai](docs/ROADMAP.md)
- [Mẫu khảo sát và kế hoạch](templates/README.md)
- [Đánh giá skill](evals/README.md)

## License


