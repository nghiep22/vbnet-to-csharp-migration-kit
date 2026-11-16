---
name: vb-port-services
description: "Migrate VB.NET Windows Services, batch jobs, WCF or ASMX services to an explicitly selected .NET 8 hosting and contract model, preserving lifecycle, schedules, operations and data effects."
license: MIT
metadata:
  short-description: "Preserve service lifecycle and contracts"
---

# VB Service Migration

Bản thiết kế chưa kiểm chứng trên ứng dụng thật. Thực hiện trong phạm vi người dùng giao và chỉ dùng công cụ thực sự có trong phiên.

## Đầu vào

Service/job inventory, consumer/binding/security contracts, lifecycle baseline và hosting decisions.

## Đầu ra

Worker/service/operation mapping, compatibility decisions và lifecycle/contract parity results.

## Quy trình

1. Phân loại ServiceBase/Worker/batch và svc/asmx SOAP; kiểm kê timer/scheduler, message endpoints, operation contracts và service account.
2. Đối chiếu start/stop/pause/shutdown, cancellation, retry, concurrent job, idempotency, recovery, working directory và config/log.
3. Với Windows Service, chọn Worker/Generic Host giữ Windows khi cần; test state/job output trước khi đổi mô hình triển khai.
4. Với WCF/ASMX, ghi binding, SOAP action, namespaces, fault, serializer, security và consumer. CoreWCF cần compatibility POC; REST/gRPC chỉ khi contract change nằm trong plan.
5. Chuyển logic bằng quy tắc VB và hosting đã chọn; giữ data/output semantics. Không silently drop unsupported operations.
6. Chạy lifecycle/job và integration contract tests, gồm lỗi/retry/restart. Cài/khởi động service ngoài môi trường test cần nằm trong phạm vi người dùng đã giao.

## Kiểm tra kết quả

- Consumer contract thay đổi có decision và migration path.
- Start/stop/cancel/retry và side effects có test, không chỉ host build.
- Unsupported binding/security/operation hiện rõ, không bỏ qua để báo pass.

## Đọc khi cần

Khi thực hiện skill này, đọc [hướng dẫn chuyên biệt](references/guide.md) để chọn case, bằng chứng và tiêu chí hoàn tất phù hợp.
