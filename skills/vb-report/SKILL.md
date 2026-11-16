---
name: vb-report
description: "Produce a source-backed assessment or migration handoff report from VB.NET-to-C# .NET 8 artifacts, reconciling tasks, files, decisions and pass/fail/not-run evidence without inventing completion claims."
license: MIT
metadata:
  short-description: "Report migration scope and evidence"
---

# VB Migration Reporting

Bản thiết kế chưa kiểm chứng trên ứng dụng thật. Thực hiện trong phạm vi người dùng giao và chỉ dùng công cụ thực sự có trong phiên.

## Đầu vào

Artifact manifest, assessment/plan/state/mapping và verification results hiện có.

## Đầu ra

Báo cáo hiện trạng/migration, completion accounting, unresolved decisions và bước kế tiếp.

## Quy trình

1. Đọc manifest và đối chiếu source/tool snapshot của từng artifact. Gắn stale/missing khi chúng không khớp.
2. Sinh số liệu từ dữ liệu có schema; phân biệt synthetic example, static assessment, build-tested và behavior-tested.
3. Đối soát task status và mọi file/resource trong scope: converted, retained, pending hoặc excluded có decision. Còn VB thực thi trong scope thì báo partial.
4. Tổng hợp rule/risk, converter/toolchain, strategy và quyết định thay UI/contract. Gắn evidence cho nhận định quan trọng.
5. Liệt kê pass/fail/not-run theo lớp kiểm chứng, thay đổi chưa verify, dependency thiếu và giới hạn dữ liệu/source.
6. Bàn giao task kế tiếp, cách tái chạy và rollback boundary; không tự publish/deploy hoặc đưa source khách hàng lên repo để hoàn thiện report.

## Kiểm tra kết quả

- Không có số liệu pass/coverage/automation rate không đo.
- Không bỏ fail/not-run hoặc source chưa chuyển khỏi summary.
- Design-only không bị báo như migration đã chạy.

## Đọc khi cần

Khi thực hiện skill này, đọc [hướng dẫn chuyên biệt](references/guide.md) để chọn case, bằng chứng và tiêu chí hoàn tất phù hợp.
