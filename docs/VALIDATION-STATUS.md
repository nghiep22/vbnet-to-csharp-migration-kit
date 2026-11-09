# Trạng thái kiểm chứng

Ngày công bố bản đầu: 09/11/2026. Release status: **design-only**.

| Hạng mục | Trạng thái |
| --- | --- |
| 12 SKILL.md và metadata | Có nội dung; kiểm tra cấu trúc theo script trong repo |
| Schema và ví dụ JSON tổng hợp | Kiểm tra cú pháp/hợp đồng bằng Test-Kit; không phải dữ liệu ứng dụng |
| Đường dẫn nội bộ tài liệu | Kiểm tra bằng Test-Kit |
| Helper static inventory | Mới kiểm tra cú pháp; chưa chạy khảo sát ứng dụng; không có Roslyn semantic analysis |
| Cài skill vào dự án người dùng | Chưa thực hiện |
| Skill chạy qua agent trên ứng dụng thật | Chưa thực hiện |
| Converter adapter và CLI vbm | Chưa triển khai |
| Build/chạy fixture VB và bản C# tương đương | Chưa thực hiện |
| WinForms designer, UI, web, service và DB parity | Chưa thực hiện |
| Benchmark hoặc chứng nhận automation rate | Chưa có |

Test-Kit chỉ đo cấu trúc repo, không xác nhận skill có quyết định đúng hay migration bảo toàn nghiệp vụ. Không nâng trạng thái trên chỉ vì CI xanh. Khi có thử nghiệm mới, ghi command, source revision, toolchain, môi trường, exit code và artifact thực tế.

## Kiểm tra cục bộ của bản đầu

- Test-Kit.ps1: pass cho 12 skill, 6 ví dụ schema, liên kết nội bộ và cú pháp PowerShell.
- Install-Skills.ps1 với hai skill và -WhatIf: pass; không chép/cài vào dự án nào.
- Chưa chạy fixture VB, converter hoặc khảo sát source ứng dụng.
