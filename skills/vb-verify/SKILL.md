---
name: vb-verify
description: "Verify a VB.NET-to-C# .NET 8 migration against an independent legacy baseline using semantic, data, contract, UI and lifecycle checks. Use to distinguish build success from demonstrated behavioral parity."
license: MIT
metadata:
  short-description: "Compare legacy and migrated app behavior"
---

# VB Migration Verification

Bản thiết kế chưa kiểm chứng trên ứng dụng thật. Thực hiện trong phạm vi người dùng giao và chỉ dùng công cụ thực sự có trong phiên.

## Đầu vào

Source/target snapshots, plan acceptance, baseline độc lập và test environment.

## Đầu ra

Verification cases với pass/fail/not-run, evidence, expected/actual và sai khác còn lại.

## Quy trình

1. Xác định baseline còn đúng source/config/toolchain. Nếu stale hoặc synthetic example, không dùng làm bằng chứng app thật.
2. Build/publish đúng target/platform; chạy existing tests và semantic cases cho các construct thực sự gặp trong conversion.
3. Cho VB và C# cùng input/environment; so output, exceptions, ordering và side effects. Chỉ normalize nondeterminism đã có decision.
4. Chạy profile checks: WinForms designer/UI/event/binding; web HTTP/auth/session/UI; service contracts/lifecycle; data/interop/reporting.
5. Đối soát public API, resources và mọi file trong scope; phát hiện placeholder, ignored tests hoặc unsupported constructs chưa xử lý.
6. Lưu command/exit code/log/trace/diff và kết quả rõ ràng. Môi trường không có runner hoặc dependency là not-run; không sửa assertion để xanh.

## Kiểm tra kết quả

- Pass gắn với case đã thực sự chạy và evidence hiện có.
- Coverage thiếu và lỗi integration đều còn trong báo cáo.
- Build-only không nâng lên verified-complete.

## Đọc khi cần

[Hướng dẫn chuyên biệt](references/guide.md) giải thích quyết định, ca biên và giới hạn của bước này. Đọc khi thực hiện phần tương ứng.
